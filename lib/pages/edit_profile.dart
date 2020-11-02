import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mobpro_quiz_1/main.dart';
import 'package:mobpro_quiz_1/pages/profile.dart';

class EditProfile extends StatefulWidget {
  @override
  _EditProfileState createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  final globalKey = GlobalKey<ScaffoldState>();
  final textNameController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    textNameController.text = profileName;

    return Scaffold(
      key: globalKey,
      appBar: AppBar(
        leading: CloseButton(
          onPressed: () => {Navigator.pop(context)},
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
                controller: textNameController,
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 20),
              height: 48,
              child: RaisedButton(
                onPressed: () => showSaveDialog(),
                color: Colors.blue,
                child: Text(
                  'Simpan',
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

  void showSaveDialog() {
    if (textNameController.text == '') {
      showSnackBar('Nama tidak boleh kosong');
    } else {
      if (profileName != textNameController.text) {
        showDialog(
            context: globalKey.currentContext,
            builder: (_) => AlertDialog(
                  title: Text('Simpan?'),
                  content: Text('Kamu yakin mau menyimpan nama ini?'),
                  actions: [
                    FlatButton(
                        onPressed: () =>
                            {Navigator.pop(globalKey.currentContext)},
                        child: Text('Tidak')),
                    FlatButton(
                        onPressed: () => {
                              profileName = textNameController.text,
                              showToast('Berhasil mengubah nama'),
                              Navigator.pop(globalKey.currentContext),
                              Navigator.pop(context),
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          Profile(textNameController.text)))
                            },
                        child: Text('Ya'))
                  ],
                ),
            barrierColor: Colors.black.withOpacity(0.7),
            barrierDismissible: false);
      } else {
        Navigator.pop(context);
      }
    }
  }

  void showToast(String content) {
    Fluttertoast.showToast(
        msg: content,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.black.withOpacity(0.9),
        textColor: Colors.white);
  }

  void showSnackBar(String content) {
    final snackbar = SnackBar(
        content: Text(
      content,
      textAlign: TextAlign.center,
    ));
    globalKey.currentState.showSnackBar(snackbar);
  }
}
