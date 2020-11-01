import 'package:flutter/material.dart';
import 'package:mobpro_quiz_1/pages/edit_profile.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
        centerTitle: true,
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: CircleAvatar(
                radius: 75,
                backgroundImage:
                    NetworkImage('https://agittm.id/img/formal.png'),
              ),
            ),
            Text(
              'Agit TM',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            )
          ],
        ),
        padding: EdgeInsets.only(top: 64, bottom: 64, left: 24, right: 24),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () => onEditProfileClicked(),
          backgroundColor: Colors.orangeAccent,
          child: Icon(Icons.edit)),
    );
  }

  void onEditProfileClicked() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => EditProfile()));
  }
}
