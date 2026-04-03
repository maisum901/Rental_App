import 'package:flutter/material.dart';

class CarCard extends StatelessWidget {
  // final String logoPath;
  final String imagePath;
  final String carName;
  final String carModel;
  final String pricePerDay;

  const CarCard({
    super.key,
    required this.imagePath,
    required this.carName,
    required this.carModel,
    required this.pricePerDay,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      elevation: 4,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  SizedBox(width: 20),
                  Image.asset(imagePath, width: 20, height: 20),
                ],
              ),
              Row(children: [Icon(Icons.favorite_border), SizedBox(width: 16)]),
            ],
          ),
          SizedBox(height: 20),
          ClipRRect(
            borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
            child: Image.asset(
              imagePath,
              height: 120,
              width: double.infinity,
              fit: BoxFit.contain,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Text(
                    carName,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Row(
                  children: [
                    SizedBox(width: 10),
                    Text(
                      '4.5',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.grey,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(width: 6),
                    Icon(Icons.star_border, color: Color(0xFFED5C1D), size: 22),
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children:[
                Row(children:[Icon(Icons.heat_pump_outlined, color: Colors.grey), SizedBox(width: 6), Text('50L', style: TextStyle(color: Colors.grey))]),
                Row(children:[Icon(Icons.people, color: Colors.grey), SizedBox(width: 6), Text('Manual', style: TextStyle(color: Colors.grey))]),
                Row(children:[Icon(Icons.people, color: Colors.grey), SizedBox(width: 6), Text('People', style: TextStyle(color: Colors.grey))]),
              ]
            )
          ),
          Divider(height: 30, thickness: 1, indent: 16, endIndent: 16),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Text(
                      pricePerDay,
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    Text('day', style: TextStyle(fontSize: 14, color: Colors.grey)),
                  ],
                ),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(100, 40),
                    backgroundColor: Color(0xFFED5C1D),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Text('Rent Now', style: TextStyle(color: Colors.white)),
                ),
              ],
            ),
          ),
          SizedBox(height: 20),
        ],
      ),
    );
  }
}
