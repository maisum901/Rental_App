import 'package:flutter/material.dart';

class CustomTabbar extends StatelessWidget {

  CustomTabbar({super.key});

  @override
  Widget build(BuildContext context) {
    return TabBar(
      indicatorColor:Color(0xFFED5C1D),
      labelColor: Color(0xFFED5C1D),
      unselectedLabelColor: Colors.grey,
      tabs: const [
        Tab(text: "Description"),
        Tab(text: "Gallery"),
        Tab(text: "Reviews"),
      ],
    );
  }
}