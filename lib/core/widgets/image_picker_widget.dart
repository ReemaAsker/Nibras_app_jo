import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:file_picker/file_picker.dart';
import 'package:nibras_group_jor/core/helper/constants/my_colors.dart';

class ImagePickerWidget extends StatefulWidget {
  const ImagePickerWidget({
    super.key,
  });

  @override
  State<ImagePickerWidget> createState() => _ImagePickerState();
}

class _ImagePickerState extends State<ImagePickerWidget> {
  dynamic _image;
  final picker = ImagePicker();

  Future<void> getImage(ImageSource source) async {
    if (kIsWeb) {
      // Web platform
      final result = await FilePicker.platform.pickFiles(type: FileType.image);
      if (result != null) {
        setState(() {
          _image = result.files.single.bytes; // Store the image bytes for web
        });
      } else {
        print('No image selected.');
      }
    } else {
      // Mobile platforms (Android/iOS)
      final pickedFile = await picker.pickImage(source: source);
      setState(() {
        if (pickedFile != null) {
          _image = File(pickedFile.path);
        } else {
          print('No image selected.');
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    ImageProvider? imageProvider;
    if (_image != null) {
      if (kIsWeb) {
        imageProvider = MemoryImage(_image);
      } else {
        imageProvider = FileImage(_image as File);
      }
    }
    return Center(
      child: Column(
        children: [
          InkWell(
            onTap: () {
              showModalBottomSheet(
                context: context,
                builder: (BuildContext context) {
                  return SafeArea(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        ListTile(
                          leading: Icon(Icons.camera_alt),
                          title: Text('التقط صورة بالكاميرا'),
                          onTap: () {
                            getImage(ImageSource.camera);
                            Navigator.pop(context);
                          },
                        ),
                        ListTile(
                          leading: Icon(Icons.photo_library),
                          title: Text('اختر صورة من الاستديو'),
                          onTap: () {
                            getImage(ImageSource.gallery);
                            Navigator.pop(context);
                          },
                        ),
                      ],
                    ),
                  );
                },
              );
            },
            child: Container(
              margin: EdgeInsets.only(top: 8),
              width: double.infinity,
              decoration: const BoxDecoration(
                  color: MyColors.custom_yellow,
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              padding: const EdgeInsets.all(12),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.cloud_upload_rounded,
                    color: Colors.white,
                    size: 20,
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  Text('اضغط هنا لرفع الصورة '),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
