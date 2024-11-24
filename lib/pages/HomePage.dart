import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/EventPage.dart';
import 'package:flutter_application_1/pages/LoginPage.dart';
import 'package:flutter_application_1/pages/ProfilePage.dart';
import 'package:flutter_application_1/pages/TransportPage.dart';
import 'dart:async';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  final PageController _pageController = PageController();
  late Timer _timer;

  final List<String> _imageUrls = [
    'https://mmc.tirto.id/image/otf/970x0/2024/08/07/seventeen-right-here-world-tour_ratio-16x9.jpg',
    'https://beadsofbullets.com/wp-content/uploads/2024/11/infinite-concert-md-cover.jpeg',
    'https://t.kfs.io/upload_images/95304/Lovelyz_2019_TPE_Poster_original.jpg',
  ];

  static final List<Widget> _widgetOptions = <Widget>[
    Text(''),
    const TransportPage(
      name: 'Transport',
    ),
    EventPage(
      name: 'Event',
    ),
    const ProfilePage(
      name: 'Profile',
    ),
    const Text('Logout'),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _autoSlide() {
    if (_pageController.hasClients) {
      int nextPage = (_pageController.page?.toInt() ?? 0) + 1;
      if (nextPage >= _imageUrls.length) {
        nextPage = 0;
      }
      _pageController.animateToPage(
        nextPage,
        duration: Duration(seconds: 1),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(Duration(seconds: 3), (Timer timer) {
      _autoSlide();
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Seventix'),
        backgroundColor: Color(0xFF7AB2D3),
      ),
      drawer: Drawer(
        child: Container(
          color: Color(0xFFCBDCEB),
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              const DrawerHeader(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(
                        'https://i.pinimg.com/originals/79/a2/34/79a234033d4dfccd1a6e533fa7298e9b.jpg'),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Text('Do Your Best on Ticketing'),
              ),
              ListTile(
                title: const Text('Home'),
                onTap: () {
                  Navigator.pop(context);
                  _onItemTapped(0);
                },
              ),
              ListTile(
                title: const Text('Transport'),
                onTap: () {
                  Navigator.pop(context);
                  _onItemTapped(1);
                },
              ),
              ListTile(
                title: const Text('Event'),
                onTap: () {
                  Navigator.pop(context);
                  _onItemTapped(2);
                },
              ),
              ListTile(
                title: const Text('Profile'),
                onTap: () {
                  Navigator.pop(context);
                  _onItemTapped(3);
                },
              ),
              ListTile(
                title: const Text('Logout'),
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => const Loginpage()),
                  );
                },
              ),
            ],
          ),
        ),
      ),
      body: _selectedIndex == 0
          ? Column(
              children: [
                const SizedBox(height: 40),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: SizedBox(
                    height: 200,
                    child: PageView.builder(
                      controller: _pageController,
                      itemCount: _imageUrls.length,
                      itemBuilder: (context, index) {
                        return Image.network(
                          _imageUrls[index],
                          fit: BoxFit.cover,
                        );
                      },
                    ),
                  ),
                ),
                Expanded(
                  child: Center(
                    child: _widgetOptions.elementAt(_selectedIndex),
                  ),
                ),
              ],
            )
          : _widgetOptions.elementAt(_selectedIndex),
    );
  }
}
