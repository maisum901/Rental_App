import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class GalleryTab extends StatefulWidget {
  const GalleryTab({super.key});

  @override
  State<GalleryTab> createState() => _GalleryTabState();
}

class _GalleryTabState extends State<GalleryTab> {
  List<String> imagesPath = [];
  final ImagePicker picker = ImagePicker();

  @override
  void initState() {
    super.initState();
    getImages();
  }

  Future<void> getImages() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> storedImages = prefs.getStringList('storedData') ?? [];
    setState(() {
      imagesPath = storedImages;
    });
  }

  Future<void> _pickImages() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> storedImages = prefs.getStringList('storedData') ?? [];
    final List<XFile> pickedImages = await picker.pickMultiImage();
    if (pickedImages.isNotEmpty) {
      List<String> newPaths = pickedImages.map((file) => file.path).toList();
      storedImages.addAll(newPaths);
      await prefs.setStringList('storedData', storedImages);
      setState(() {
        imagesPath = storedImages;
      });
      //print(storedImages);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 20),

            imagesPath.isNotEmpty
                ? Expanded(
                    child: GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 8,
                        mainAxisSpacing: 8,
                      ),
                      scrollDirection: Axis.vertical,
                      itemCount: imagesPath.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: EdgeInsets.all(8),
                          child: Image.file(
                            File(imagesPath[index]),
                            width: 100,
                            height: 100,
                            fit: BoxFit.cover,
                          ),
                        );
                      },
                    ),
                  )
                : Text("No images selected"),

            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFFED5C1D),
                padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              ),
              onPressed: _pickImages,
              child: Text("Pick Images", style: TextStyle(color: Colors.white)),
            ),
          ],
        ),
      ),
    );
  }
}
