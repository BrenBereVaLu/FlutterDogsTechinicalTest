import 'package:flutter/material.dart';

import 'widgets/dogs_list_offline.dart';
class OfflineView extends StatefulWidget {
  const OfflineView({super.key});

  @override
  State<OfflineView> createState() => _OfflineViewState();
}

class _OfflineViewState extends State<OfflineView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Dogs we love offline"),
        centerTitle: true,
      ),
      backgroundColor: Colors.white, // Cambia el color de fondo aquí
      body: const SafeArea(
        child: Column(
          children: [
            Expanded(child: DogsListOffline()), // Aquí lo envuelves en Expanded
          ],
        ),
      ),
    );
  }
}
