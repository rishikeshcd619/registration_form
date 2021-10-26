class UserData {
  String firstName;
  String lastName;
  String email;
  String phoneNumber;
  String address;
  String password;

  UserData({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.phoneNumber,
    required this.address,
    required this.password,
  });
}

class UserMenu {
  String name;
  String position;
  String status;

  UserMenu({required this.name, required this.position, required this.status});
}
