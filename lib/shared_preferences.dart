import 'package:registration/entity/models.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PreferenceService {
  Future saveUser(UserData userData) async {
    final preferences = await SharedPreferences.getInstance();

    await preferences.setString('firstName', userData.firstName);
    await preferences.setString('lastName', userData.lastName);
    await preferences.setString('email', userData.email);
    await preferences.setString('phoneNumber', userData.phoneNumber);
    await preferences.setString('address', userData.address);
    await preferences.setString('password', userData.password);
  }

  Future<UserData> get getUser async {
    final preferences = await SharedPreferences.getInstance();

    final firstName = preferences.getString('firstName');
    final lastName = preferences.getString('lastName');
    final email = preferences.getString('email');
    final phoneNumber = preferences.getString('phoneNumber');
    final address = preferences.getString('address');
    final password = preferences.getString('password');

    return UserData(
      firstName: firstName!,
      lastName: lastName!,
      email: email!,
      phoneNumber: phoneNumber!,
      address: address!,
      password: password!,
    );
  }

  Future saveMenu(UserMenu menu) async {
    final preferences = await SharedPreferences.getInstance();

    await preferences.setString('name', menu.name);
    await preferences.setString('position', menu.position);
    await preferences.setString('status', menu.status);
  }

  Future<UserMenu> get menu async {
    final preferences = await SharedPreferences.getInstance();

    final name = preferences.getString('name');
    final position = preferences.getString('position');
    final status = preferences.getString('status');

    return UserMenu(name: name!, position: position!, status: status!);
  }
}
