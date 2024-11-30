import 'package:flutter_dogs/app/presentation/service_locator/service_locator.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  tearDown(() {
    ServiceLocator.instance.clear();
  });
  test('ServiceLocator > put', () {
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
