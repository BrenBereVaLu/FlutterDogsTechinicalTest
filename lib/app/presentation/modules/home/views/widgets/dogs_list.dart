import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../domain/either/either.dart';
import '../../../../../domain/failure/http_request/http_request_failure.dart';
import '../../../../../domain/models/dogs/allDogs.dart';
import '../../../../../domain/repositories/dogs_repository.dart';
import '../../../../global/colors.dart';

typedef EitherListDogs = Either<HttpRequestFailure, List<Alldogs>>;

class DogsList extends StatefulWidget {
  const DogsList({super.key});

  @override
  State<DogsList> createState() => _DogsListState();
}

class _DogsListState extends State<DogsList> {
  late final Future<EitherListDogs> _future;
  @override
  void initState() {
    super.initState();
    final DogsRepository repository = context.read();
    _future = repository.getListAllDogs();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height *
              0.85, // 80% de la altura de la pantalla
          child: Center(
            child: FutureBuilder<EitherListDogs>(
              future: _future,
              builder: (_, snapshot) {
                if (!snapshot.hasData) {
                  return const CircularProgressIndicator();
                }
                return snapshot.data!.when(
                  left: (failure) => Text(failure.toString()),
                  right: (list) {
                    return ListView.separated(
                      padding: const EdgeInsets.all(15),
                      itemBuilder: (_, index) {
                        final dog = list[index];
                        return ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Row(
                            children: [
                              // Imagen del perro
                              Expanded(
                                child: SizedBox(
                                  height: MediaQuery.of(context).size.height *
                                      0.3, // Altura fija de la imagen
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(15),
                                    child: Image.network(
                                      dog.image,
                                      fit: BoxFit
                                          .cover, // Ajusta la imagen sin distorsión
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(width: 10),
                              // Contenedor azul con el nombre del perro
                              Expanded(
                                child: SizedBox(
                                  height: MediaQuery.of(context).size.height *
                                      0.3, // Altura fija del contenedor
                                  child: Container(
                                    color: AppColors.accent, // Color azul
                                    alignment: Alignment
                                        .centerLeft, // Alinea el contenido a la izquierda
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment
                                          .start, // Alinea los textos a la izquierda
                                      children: [
                                        Text(
                                          dog.dogName, // Nombre del perro
                                          style: const TextStyle(
                                            color:
                                                AppColors.secondary, // Color del texto
                                            fontWeight: FontWeight
                                                .bold, // Estilo del texto
                                            fontSize: 24,
                                          ),
                                        ),
                                        const SizedBox(height: 10),
                                        Text(
                                          dog.description, // Descripción del perro
                                          style: const TextStyle(
                                              color: AppColors.primary, // Color del texto
                                              fontSize: 14),
                                        ),
                                        const SizedBox(height: 10),
                                        Text(
                                          'Almost ${dog.age.toString()} years', // Edad del perro
                                          style: const TextStyle(
                                              color: Colors
                                                  .black, // Color del texto
                                              fontWeight: FontWeight
                                                  .bold, // Estilo del texto
                                              fontSize: 18),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                      itemCount: list.length,
                      separatorBuilder: (_, __) => const SizedBox(
                        height: 10,
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
