import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Profile',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
      body: Expanded(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Center(
                child: Column(
                  children: [
                    SizedBox(height: 20),
                    CircleAvatar(
                      radius: 60,
                      backgroundImage: AssetImage('assets/images/maisum.jpeg'),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Maisam Ali',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 5),
                    Text('maisam.ali@example.com'),
                  ],
                ),
              ),
              SizedBox(height: 30),
              Container(
                height: 500,

                child: ListView(
                  children: [
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 16),
                      height: 55,
                      width: 100,
                      decoration: BoxDecoration(
                        border: BoxBorder.all(color: Color(0xFFED5C1D)),
                        borderRadius: BorderRadius.circular(8), 
                      ),
                      child: ListTile(
                        leading: Icon(Icons.person, color: Color(0xFFED5C1D)),
                        title: Text('Edit Profile', style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
                        trailing: Icon(Icons.arrow_forward_ios, color: Color(0xFFED5C1D)),
                      ),
                    ),
                    SizedBox(height: 20),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 16),
                      height: 55,
                      width: 100,
                      decoration: BoxDecoration(
                        border: BoxBorder.all(color: Color(0xFFED5C1D)),
                        borderRadius: BorderRadius.circular(8), 
                      ),
                      child: ListTile(
                        leading: Icon(Icons.document_scanner, color: Color(0xFFED5C1D)),
                        title: Text('Lisence', style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
                        trailing: Icon(Icons.arrow_forward_ios, color: Color(0xFFED5C1D)),
                      ),
                    ),
                    SizedBox(height: 20),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 16),
                      height: 55,
                      width: 100,
                      decoration: BoxDecoration(
                        border: BoxBorder.all(color: Color(0xFFED5C1D)),
                        borderRadius: BorderRadius.circular(8), 
                      ),
                      child: ListTile(
                        leading: Icon(Icons.edit_document, color: Color(0xFFED5C1D)),
                        title: Text('Passport', style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
                        trailing: Icon(Icons.arrow_forward_ios, color: Color(0xFFED5C1D)),
                      ),
                    ),
                    SizedBox(height: 20),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 16),
                      height: 55,
                      width: 100,
                      decoration: BoxDecoration(
                        border: BoxBorder.all(color: Color(0xFFED5C1D)),
                        borderRadius: BorderRadius.circular(8), 
                      ),
                      child: ListTile(
                        leading: Icon(Icons.payment, color: Color(0xFFED5C1D)),
                        title: Text('Payment Method', style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
                        trailing: Icon(Icons.arrow_forward_ios, color: Color(0xFFED5C1D)),
                      ),
                    ),
                    SizedBox(height: 20),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 16),
                      height: 55,
                      width: 100,
                      decoration: BoxDecoration(
                        border: BoxBorder.all(color: Color(0xFFED5C1D)),
                        borderRadius: BorderRadius.circular(8), 
                      ),
                      child: ListTile(
                        leading: Icon(Icons.calendar_today, color: Color(0xFFED5C1D)),
                        title: Text('My Booking', style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
                        trailing: Icon(Icons.arrow_forward_ios, color: Color(0xFFED5C1D)),
                      ),
                    ),
                    SizedBox(height: 20),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 16),
                      height: 55,
                      width: 100,
                      decoration: BoxDecoration(
                        border: BoxBorder.all(color: Color(0xFFED5C1D)),
                        borderRadius: BorderRadius.circular(8), 
                      ),
                      child: ListTile(
                        leading: Icon(Icons.settings, color: Color(0xFFED5C1D)),
                        title: Text('Settings', style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
                        trailing: Icon(Icons.arrow_forward_ios, color: Color(0xFFED5C1D)),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
