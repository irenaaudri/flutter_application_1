import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/HomePage.dart';
import 'package:flutter_application_1/pages/EventPage.dart';
import 'package:flutter_application_1/pages/ProfilePage.dart';
import 'package:flutter_application_1/pages/TransportPage.dart';

class ProfilePage extends StatefulWidget {
  final String name;

  const ProfilePage({super.key, required this.name});

  @override
  State<ProfilePage> createState() => _ProfileState();
}

class _ProfileState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const CircleAvatar(
              radius: 75,
              backgroundImage: NetworkImage(
                'https://i.pinimg.com/736x/fc/45/e2/fc45e29103799de4d35b995502809eca.jpg',
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            Center(
              child: Text(
                'Irena Audri Citra Fergia',
                style: const TextStyle(
                  color: Colors.black54,
                  fontSize: 25,
                ),
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            Container(
              child: SizedBox(height: 200),
              width: double.infinity,
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Color(0xFFFFF6E3),
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 5,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
