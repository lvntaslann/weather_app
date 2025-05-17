import 'dart:async';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:veri_tabi_calismasi/models/product_services.dart';

class DbHelper {
  //flutter nullsafety olduğu için ? işareti kullanılmalı yoksa hata verir
  Database? _db;

  // Database varsa çağırmak için bir fonksiyon, asenkron yapıda olduğu için future bir fonksiyon olmalı ve Database tipinde olmalı
  Future<Database> get db async {
    if (_db == null) {
      _db = await initializeDb();
    }
    return _db!;
  }

  // Database çağırmak için path kütüphanesiyle database yolunu getiriyoruz ve db'yi açıyoruz, yoksa oluşturuyoruz
  Future<Database> initializeDb() async {
    String dbPath = join(await getDatabasesPath(), "etrade.db");
    var eTradeDb = await openDatabase(dbPath, version: 1, onCreate: createDb);
    return eTradeDb;
  }

  // Database tipinde bir etrade.db adında database oluşturuyoruz ve içerisine products adında bir tablo oluşturuyoruz
  void createDb(Database db, int version) async {
    await db.execute(
        "CREATE TABLE products(id INTEGER PRIMARY KEY, name TEXT, description TEXT, unitPrice REAL)");
  }

  // Database'e bağlanıp tablodan bir query oluşturuyoruz, yani products tablosundaki verilere erişim sağlıyoruz
  // Sonrasında buradaki verileri Product tipinde bir listeyle tüm liste boyutu kadar her bir indexi döndürüyoruz
  Future<List<Product>> getProducts() async {
    Database db = await this.db;
    var results = await db.query("products");
    return List.generate(results.length, (index) {
      return Product.fromObject(results[index]);
    });
  }

  // Tabloya veri ekleme işlemi için girdi olarak Product servicesimizden veri almamız gerekiyor. İlk olarak database'e bağlanıp products tablosuna Product servicesimizdeki verileri map şeklinde ekliyoruz
  // Asenkron yapıda olduğu için future olarak çalışmalı, tipinin integer olması, böyle işlemler SQL'de genel olarak integer değer döndürüyor
  Future<int> insert(Product product) async {
    Database db = await this.db;
    var result = await db.insert("products", product.toMap());
    return result;
  }

  // Insert etme işlemine benzer yapı
  Future<int> delete(int id) async {
    Database db = await this.db;
    var result = await db.rawDelete("DELETE FROM products WHERE id = ?", [id]);
    return result;
  }

  // Insert ve delete işlemine benzer yapı
  // db.rawUpdate de kullanılabilirdi
  Future<int> update(Product product) async {
    Database db = await this.db;
    var result = await db.update("products", product.toMap(),
        where: "id = ?", whereArgs: [product.id]);
    return result;
  }
}
