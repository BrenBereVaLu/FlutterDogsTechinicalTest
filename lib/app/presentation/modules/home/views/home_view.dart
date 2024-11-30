import 'package:flutter/material.dart';

import 'widgets/dogs_list.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Dogs we love"),
          centerTitle: true,
        ),
        backgroundColor:
            Colors.white, // Cambia el color de fondo aquí
        body: const SafeArea(
            child: Column(
          children: [DogsList()],
        )));
  }
}
