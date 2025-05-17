class Product {
  //istek oluşturacağımız json dosyasındaki product bilgilerini doldurduk
  late int id;
  late int categoryId;
  late String productName;
  late String quantityPerUnit;
  late double unitPrice;
  late int unitsInStock;

  Product(this.id, this.categoryId, this.productName, this.quantityPerUnit,
      this.unitPrice, this.unitsInStock);

  //jsondan gelen verilerin maplistt olarak dönüştürülmesi sağlandı
  Product.fromJson(Map json) {
    id = json["id"];
    categoryId = json["categoryId"];
    productName = json["productName"];
    quantityPerUnit = json["quantityPerUnit"];
    unitPrice = (json["unitPrice"] is int)
        ? json["unitPrice"].toDouble()
        : json["unitPrice"];
    unitsInStock = json["unitsInStock"];
  }

//jsondan mape dönüştürme işlemi
  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "categoryId": categoryId,
      "productName": productName,
      "quantityPerUnit": quantityPerUnit,
      "unitPrice": unitPrice,
      "unitsInStock": unitsInStock
    };
  }
}
