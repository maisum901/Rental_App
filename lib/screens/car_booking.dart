import 'package:flutter/material.dart';
import 'package:rental_app/screens/billing_screen.dart';

class CarBooking extends StatefulWidget {
  final String imagePath;

  CarBooking({required this.imagePath});

  @override
  _CarBookingState createState() => _CarBookingState();
}

class _CarBookingState extends State<CarBooking> {
  final pickupLocationController = TextEditingController();
  final dropOffLocationController = TextEditingController();
  DateTime? pickupDate;
  DateTime? dropOffDate;
  DateTime? pickupTime;

  Future<void> _selectTime() async {
    final TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay(hour: 9, minute: 0),
    );

    setState(() {
      pickupTime = pickedTime != null
          ? DateTime(0, 0, 0, pickedTime.hour, pickedTime.minute)
          : null;
    });
  }

  Future<void> _selectDate() async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime(2021, 7, 25),
      firstDate: DateTime(2021),
      lastDate: DateTime(2022),
    );

    setState(() {
      pickupDate = pickedDate;
    });
  }

  bool isChecked = false;
  int _maxLines = 1;
  void onTapSeeAll() {
    setState(() {
      if (_maxLines == 1) {
        _maxLines = 3;
      } else {
        _maxLines = 1;
      }
    });
  }

  Future<void> _navigateToBilling(BuildContext context) async {
    await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => BillingScreen()),
    );
  }

  void _navigateToBillingScreen(BuildContext context) {
    _navigateToBilling(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Booking',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
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
                    SizedBox(height: 20),
                    Text(
                      'Pickup Location',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextField(
                      controller: pickupLocationController,
                      decoration: InputDecoration(
                        hintText: 'New York',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        contentPadding: EdgeInsets.symmetric(horizontal: 16),
                      ),
                    ),
                    SizedBox(height: 20),
                    Text(
                      'Drop-off Location',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextField(
                      controller: dropOffLocationController,
                      decoration: InputDecoration(
                        hintText: 'Los Angeles',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        contentPadding: EdgeInsets.symmetric(horizontal: 16),
                      ),
                    ),
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Pickup Date',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.symmetric(
                                horizontal: 16,
                                vertical: 16,
                              ),
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Row(
                                children: [
                                  Text(
                                    pickupDate != null
                                        ? '${pickupDate!.month}/${pickupDate!.day}/${pickupDate!.year}'
                                        : 'Select Date',
                                    style: TextStyle(fontSize: 16),
                                  ),
                                  IconButton(
                                    onPressed: _selectDate,
                                    icon: Icon(
                                      Icons.calendar_today,
                                      color: Color(0xFFED5C1D),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Pickup Time',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.symmetric(
                                horizontal: 16,
                                vertical: 16,
                              ),
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Row(
                                children: [
                                  Text(
                                    pickupTime != null
                                        ? '${pickupTime!.hour}:${pickupTime!.minute}:${pickupTime!.second}'
                                        : 'Select Time',
                                    style: TextStyle(fontSize: 16),
                                  ),
                                  IconButton(
                                    onPressed: _selectTime,
                                    icon: Icon(
                                      Icons.access_time,
                                      color: Color(0xFFED5C1D),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 30),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Pickup Date',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Container(
                              height: 55,
                              width: 180,
                              padding: EdgeInsets.symmetric(
                                horizontal: 16,
                                vertical: 16,
                              ),
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Row(
                                children: [
                                  Text(
                                    pickupDate != null
                                        ? '${pickupDate!.month}/${pickupDate!.day}/${pickupDate!.year}'
                                        : 'Select Date',
                                    style: TextStyle(fontSize: 16),
                                  ),
                                  IconButton(
                                    onPressed: _selectDate,
                                    icon: Icon(
                                      Icons.calendar_today,
                                      color: Color(0xFFED5C1D),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Pickup Time',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.symmetric(
                                horizontal: 16,
                                vertical: 16,
                              ),
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Row(
                                children: [
                                  Text(
                                    pickupTime != null
                                        ? '${pickupTime!.hour}:${pickupTime!.minute}:${pickupTime!.second}'
                                        : 'Select Time',
                                    style: TextStyle(fontSize: 16),
                                  ),
                                  IconButton(
                                    onPressed: _selectTime,
                                    icon: Icon(
                                      Icons.access_time,
                                      color: Color(0xFFED5C1D),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Insurance',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 5),
                    Container(
                      padding: EdgeInsets.all(2),

                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Checkbox(
                            checkColor: Color(0xFFED5C1D),
                            activeColor: Colors.white,
                            value: isChecked,
                            onChanged: (value) {
                              setState(() {
                                isChecked = value!;
                              });
                            },
                          ),
                          Expanded(
                            child: Text(
                              'Basic insurance is included in the rental price. You can choose to add additional coverage for extra protection.',
                              overflow: TextOverflow.clip,
                              maxLines: _maxLines,
                              softWrap: true,
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.grey[700],
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: onTapSeeAll,
                            child: Text(
                              'See All',
                              style: TextStyle(
                                color: Color(0xFFED5C1D),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () => _navigateToBillingScreen(context),
              style: ElevatedButton.styleFrom(
                minimumSize: Size(double.infinity, 55),
                backgroundColor: Color(0xFFED5C1D),
              ),
              child: Text(
                'Continue',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
