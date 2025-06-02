class Pet {
  final String name;
  final String type;
  final int age;
  final String imageUrl;

  Pet({
    required this.name,
    required this.type,
    required this.age,
    required this.imageUrl,
  });

  static List<Pet> getSamplePets(){
    return [
      Pet(name: "Karabaş", type: "Köpek", age: 3, imageUrl: "https://picsum.photos/200?random=1"),
      Pet(name: "Pamuk", type: "Kedi", age: 2, imageUrl: "https://picsum.photos/200?random=2"),
      Pet(name: "Maviş", type: "Kuş", age: 1, imageUrl: "https://picsum.photos/200?random=3"),
    ];
  }
}