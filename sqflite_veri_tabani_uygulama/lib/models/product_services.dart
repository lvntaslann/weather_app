class Product {
  //final ifadesi flutterın nullsafety özelliğinde dolayı parametrelerin constructor methodunda dolduralacağını ve null gelmeyeceğini belirtir
  final int? id;
  final String name;
  final String description;
  final double? unitPrice;

  // Constructor methodu
  Product({
    this.id,
    required this.name,
    required this.description,
    required this.unitPrice,
  });

  // Constructor methodu fakat id istenmemiş hali
  Product.withId({
    this.id,
    required this.name,
    required this.description,
    required this.unitPrice,
  });

  // Insert ve update işlemleri için map şeklinde Product sınıfımız içindeki verileri döndürmemiz gerekiyor
  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{};
    map["name"] = name;
    map["description"] = description;
    map["unitPrice"] = unitPrice;

    if (id != null) {
      map["id"] = id;
    }

    return map;
  }

  // getProducts fonksiyonunda verileri map'ten list şeklinde göstermek için objeye çevrilmesi gerekiyor, bu işlemi gerçekleştiriyoruz
  Product.fromObject(dynamic object)
      : id = int.tryParse(object["id"].toString()),
        name = object["name"],
        description = object["description"],
        unitPrice = double.tryParse(object["unitPrice"].toString());
}
