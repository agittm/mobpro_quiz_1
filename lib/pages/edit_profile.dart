import 'package:flutter/material.dart';

class EditProfile extends StatefulWidget {
  @override
  _EditProfileState createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: CloseButton(
          onPressed: () => onEditProfileClose(),
        ),
        title: Text('Edit Profile'),
        centerTitle: true,
      ),
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Center(
              child: TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(), labelText: 'Input Name'),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 20),
              height: 48,
              child: RaisedButton(
                onPressed: () => onEditProfileClose(),
                color: Colors.blue,
                child: Text(
                  'Save',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            )
          ],
        ),
        padding: EdgeInsets.only(top: 64, bottom: 64, left: 24, right: 24),
      ),
    );
  }

  void onEditProfileClose() {
    Navigator.pop(context);
  }
}
