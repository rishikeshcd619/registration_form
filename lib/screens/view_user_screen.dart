import 'package:flutter/material.dart';
import 'package:registration/shared_preferences.dart';

class ViewUser extends StatelessWidget {
  final _preferencesService = PreferenceService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('User Details'),
        ),
        body: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          elevation: 5,
          child: Form(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.all(10),
                ),
                Text(
                  'First Name: ${_preferencesService.getUser.firstName}',
                  style: TextStyle(
                    color: Colors.teal,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                Text(
                  'Last Name: ${_preferencesService.getUser.lastName}',
                  style: TextStyle(
                    color: Colors.teal,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                Text(
                  'Email: ${_preferencesService.getUser.email}',
                  style: TextStyle(
                    color: Colors.teal,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                Text(
                  'Address: ${_preferencesService.getUser.address}',
                  style: TextStyle(
                    color: Colors.teal,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                Text(
                  'MobileNumber: ${_preferencesService.getUser.phoneNumber}',
                  style: TextStyle(
                    color: Colors.teal,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
