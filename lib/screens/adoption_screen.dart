import 'package:flutter/material.dart';
import '../utils/sample_data.dart';
import '../models/animal.dart';
import '../widgets/animal_card.dart';

class AdoptionScreen extends StatelessWidget {
  const AdoptionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            expandedHeight: 140,
            backgroundColor: Colors.transparent,
            flexibleSpace: FlexibleSpaceBar(
              title: Text('Adopción',
                  style: Theme.of(context).textTheme.titleLarge),
              background: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Colors.orange.shade100, Colors.green.shade50],
                  ),
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(child: _buildFeatured(context)),
          SliverPadding(
            padding:
            const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            sliver: SliverGrid(
              delegate: SliverChildBuilderDelegate(
                    (context, index) {
                  final a = sampleAnimals[index];
                  return AnimalCard(animal: a);
                },
                childCount: sampleAnimals.length,
              ),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisExtent: 260,
                crossAxisSpacing: 8,
                mainAxisSpacing: 8,
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildFeatured(BuildContext context) {
    final featured = sampleAnimals.where((a) => a.featured).toList();
    return SizedBox(
      height: 160,
      child: ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, idx) {
          final a = featured[idx];
          return GestureDetector(
            onTap: () => Navigator.of(context).push(
              PageRouteBuilder(
                pageBuilder: (_, __, ___) => AnimalDetail(animal: a),
                transitionsBuilder: (_, anim, __, child) =>
                    FadeTransition(opacity: anim, child: child),
              ),
            ),
            child: Hero(
              tag: 'hero-${a.id}',
              child: Container(
                width: 280,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: const [
                    BoxShadow(color: Colors.black12, blurRadius: 8)
                  ],
                ),
                child: Row(
                  children: [
                    ClipRRect(
                      borderRadius: const BorderRadius.horizontal(
                          left: Radius.circular(16)),
                      child: Image.network(
                        a.imageUrl,
                        width: 120,
                        height: 160,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(12),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(a.name,
                                style:
                                Theme.of(context).textTheme.titleMedium),
                            const SizedBox(height: 6),
                            Text(a.breed),
                            const Spacer(),
                            const Row(
                              children: [
                                Icon(Icons.location_on, size: 16),
                                SizedBox(width: 6),
                                Text('Lima, Perú'),
                              ],
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        },
        separatorBuilder: (_, __) => const SizedBox(width: 12),
        itemCount: featured.length,
      ),
    );
  }
}