import 'package:flutter/material.dart';

import '../../../../../data/services/local/database/dogs_database.dart';
import '../../../../../domain/models/dogs/allDogs.dart';
import '../../../../global/colors.dart';

class DogsListOffline extends StatefulWidget {
  const DogsListOffline({super.key});

  @override
  State<DogsListOffline> createState() => _DogsListOfflineState();
}

class _DogsListOfflineState extends State<DogsListOffline> {
  late Future<List<Alldogs>> _futureDogs;

  @override
  void initState() {
    super.initState();
    _futureDogs = DogsDatabase.instance.fetchDogs();
  }

  /* @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Dogs List")),
       body: FutureBuilder<List<Alldogs>>(
        future: _futureDogs,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (snapshot.hasData) {
            List<Alldogs> dogs = snapshot.data!;
            print("First dog: ${dogs.first.dogName}");
            
            return dogs.isEmpty
                ? const Center(child: Text('No data found'))
                : Expanded(
                    child: ListView.builder(
                      itemCount: dogs.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Text(dogs[index].dogName),
                        );
                      },
                    ),
                  );
          } else {
            return const Center(child: Text('No data found'));
          }
        },
      ), 
    );
  }

 */
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Offline Dogs"),
        centerTitle: true,
      ),
      body: FutureBuilder<List<Alldogs>>(
        future: _futureDogs,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text(
                "Error: ${snapshot.error}",
                style: const TextStyle(color: Colors.red),
              ),
            );
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(
              child: Text(
                "No dogs found in the database.",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            );
          } else {
            final dogs = snapshot.data!;
            return ListView.separated(
              padding: const EdgeInsets.all(15),
              itemCount: dogs.length,
              separatorBuilder: (_, __) => const SizedBox(height: 10),
              itemBuilder: (_, index) {
                final dog = dogs[index];
                return ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Row(
                    children: [
                      // Imagen del perro
                      ConstrainedBox(
                        constraints: const BoxConstraints(
                          maxWidth:
                              150, // Limitar la imagen para que no se desborde
                          maxHeight: 150, // Limitar la altura de la imagen
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: Builder(
                            builder: (context) {
                              return Image.network(
                                dog.image,
                                fit: BoxFit.cover,
                                errorBuilder: (_, __, ___) => const Icon(
                                  Icons.broken_image,
                                  size: 50,
                                  color: Colors.grey,
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      // Contenedor con la descripción
                      Expanded(
                        child: Container(
                          padding: const EdgeInsets.all(8.0),
                          decoration: BoxDecoration(
                            color: AppColors.primary,
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                dog.dogName,
                                style: const TextStyle(
                                  color: AppColors.accent,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                ),
                              ),
                              const SizedBox(height: 8),
                              Text(
                                dog.description,
                                style: const TextStyle(
                                  color:AppColors.secondary,
                                  fontSize: 14,
                                ),
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                              const SizedBox(height: 8),
                              Text(
                                'Almost ${dog.age} years',
                                style: const TextStyle(
                                  color: AppColors.accent,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
