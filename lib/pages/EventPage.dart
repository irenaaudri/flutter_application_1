import 'package:flutter/material.dart';

class EventPage extends StatelessWidget {
  EventPage({super.key, required this.name});

  final String name;

  final List<Map<String, String>> events = [
    {
      'title': 'SEVENTEEN Concert 2025 Indonesia',
      'subtitle': 'SEVENTEEN [RIGHT HERE] WORLD TOUR IN JAKARTA',
      'details':'Details of the event will go here.',
      'imageUrl': 'https://blog.kakaocdn.net/dn/bptPrL/btsIYD1fc6P/ho6FwEzDtRKTJd8ehQ93o1/img.jpg'
    },
    {
      'title': 'INFINITE 15TH ANNIVERSARY CONCERT IN JAKARTA',
      'subtitle': 'INFINITE 15th ANNIVERSARY CONCERT : LIMITED EDITION IN JAKARTA',
      'details': 'Details of the event will go here.',
      'imageUrl': 'https://kpopgun.com/wp-content/uploads/2020/12/infinite-3.jpg'
    },
    {
      'title': 'Lovelyz in Winterland 4',
      'subtitle': 'Lovelyz 2024 Winter Concert [Lovelyz in Winterland 4]',
      'details': 'Details of the event will go here.',
      'imageUrl': 'https://kissent.jp/s3/skiyaki/uploads/ckeditor/pictures/162598/content_Lovelyz_4th_%E6%B2%BB%E7%99%92.jpg'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
  
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const TextField(
              decoration: InputDecoration(
                hintText: 'Find Event',
                prefixIcon: Icon(Icons.search),
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: events.length,
                itemBuilder: (context, index) {
                  return Card(
                    margin: const EdgeInsets.symmetric(vertical: 10),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    elevation: 5,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        image: DecorationImage(
                          image: NetworkImage(events[index]['imageUrl'] ?? ''),
                          fit: BoxFit.cover,
                        ),
                      ),
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            events[index]['title'] ?? 'No title',
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            events[index]['subtitle'] ?? 'No subtitle',
                            style: const TextStyle(
                              fontSize: 16,
                              color: Colors.black,
                            ),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            events[index]['details'] ?? 'No details available',
                            style: const TextStyle(
                              fontSize: 14,
                              color: Colors.red,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
