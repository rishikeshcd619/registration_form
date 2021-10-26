import 'package:flutter/material.dart';
import 'package:registration/entity/models.dart';
import 'package:registration/screens/admin.dart';
import 'package:registration/screens/super_admin.dart';
import 'package:registration/shared_preferences.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FormScreen extends StatefulWidget {
  const FormScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => FormScreenState();
}

class FormScreenState extends State<FormScreen> {
  late String firstName;
  late String lastName;
  late String email;
  late String phoneNumber;
  late String password;
  late String confirmPassword;
  late String address;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final _preferencesService = PreferenceService();

  Widget _buildFirstName() {
    return TextFormField(
      decoration: const InputDecoration(labelText: 'First Name'),
      validator: (String? value) {
        if (value!.isEmpty) {
          return 'Name is Required';
        }

        return null;
      },
      onSaved: (String? value) {
        firstName = value!;
      },
    );
  }

  Widget _buildLastName() {
    return TextFormField(
      decoration: const InputDecoration(labelText: 'Last Name'),
      validator: (String? value) {
        if (value!.isEmpty) {
          return 'Name is Required';
        }

        return null;
      },
      onSaved: (String? value) {
        lastName = value!;
      },
    );
  }

  Widget _buildEmail() {
    return TextFormField(
      decoration: const InputDecoration(labelText: 'Email'),
      validator: (String? value) {
        if (value!.isEmpty) {
          return 'Email is Required';
        }

        if (!RegExp(
                r"[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?")
            .hasMatch(value)) {
          return 'Please enter a valid email Address';
        }

        return null;
      },
      onSaved: (String? value) {
        email = value!;
      },
    );
  }

  Widget _buildPhoneNumber() {
    return TextFormField(
      decoration: const InputDecoration(labelText: 'Phone number'),
      keyboardType: TextInputType.phone,
      validator: (String? value) {
        if (value!.isEmpty) {
          return 'Phone number is Required';
        }

        return null;
      },
      onSaved: (String? value) {
        phoneNumber = value!;
      },
    );
  }

  Widget _buildAddress() {
    return TextFormField(
      decoration: const InputDecoration(labelText: 'Address'),
      keyboardType: TextInputType.url,
      validator: (String? value) {
        if (value!.isEmpty) {
          return 'Address is Required';
        }

        return null;
      },
      onSaved: (String? value) {
        address = value!;
      },
    );
  }

  Widget _buildPassword() {
    return TextFormField(
      //controller: password,
      decoration: const InputDecoration(labelText: 'Password'),
      obscureText: true,
      obscuringCharacter: '*',
      keyboardType: TextInputType.text,
      validator: (String? value) {
        if (value!.isEmpty) {
          return 'Password is Required';
        }

        return null;
      },
      onSaved: (String? value) {
        password = value!;
      },
    );
  }

  Widget _buildConfirmPassword() {
    return TextFormField(
      //controller: confirmPassword,
      decoration: const InputDecoration(labelText: 'Confirm password'),
      obscureText: true,
      obscuringCharacter: '*',
      keyboardType: TextInputType.text,
      validator: (String? value) {
        if (value!.isEmpty) {
          return 'Password is Required';
        }

        if (password != value) {
          return "Password does not match";
        }

        return null;
      },
      onSaved: (String? value) {
        confirmPassword = value!;
      },
    );
  }

  void _saveUser() {
    final newUser = UserData(
        firstName: firstName,
        lastName: lastName,
        email: email,
        address: address,
        password: password,
        phoneNumber: phoneNumber);

    _preferencesService.saveUser(newUser);
  }

  setVisitFlag() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setBool('alreadyVisited', true);
  }

  getVisitFlag() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    bool alreadyVisited = preferences.getBool('alreadyVisited') ?? false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Registration Form")),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(24),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                _buildFirstName(),
                _buildLastName(),
                _buildEmail(),
                _buildPhoneNumber(),
                _buildAddress(),
                _buildPassword(),
                _buildConfirmPassword(),
                const SizedBox(height: 50),
                TextButton(
                  child: const Text(
                    'Submit',
                    style: TextStyle(color: Colors.indigo, fontSize: 16),
                  ),
                  onPressed: () async {
                    if (!_formKey.currentState!.validate()) {
                      return;
                    }
                    bool visitFlag = await getVisitFlag();

                    setVisitFlag();

                    if (visitFlag == true) {
                      _saveUser;
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => Admin(),
                        ),
                      );
                    } else {
                      _saveUser;
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => SuperAdmin(),
                        ),
                      );
                    }
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
