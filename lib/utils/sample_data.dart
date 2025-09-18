import '../models/animal.dart';

final List<Animal> sampleAnimals = List.generate(
  8,
      (i) => Animal(
    id: 'a\$i',
    name: ['Luna', 'Max', 'Bella', 'Charlie', 'Simba', 'Milo', 'Nala', 'Rocky'][i % 8],
    breed: ['Mix', 'Labrador', 'Beagle', 'Persa', 'Street', 'Schnauzer', 'Bulldog', 'Golden'][i % 8],
    age: ['2 meses', '1 año', '3 años', '6 meses', '4 años', '8 meses', '5 años', '2 años'][i % 8],
    imageUrl: 'https://picsum.photos/seed/pets\$i/400/400',
    featured: i % 4 == 0,
  ),
);