class Category {
  //product sınıfındaki ürünlerin her birinin kategorisi için parametreler oluşturuldu
  late int id;
  late String categoryName;
  late String seoUrl;

//Constructor  fonksiyon
  Category(this.id, this.categoryName, this.seoUrl);

  //jsondan mape dönüştürme işlemi
  Category.fromJson(Map json) {
    id = json["id"];
    categoryName = json["categoryName"];
    seoUrl = json["seoUrl"];
  }

  //mapten jsona dönüştürme işlemi
  Map toJson() {
    return {"id": id, "categoryName": categoryName, "seoUrl": seoUrl};
  }
}
