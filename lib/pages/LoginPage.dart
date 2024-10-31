import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/ProfilePage.dart';

class Loginpage extends StatefulWidget {
  @override
  State<Loginpage> createState() => _EditProfilState();
}

class _EditProfilState extends State<Loginpage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.only(
          top: 64,
          bottom: 64,
          left: 24,
          right: 24,
        ),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                child: Center(
                  child: Text(
                    'LOGIN',
                    style: TextStyle(fontSize: 40, color: Colors.blueAccent),
                  ),
                ),
              ),
              Container(
                child: TextField(
                  controller: nameController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Username',
                  ),
                ),
              ),
              Container(
                child: TextField(
                  controller: passwordController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Password',
                  ),
                ),
              ),
              SizedBox(
                child: TextButton(
                  style:
                      TextButton.styleFrom(backgroundColor: Colors.blueAccent),
                  onPressed: () {
                    if (nameController.text.isEmpty) {
                      showAlertDialogMaterial(context, 'Please input username');
                    } else if (passwordController.text.isEmpty) {
                      showAlertDialogMaterial(context, 'Please input password');
                    } else {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Profilepage(
                                  name: nameController.text,
                                )
                        ),
                      );
                    }
                  },
                  child: Text(
                    'Login',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                    ),
                  ),
                ),
              ),
            ]),
      ),
    );
  }

  void showAlertDialogMaterial(
    BuildContext context,
    String text,
  ) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Info'),
          content: Text(text),
          actions: [
            TextButton(
              child: Text('No!'),
              onPressed: () {
                print('Clicked No!');
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text('Yes'),
              onPressed: () {
                print('Clicked Yes!');
                Navigator.of(context).pop();
              },
            ),
          ],
          elevation: 4,
          backgroundColor: Colors.red[200],
        );
      },
      barrierColor: Colors.red[100],
      barrierDismissible: false,
    );
  }
}
