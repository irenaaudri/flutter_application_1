import 'package:flutter/material.dart';

class Profilepage extends StatefulWidget {
  final String name;

  Profilepage({required this.name});
  @override
  State<Profilepage> createState() => _ProfileState();
}

class _ProfileState extends State<Profilepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          onPressed: () {
            Navigator.pop(context);
            print('Back to previous page');
          },
        ),
        title: Text('Profilepage'),
        centerTitle: true,
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 75,
              backgroundImage: NetworkImage(
                  'https://id.images.search.yahoo.com/search/images;_ylt=Awrx_psIiCNn2AIAC_rLQwx.;_ylu=Y29sbwNzZzMEcG9zAzEEdnRpZAMEc2VjA3BpdnM-?p=foto+aesthetic+jpg&fr2=piv-web&type=E210ID885G0&fr=mcafee#id=12&iurl=https%3A%2F%2Fwallpapercave.com%2Fwp%2Fwp5842033.jpg'),
            ),
            SizedBox(
              height: 25,
            ),
            Center(
                child: Text(
              widget.name,
              style: TextStyle(
                color: Colors.white,
                fontSize: 25,
              ),
            )),
          ],
        ),
      ),
    );
  }
}
