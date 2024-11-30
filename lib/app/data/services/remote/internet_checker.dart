import 'dart:io';

class InternetChecker {
  Future<bool> hasInternet() async {
    try {
      final list = await InternetAddress.lookup('google.com');
      return list.isNotEmpty && list.first.rawAddress.isNotEmpty;
    } catch (e) {
      return false;
    }
  }
}
