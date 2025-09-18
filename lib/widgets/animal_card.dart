import 'package:flutter/material.dart';
import '../models/animal.dart';

class AnimalCard extends StatelessWidget {
  final Animal animal;
  const AnimalCard({required this.animal, super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.of(context).push(
        PageRouteBuilder(
          pageBuilder: (_, __, ___) => AnimalDetail(animal: animal),
          transitionsBuilder: (_, anim, __, child) =>
              ScaleTransition(scale: anim, child: child),
        ),
      ),
      child: Card(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12)),
        elevation: 0,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Hero(
              tag: 'hero-${animal.id}',
              child: ClipRRect(
                borderRadius:
                const BorderRadius.vertical(top: Radius.circular(12)),
                child: Image.network(
                  animal.imageUrl,
                  height: 120, // 🔹 antes 140
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(animal.name,
                        style: Theme.of(context).textTheme.titleMedium,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis),
                    const SizedBox(height: 4),
                    Text('${animal.breed} • ${animal.age}',
                        style: Theme.of(context).textTheme.bodySmall,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis),
                    const Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(children: [
                          IconButton(
                              onPressed: () {},
                              icon: const Icon(Icons.favorite_border, size: 18)),
                          Text('Favorito',
                              style: Theme.of(context).textTheme.bodySmall),
                        ]),
                        ElevatedButton(
                            onPressed: () {}, child: const Text('Ver'))
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class AnimalDetail extends StatelessWidget {
  final Animal animal;
  const AnimalDetail({required this.animal, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.transparent, elevation: 0),
      body: Column(
        children: [
          Hero(
            tag: 'hero-${animal.id}',
            child: Image.network(
              animal.imageUrl,
              height: 300,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(16),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius:
                BorderRadius.vertical(top: Radius.circular(24)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(animal.name,
                      style:
                      Theme.of(context).textTheme.headlineSmall),
                  const SizedBox(height: 8),
                  Text('${animal.breed} • ${animal.age}',
                      style:
                      Theme.of(context).textTheme.bodyLarge),
                  const SizedBox(height: 12),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Text(
                        'Descripción del animal (maqueta visual). Aquí puedes agregar información sobre temperamento, vacunas, historial de rescate y notas importantes que el futuro adoptante debe conocer.',
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      Expanded(
                          child: OutlinedButton(
                              onPressed: () {}, child: const Text('Contactar'))),
                      const SizedBox(width: 8),
                      Expanded(
                          child: ElevatedButton(
                              onPressed: () {}, child: const Text('Adoptar'))),
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}