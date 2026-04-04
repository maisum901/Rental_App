import 'package:flutter/material.dart';
import 'package:rental_app/screens/home_screen.dart';
import 'package:rental_app/custom_widgets/custom_tabbar.dart';
import 'package:rental_app/screens/description_tab.dart';
import 'package:rental_app/screens/car_booking.dart';

class CarDetails extends StatefulWidget {
  final String imagePath;
  final String carName;
  final String companyName;
  final String rating;
  final String profileImagePath;
  final String ownerName;
  final String description;
  final String rentPerDay;
  const CarDetails({
    super.key,
    required this.profileImagePath,
    required this.ownerName,
    required this.description,
    required this.rentPerDay,
    required this.imagePath,
    required this.carName,
    required this.companyName,
    required this.rating,
  });


  @override
  State<CarDetails> createState() => _CarDetailsState();
}

class _CarDetailsState extends State<CarDetails> {
  void _navigateBack(BuildContext context) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => HomeScreen()),
    );
  }

  void _navigateToBooking(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => CarBooking(imagePath: widget.imagePath),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () => _navigateBack(context),
          ),
          title: Text(
            'Car Details',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          actions: [
            IconButton(
              icon: Icon(Icons.favorite_outline_rounded),
              onPressed: () {},
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              SizedBox(height: 2),
              ClipRRect(
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(16),
                  bottom: Radius.circular(16),
                ),
                child: Image.asset(
                  widget.imagePath,
                  height: 200,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                    child: Text(
                      widget.carName,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Row(
                    children: [
                      SizedBox(width: 10),
                      Text(
                        widget.rating,
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.grey,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(width: 6),
                      Icon(
                        Icons.star_border,
                        color: Color(0xFFED5C1D),
                        size: 22,
                      ),
                    ],
                  ),
                ],
              ),
              Row(
                children: [
                  Text(
                    widget.companyName,
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 8),
              CustomTabbar(),
              Expanded(
                child: TabBarView(
                  children: [
                    DescriptionTab(
                      profileImagePath: widget.profileImagePath,
                      ownerName: widget.ownerName,
                      description: widget.description,
                    ),
                    Center(child: Text("Gallery Content")),
                    Center(child: Text("Reviews Content")),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Price',
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Row(
                        children: [
                          Text(
                            widget.rentPerDay,
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                          Text(
                            'day',
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.grey,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  ElevatedButton(
                    onPressed: () => _navigateToBooking(context),
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(120, 55),
                      backgroundColor: Color(0xFFED5C1D),
                      padding: EdgeInsets.symmetric(
                        horizontal: 40,
                        vertical: 12,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: Text(
                      'Rent Now',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
