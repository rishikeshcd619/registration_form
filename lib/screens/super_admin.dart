import 'package:flutter/material.dart';
import 'package:registration/screens/form_screen.dart';
import 'package:registration/screens/menu_screen.dart';
import 'package:registration/screens/view_user_screen.dart';

class SuperAdmin extends StatelessWidget {
  String? firstName;
  String? lastName;
  String? email;
  String? phoneNumber;
  String? address;

  SuperAdmin(
      {this.firstName,
      this.lastName,
      this.email,
      this.address,
      this.phoneNumber});

  //FormScreen formScreen = FormScreen();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('$firstName'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => FormScreen(),
                ),
              );
            },
            icon: Icon(
              Icons.logout_outlined,
              color: Colors.white.withOpacity(0.7),
            ),
          )
        ],
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
          SizedBox(
            height: 100,
          ),
          OutlinedButton(
            child: Text("Create member"),
            style: OutlinedButton.styleFrom(
              backgroundColor: Colors.indigo,
              primary: Colors.white,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
              ),
            ),
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => FormScreen(),
                ),
              );
            },
          ),
          SizedBox(
            height: 50,
          ),
          OutlinedButton(
            child: Text("View member"),
            style: OutlinedButton.styleFrom(
              backgroundColor: Colors.indigo,
              primary: Colors.white,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
              ),
            ),
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => ViewUser(),
                ),
              );
            },
          ),
          SizedBox(
            height: 50,
          ),
          OutlinedButton(
            child: Text("Create menu"),
            style: OutlinedButton.styleFrom(
              backgroundColor: Colors.indigo,
              primary: Colors.white,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
              ),
            ),
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => MenuScreen(),
                ),
              );
            },
          ),
        ]),
      ),
    );
  }
}
