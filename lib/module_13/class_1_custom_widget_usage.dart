import 'package:flutter/material.dart';
import 'package:flutter_application_test/module_13/widget/city_card.dart';

class Class1CustomWidgetUsage extends StatelessWidget {
  const Class1CustomWidgetUsage({super.key});

  @override
  Widget build(BuildContext context) {
    List<Map<String, String>> CityList = [
      {
        'img':
            'https://plus.unsplash.com/premium_photo-1673697239981-389164b7b87f?q=80&w=1144&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
        'name': 'Dhaka',
        'rating': '4.5',
      },
      {
        'img':
            'https://images.unsplash.com/photo-1507525428034-b723cf961d3e?q=80&w=1173&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
        'name': 'Chittagong',
        'rating': '3.9',
      },
      {
        'img':
            'https://plus.unsplash.com/premium_photo-1673697239981-389164b7b87f?q=80&w=1144&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
        'name': 'Rajshahi',
        'rating': '4.2',
      },
    ];

    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,

          children: [
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  CityCard(
                    img:
                        "https://plus.unsplash.com/premium_photo-1673697239981-389164b7b87f?q=80&w=1144&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
                    CityName: 'Dhaka',
                    rating: '4.5',
                  ),

                  SizedBox(width: 10),

                  CityCard(
                    img:
                        "https://images.unsplash.com/photo-1507525428034-b723cf961d3e?q=80&w=1173&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
                    CityName: 'Chittagong',
                    rating: '4.0',
                  ),

                  SizedBox(width: 10),

                  CityCard(
                    img:
                        "https://images.unsplash.com/photo-1635756227689-01eda5140530?q=80&w=1333&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
                    CityName: 'Sylhet',
                    rating: '3.5',
                  ),
                ],
              ),
            ),

            SizedBox(
              height: 600,
              width: 200,

              // Dynamic ListView from a ListItem
              child: ListView.builder(
                itemCount: CityList.length,
                itemBuilder: (context, index) {
                  final city = CityList[index];
                  return CityCard(
                    img: city['img']!,
                    CityName: city['name']!,
                    rating: city['rating']!,
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
