import 'package:freezed_annotation/freezed_annotation.dart';

part 'either.freezed.dart';

//Genera codigo relacionado con clase inmutables es decir no pueden ser cambiados despues de ser inicializados
//Maneja diferentes estados para manejar estados de UI
//Crea codigo por medio del build_runner que genera automaticamente metodos como copyWith, serialización/deserialización
//constructores personalizados
@freezed
class Either<L, R> with _$Either<L,R> {
factory Either.left(L value) = Left;
factory Either.right(R value) = Right;
}
