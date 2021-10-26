import 'package:flutter/material.dart';

class MenuScreen extends StatefulWidget {
  const MenuScreen({Key? key}) : super(key: key);

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  String? name;
  String? position;
  String? status;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Widget _buildMenuName() {
    return TextFormField(
      decoration: const InputDecoration(labelText: 'Menu Name'),
      validator: (String? value) {
        if (value!.isEmpty) {
          return 'Name is Required';
        }

        return null;
      },
      onSaved: (String? value) {
        name = value!;
      },
    );
  }

  Widget _buildPosition() {
    return TextFormField(
      decoration: const InputDecoration(labelText: 'Position'),
      validator: (String? value) {
        if (value!.isEmpty) {
          return 'Position is Required';
        }

        return null;
      },
      onSaved: (String? value) {
        position = value!;
      },
    );
  }

  Widget _buildStatus() {
    return TextFormField(
      decoration: const InputDecoration(labelText: 'Status'),
      onSaved: (String? value) {
        status = value!;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Menu")),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(24),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                _buildMenuName(),
                _buildPosition(),
                _buildStatus(),
                SizedBox(height: 100),
                RaisedButton(
                  child: const Text(
                    'Submit',
                    style: TextStyle(color: Colors.indigo, fontSize: 16),
                  ),
                  onPressed: () {
                    _formKey.currentState!.save();
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
