import 'package:flutter/material.dart';

class ShoesScreen extends StatelessWidget {
  const ShoesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> shoesList = [
      {
        'name': 'Running Shoes',
        'image': 'assets/images/shoes1.png',
      },
      {
        'name': 'Sneakers',
        'image': 'assets/images/shoes2.png',
      },
      {
        'name': 'Sports Shoes',
        'image': 'assets/images/shoes3.png',
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Shoes Collection'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          itemCount: shoesList.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10.0,
            mainAxisSpacing: 10.0,
            childAspectRatio: 0.75,
          ),
          itemBuilder: (context, index) {
            final shoe = shoesList[index];
            return GestureDetector(
              onTap: () {
              },
              child: Card(
                elevation: 4.0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(
                      shoe['image']!,
                      height: 150.0,
                      width: 150.0,
                      fit: BoxFit.cover,
                    ),
                    const SizedBox(height: 8.0),
                    Text(
                      shoe['name']!,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16.0,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
