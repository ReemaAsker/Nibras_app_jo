import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:file_picker/file_picker.dart';
import 'package:nibras_group_jor/core/helper/constants/my_colors.dart';

class ImagePickerWidget extends StatefulWidget {
  const ImagePickerWidget({
    super.key,
    this.defaultIcon,
    required this.onImagePicked,
  });

  final dynamic defaultIcon; // Can be IconData or NetworkImage
  final Function(dynamic) onImagePicked; // Callback to handle image data

  @override
  State<ImagePickerWidget> createState() => ImagePickerState();
}

class ImagePickerState extends State<ImagePickerWidget> {
  dynamic _image; // Can be File or Uint8List
  final picker = ImagePicker();

  Future<void> getImage(ImageSource source) async {
    try {
      if (kIsWeb) {
        final result =
            await FilePicker.platform.pickFiles(type: FileType.image);
        if (result != null) {
          final fileName = result.files.single.name;
          if (fileName.endsWith('.png') ||
              fileName.endsWith('.jpg') ||
              fileName.endsWith('.jpeg')) {
            final bytes = result.files.single.bytes;
            if (bytes != null) {
              setState(() {
                _image = bytes; // Store as Uint8List
              });
              widget.onImagePicked(_image); // Return Uint8List
            } else {
              showSnackBar('لا بيانات صورة.');
            }
          } else {
            showSnackBar('الرجاء تحميل صورة من نوع PNG أو JPG.');
          }
        } else {
          showSnackBar('لم يتم اختيار صورة.');
        }
      } else {
        final pickedFile = await picker.pickImage(source: source);
        if (pickedFile != null) {
          if (pickedFile.path.endsWith('.png') ||
              pickedFile.path.endsWith('.jpg') ||
              pickedFile.path.endsWith('.jpeg')) {
            final file = File(pickedFile.path);
            setState(() {
              _image = file; // Store as File
            });
            widget.onImagePicked(_image); // Return File
          } else {
            showSnackBar(
              'الرجاء تحميل صورة من نوع PNG أو JPG.',
            );
          }
        } else {
          showSnackBar('لم يتم اختيار صورة.');
        }
      }
    } catch (e) {
      print("Error: $e");
    }
  }

  void showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: Colors.purple,
        content: Text(message),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    ImageProvider? imageProvider;
    if (_image != null) {
      if (kIsWeb) {
        imageProvider = MemoryImage(_image as Uint8List);
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
                        if (!kIsWeb)
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
                          title: Text('اختر من الاستوديو'),
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
              decoration: BoxDecoration(
                color: MyColors.custom_yellow,
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
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
                  SizedBox(width: 8),
                  Text('انقر هنا لتحميل الصورة'),
                  SizedBox(width: 8),
                  CircleAvatar(
                    radius: 30,
                    backgroundImage: imageProvider,
                    child: _image == null
                        ? widget.defaultIcon is IconData
                            ? Icon(
                                widget.defaultIcon,
                                size: 30,
                                color: Colors.black,
                              )
                            : widget.defaultIcon is String
                                ? Image.network(
                                    widget.defaultIcon,
                                    fit: BoxFit.cover,
                                    width: 60,
                                    height: 60,
                                    errorBuilder: (context, error, stackTrace) {
                                      return ClipOval(
                                        child: Icon(Icons.image_not_supported,
                                            size: 30, color: Colors.red),
                                      );
                                    },
                                  )
                                : null
                        : null,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
