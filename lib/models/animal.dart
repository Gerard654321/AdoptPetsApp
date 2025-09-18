class Animal {
  final String id;
  final String name;
  final String breed;
  final String age;
  final String imageUrl;
  final bool featured;


  Animal({
    required this.id,
    required this.name,
    required this.breed,
    required this.age,
    required this.imageUrl,
    this.featured = false,
  });
}