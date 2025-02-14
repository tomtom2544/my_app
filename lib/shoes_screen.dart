import 'package:flutter/material.dart';

class ShoesScreen extends StatelessWidget {
  const ShoesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Example list of shoes (could be fetched from a model or API)
    final List<Map<String, String>> shoesList = [
      {
        'name': 'Running Shoes',
        'image': 'assets/images/shoes1.png', // Example image path
      },
      {
        'name': 'Sneakers',
        'image': 'assets/images/shoes2.png', // Example image path
      },
      {
        'name': 'Sports Shoes',
        'image': 'assets/images/shoes3.png', // Example image path
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
            crossAxisCount: 2, // Two columns
            crossAxisSpacing: 10.0, // Space between columns
            mainAxisSpacing: 10.0, // Space between rows
            childAspectRatio: 0.75, // Aspect ratio of each tile
          ),
          itemBuilder: (context, index) {
            final shoe = shoesList[index];
            return GestureDetector(
              onTap: () {
                // Handle shoe item tap (e.g., navigate to a detailed product page)
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
                      shoe['image']!, // Image for the shoe
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
