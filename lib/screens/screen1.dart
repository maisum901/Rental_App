import 'package:flutter/material.dart';
import 'package:rental_app/custom_widgets/search_field.dart';
import 'package:rental_app/screens/car_card.dart';

class Screen1 extends StatefulWidget {
  const Screen1({super.key});

  @override
  State<Screen1> createState() => _Screen1State();
}

class _Screen1State extends State<Screen1> {
  List<String> topBrands = [
    'assets/images/toyota.png',
    'assets/images/honda.png',
    'assets/images/lexus.png',
    'assets/images/mercedes.png',
    'assets/images/bmw.png',
    'assets/images/audi.png',
    'assets/images/nissan.png',
    'assets/images/porsche.png',
    'assets/images/volkswagen.png',
  ];

  Widget seeAllCarsGesture() {
    return GestureDetector(
      onTap: () {},
      child: Text(
        'See All',
        style: TextStyle(color: Color(0xFFED5C1D), fontWeight: FontWeight.bold, fontSize: 16),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            SizedBox(width: 16),
            Expanded(
              child: SearchField(
                hintText: "Search...",
                controller: TextEditingController(),
              ),
            ),
            SizedBox(width: 16),
            CircleAvatar(
              radius: 20,
              backgroundColor: Colors.white,
              child: Icon(Icons.filter_list, color: Color(0xFFED5C1D)),
            ),
            SizedBox(width: 20),
          ],
        ),
        SizedBox(height: 20),
        SingleChildScrollView(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(width: 16),
                  Text(
                    'Top Brands',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              SizedBox(height: 16),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: List.generate(topBrands.length, (index) {
                    return Container(
                      margin: EdgeInsets.symmetric(horizontal: 8),
                      width: 80,
                      height: 80,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(60),
                      ),
                      child: Column(
                        children: [
                          Image.asset(
                            topBrands[index],
                            fit: BoxFit.contain,
                            width: 60,
                            height: 60,
                          ),
                          SizedBox(height: 4),
                          Text(
                            topBrands[index]
                                .split('/')
                                .last
                                .split('.')
                                .first
                                .toUpperCase(),
                            style: TextStyle(fontSize: 10),
                          ),
                        ],
                      ),
                    );
                  }),
                ),
              ),

              SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      SizedBox(width: 16),
                      Text(
                        'Popular Cars',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  Row(children: [seeAllCarsGesture(), SizedBox(width: 16)]),
                ],
              ),
            SizedBox(height: 30),
            SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: List.generate(topBrands.length, (index) {
                    return Container(
                      margin: EdgeInsets.symmetric(horizontal: 8),
                      width: 300,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(60),
                      ),
                      child: CarCard(imagePath: topBrands[index], carName: 'Audi Q7 twin turbo so fast fastest', carModel: 'Car Model', pricePerDay: '\$100/'),
                    );
                  }),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
