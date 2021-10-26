import 'package:flutter/material.dart';
import 'package:registration/screens/form_screen.dart';

class Admin extends StatelessWidget {
  const Admin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('data'),
        actions: [
          IconButton(
            onPressed: () {
              FormScreen();
            },
            icon: Icon(
              Icons.logout_outlined,
              color: Colors.black.withOpacity(0.7),
            ),
          )
        ],
      ),
      body: Center(
        child: Text('Admin'),
      ),
    );
  }
}
