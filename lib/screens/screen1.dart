import 'package:flutter/material.dart';
import 'package:rental_app/custom_widgets/search_field.dart';
import 'package:rental_app/screens/car_card.dart';

class Screen1 extends StatefulWidget {
  const Screen1({super.key});

  @override
  State<Screen1> createState() => _Screen1State();
}

class _Screen1State extends State<Screen1> {

  List<List<String>> popularCars = [
    [
      'assets/images/toyota.png',
      'assets/images/download.jpg',
      'Toyota Century Legendary',
      '\$100/',
      '50L',
      'Automatic',
      '5 Seats',
      '4.5',
      'assets/images/profile.jpg',
      'John Doe',
      'Experience the epitome of luxury with our Toyota Century Legendary rental. This iconic vehicle combines timeless elegance with modern comfort, making it the perfect choice for those seeking a prestigious driving experience. Whether you\'re attending a special event or simply want to indulge in the ultimate ride, our Toyota Century Legendary is sure to impress. Book now and elevate your journey to new heights.',
      'Toyota',
    ],
    [
      'assets/images/honda.png',
      'assets/images/crossroad.jpg',
      'Honda Cross Road',
      '\$120/',
      '45L',
      'Manual',
      '5 Seats',
      '4.2',
      'assets/images/profile1.jpg',
      'Jane Smith',
      'Discover the perfect blend of style and versatility with our Honda Cross Road rental. This compact SUV is designed to navigate both city streets and rugged terrains with ease, making it an ideal choice for your next adventure. Whether you\'re planning a weekend getaway or need a reliable vehicle for daily commuting, the Honda Cross Road offers comfort, performance, and practicality. Book your rental today and experience the freedom of the open road.',
      'Honda',
    ],
    [
      'assets/images/lexus.png',
      'assets/images/lexus500.jpg',
      'Lexus RX',
      '\$110/',
      '55L',
      'Automatic',
      '5 Seats',
      '4.6',
      'assets/images/profile2.jpg',
      'Emily Johnson',
      'Experience the thrill of driving a Lexus with our premium rental service. Whether you\'re looking for a sleek sedan or a powerful SUV, we have the perfect Lexus for you. Our vehicles are meticulously maintained and equipped with the latest features to ensure a comfortable and stylish ride. Book your Lexus rental today and elevate your driving experience.',
      'Lexus',
    ],
    [
      'assets/images/mercedes.png',
      'assets/images/mercedes500.jpg',
      'Mercedes GLE',
      '\$150/',
      '60L',
      'Automatic',
      '5 Seats',
      '4.8',
      'assets/images/profile3.jpg',
      'Michael Brown',
      'Indulge in the luxury and performance of our Mercedes GLE rental. This sophisticated SUV combines cutting-edge technology with elegant design, providing an unparalleled driving experience. Whether you\'re cruising through city streets or embarking on a weekend escape, the Mercedes GLE offers comfort, style, and power. Book your rental today and make every journey unforgettable.',
      'Mercedes',
    ],
    [
      'assets/images/bmw.png',
      'assets/images/bmwm5.jpg',
      'BMW M5',
      '\$130/',
      '50L',
      'Automatic',
      '5 Seats',
      '4.7',
      'assets/images/profile4.jpg',
      'Sarah Williams',
      'Experience the perfect combination of performance and luxury with our BMW M5 rental. This high-performance sedan is designed to deliver an exhilarating driving experience, with its powerful engine and precise handling. Whether you\'re looking to make a statement on the road or simply want to enjoy the thrill of driving a BMW, our M5 rental is the ultimate choice. Book now and elevate your driving experience to new heights.',
      'BMW',
    ],
    [
      'assets/images/audi.png',
      'assets/images/audir8.jpg',
      'Audi R8',
      '\$200/',
      '70L',
      'Automatic',
      '2 Seats',
      '4.9',
      'assets/images/profile5.jpg',
      'David Wilson',
      'Experience the pinnacle of automotive excellence with our Audi R8 rental. This supercar combines breathtaking performance with stunning design, making it the ultimate choice for those seeking an unforgettable driving experience. Whether you\'re looking to turn heads on the city streets or want to unleash the full potential of the R8 on a scenic drive, our rental service has you covered. Book your Audi R8 rental today and prepare to be amazed.',
      'Audi',
    ],
    [
      'assets/images/nissan.png',
      'assets/images/nissangtr.jpg',
      'Nissan GT-R',
      '\$180/',
      '65L',
      'Automatic',
      '4 Seats',
      '4.8',
      'assets/images/profile6.jpg',
      'Chris Davis',
      'Experience the thrill of driving a Nissan GT-R with our premium rental service. This iconic sports car is renowned for its exceptional performance and cutting-edge technology, making it the perfect choice for enthusiasts and thrill-seekers alike. Whether you\'re looking to dominate the track or simply want to enjoy an exhilarating drive, our Nissan GT-R rental is sure to deliver an unforgettable experience. Book now and unleash the power of the GT-R on your next adventure.',
      'Nissan',
    ],
    [
      'assets/images/porsche.png',
      'assets/images/porsche911.jpg',
      'Porsche 911',
      '\$220/',
      '60L',
      'Automatic',
      '4 Seats',
      '4.9',
      'assets/images/profile7.jpg',
      'Jessica Martinez',
      'Experience the timeless elegance and exhilarating performance of our Porsche 911 rental. This iconic sports car is a symbol of automotive excellence, combining sleek design with powerful performance. Whether you\'re looking to make a statement on the road or simply want to enjoy the thrill of driving a Porsche, our 911 rental is the ultimate choice. Book now and elevate your driving experience to new heights.',
      'Porsche',
    ],
    [
      'assets/images/volkswagen.png',
      'assets/images/volkswagenbeetle.jpg',
      'Volkswagen Beetle',
      '\$90/',
      '40L',
      'Manual',
      '4 Seats',
      '4.3',
      'assets/images/profile8.jpg',
      'Mark Anderson',
      'Experience the charm and nostalgia of our Volkswagen Beetle rental. This iconic car is a symbol of fun and freedom, making it the perfect choice for those looking to add a touch of whimsy to their driving experience. Whether you\'re cruising through city streets or embarking on a scenic drive, our Volkswagen Beetle rental is sure to bring a smile to your face. Book now and enjoy the timeless appeal of the Beetle on your next adventure.',
      'Volkswagen',
    ],
  ];
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
        style: TextStyle(
          color: Color(0xFFED5C1D),
          fontWeight: FontWeight.bold,
          fontSize: 16,
        ),
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
                      child: CarCard(
                        logoPath: popularCars[index][0],
                        imagePath: popularCars[index][1],
                        carName: popularCars[index][2],
                        pricePerDay: popularCars[index][3],
                        fuelCapacity: popularCars[index][4],
                        transmissionType: popularCars[index][5],
                        seatingCapacity: popularCars[index][6],
                        rating: popularCars[index][7],
                        profileImagePath: popularCars[index][8],
                        ownerName: popularCars[index][9],
                        description: popularCars[index][10],
                        companyName: popularCars[index][11],
                      ),
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
