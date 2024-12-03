import 'package:flutter_dogs/app/presentation/service_locator/service_locator.dart';
import 'package:flutter_test/flutter_test.dart';

//prueba unitaria = verifica un comportamiento de una clase o mecanismo
void main() {
  //Se ejecuta despues de cada prueba o conjunto de pruebas
  tearDown(() {
    //Limpiar por si hay ninguna dependencia o dato registrado
    ServiceLocator.instance.clear();
  });
  test('ServiceLocator > put', () {
    //Si busca un string antes de registrarlo arroja un throwsAssertionError
    expect(
      () {
        ServiceLocator.instance.find<String>();
      },
      throwsAssertionError,
    );
    final name = ServiceLocator.instance.put<String>('Develop');
    expect(name, ServiceLocator.instance.find<String>());
  });
  test('ServiceLocator > put 2', () {
    ServiceLocator.instance.put('Develop');
    ServiceLocator.instance.put(
      'Mobile',
      tag: 'name2',
    );

    final name = ServiceLocator.instance.find<String>(tag: 'name2');

    expect(
      ServiceLocator.instance.find<String>(),
      'Develop',
    );
    expect(name, 'Mobile');
  });
  test('ServiceLocator > put 3', () {
    
   final user = ServiceLocator.instance.put(User('lalo'));

    expect(
      ServiceLocator.instance.find<User>(),
      user,
    );
  });
}

class User {
  User(this.name);

  final String name;
}
