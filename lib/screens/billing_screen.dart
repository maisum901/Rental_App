import 'package:flutter/material.dart';
import 'package:rental_app/custom_widgets/textfield_heading.dart';
import 'package:rental_app/custom_widgets/custom_textfield.dart';
import 'package:country_picker/country_picker.dart';


class BillingScreen extends StatefulWidget {
  const BillingScreen({super.key});

  @override
  State<BillingScreen> createState() => _BillingScreenState();
}

class _BillingScreenState extends State<BillingScreen> {
  final name = TextEditingController();
  final address = TextEditingController();
  final emailAddress = TextEditingController();
  final country = TextEditingController();
  final gender = TextEditingController();
  String? selectGender ;
  void _selectCountry() {
    showCountryPicker(
      context: context,
      showPhoneCode: false,
      onSelect: (Country selectedCountry) {
        setState(() {
          country.text = selectedCountry.name;
        });
      },
    );
  }

  Widget genderOption() {
    return Container(
      width: 400,
      height: 55,
      padding: EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(8),
      ),
      margin: EdgeInsets.symmetric(horizontal: 16),
      child: DropdownButtonFormField<String>(
        hint: Text("Select Gender"),
        value: selectGender,
        items: ["Male", "Female", "Other"]
            .map((gender) => DropdownMenuItem(value: gender, child: Text(gender)))
            .toList(),
        onChanged: (value) {
          setState(() {
            selectGender = value!;
          });
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Billing Screen',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextfieldHeading(text: 'Name'),
                    CustomTextfield(hintText: 'Enter Name', textInput: name),
                    SizedBox(height: 20),
                    TextfieldHeading(text: 'Address'),
                    CustomTextfield(
                      hintText: 'Enter Address',
                      textInput: address,
                    ),
                    SizedBox(height: 20),
                    TextfieldHeading(text: 'Email Address'),
                    CustomTextfield(
                      hintText: 'Enter Email Address',
                      textInput: emailAddress,
                    ),
                    SizedBox(height: 20),
                    TextfieldHeading(text: 'Country'),
                    SizedBox(height: 10),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 16),
                      width: 400,
                      height: 55,
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            country.text.isEmpty
                                ? 'Select Country'
                                : country.text,
                            style: TextStyle(fontSize: 16),
                          ),
                          Spacer(),
                          IconButton(
                            onPressed: _selectCountry,
                            icon: Icon(
                              Icons.pin_drop,
                              color: Color(0xFFED5C1D),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 20),
                    TextfieldHeading(text: 'Gender'),
                    SizedBox(height: 10),
                    genderOption(),
                    SizedBox(height: 20),
                  ],
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {},
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
