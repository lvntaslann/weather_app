class Food {
   String name;
   String description;
   String price;
   String image;

   Food({
    required this.name,
    required this.description,
    required this.price,
    required this.image,
   });

   static List<Food> getFood(){
    return [
      Food(name: "Hamburger", description: "Little hamburger", price: "\$10", image: "assets/hamburger.jpg"),
      Food(name: "Pizza", description: "Little pizza", price: "\$15", image: "assets/pizza.jpg"),
      Food(name: "Kebap", description: "Little kebap", price: "\$12", image: "assets/kebap.jpg"),
      Food(name: "Donut", description: "Little donut", price: "\$9", image: "assets/donut.jpg"),
      
    ];
   }
}