// import 'dart:io';
// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:file_picker/file_picker.dart';
// import 'package:nibras_group_jor/core/helper/constants/my_colors.dart';

// class ImagePickerWidget extends StatefulWidget {
//   const ImagePickerWidget({super.key, this.defult_icon = Icons.home});
//   final IconData defult_icon;

//   @override
//   State<ImagePickerWidget> createState() => _ImagePickerState();
// }

// class _ImagePickerState extends State<ImagePickerWidget> {
//   dynamic _image;
//   final picker = ImagePicker();

//   Future<void> getImage(ImageSource source) async {
//     if (kIsWeb) {
//       // Web platform
//       final result = await FilePicker.platform.pickFiles(type: FileType.image);
//       if (result != null) {
//         setState(() {
//           _image = result.files.single.bytes; // Store the image bytes for web
//         });
//       } else {
//         print('No image selected.');
//       }
//     } else {
//       // Mobile platforms (Android/iOS)
//       final pickedFile = await picker.pickImage(source: source);
//       setState(() {
//         if (pickedFile != null) {
//           _image = File(pickedFile.path);
//         } else {
//           print('No image selected.');
//         }
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     ImageProvider? imageProvider;
//     if (_image != null) {
//       if (kIsWeb) {
//         imageProvider = MemoryImage(_image);
//       } else {
//         imageProvider = FileImage(_image as File);
//       }
//     }
//     return Center(
//       child: Column(
//         children: [
//           InkWell(
//             onTap: () {
//               showModalBottomSheet(
//                 context: context,
//                 builder: (BuildContext context) {
//                   return SafeArea(
//                     child: Column(
//                       mainAxisSize: MainAxisSize.min,
//                       children: <Widget>[
//                         ListTile(
//                           leading: Icon(Icons.camera_alt),
//                           title: Text('التقط صورة بالكاميرا'),
//                           onTap: () {
//                             getImage(ImageSource.camera);
//                             Navigator.pop(context);
//                           },
//                         ),
//                         ListTile(
//                           leading: Icon(Icons.photo_library),
//                           title: Text('اختر صورة من الاستديو'),
//                           onTap: () {
//                             getImage(ImageSource.gallery);
//                             Navigator.pop(context);
//                           },
//                         ),
//                       ],
//                     ),
//                   );
//                 },
//               );
//             },
//             child: Container(
//               margin: EdgeInsets.only(top: 8),
//               width: double.infinity,
//               decoration: const BoxDecoration(
//                   color: MyColors.custom_yellow,
//                   borderRadius: BorderRadius.all(Radius.circular(10))),
//               padding: const EdgeInsets.all(12),
//               child: Row(
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Icon(
//                     Icons.cloud_upload_rounded,
//                     color: Colors.white,
//                     size: 20,
//                   ),
//                   SizedBox(
//                     width: 8,
//                   ),
//                   Text('اضغط هنا لرفع الصورة '),
//                   SizedBox(
//                     width: 8,
//                   ),
//                   CircleAvatar(
//                     radius: 30,
//                     backgroundColor: Colors.grey[300],
//                     backgroundImage: imageProvider,
//                     child: _image == null
//                         ? Icon(
//                             widget.defult_icon,
//                             size: 30,
//                             color: Colors.grey[600],
//                           )
//                         : null,
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:file_picker/file_picker.dart';
import 'package:nibras_group_jor/core/helper/constants/my_colors.dart';

class ImagePickerWidget extends StatefulWidget {
  const ImagePickerWidget(
      {super.key, this.defult_icon = Icons.home, required this.onImagePicked});
  final IconData defult_icon;
  final Function(dynamic) onImagePicked;

  @override
  State<ImagePickerWidget> createState() => _ImagePickerState();
}

class _ImagePickerState extends State<ImagePickerWidget> {
  dynamic _image;
  final picker = ImagePicker();

  Future<void> getImage(ImageSource source) async {
    if (kIsWeb) {
      final result = await FilePicker.platform.pickFiles(type: FileType.image);
      if (result != null) {
        setState(() {
          _image = result.files.single.bytes;
        });
        widget.onImagePicked(_image); // Call the callback with image data
        checkImageType(_image); // Check the image type
      } else {
        print('No image selected.');
      }
    } else {
      final pickedFile = await picker.pickImage(source: source);
      setState(() {
        if (pickedFile != null) {
          _image = File(pickedFile.path);
          widget.onImagePicked(_image); // Call the callback with image data
          checkImageType(_image); // Check the image type
        } else {
          print('No image selected.');
        }
      });
    }
  }

  void checkImageType(dynamic image) {
    if (image is File) {
      final bytes = image.readAsBytesSync();
      if (bytes.isNotEmpty) {
        if (bytes[0] == 0xFF && bytes[1] == 0xD8 && bytes[2] == 0xFF) {
          print('Image is JPG');
        } else if (bytes[0] == 0x89 &&
            bytes[1] == 0x50 &&
            bytes[2] == 0x4E &&
            bytes[3] == 0x47) {
          print('Image is PNG');
        } else {
          print('Unknown image format');
        }
      }
    } else if (image is Uint8List) {
      if (image.isNotEmpty) {
        if (image[0] == 0xFF && image[1] == 0xD8 && image[2] == 0xFF) {
          print('Image is JPG');
        } else if (image[0] == 0x89 &&
            image[1] == 0x50 &&
            image[2] == 0x4E &&
            image[3] == 0x47) {
          print('Image is PNG');
        } else {
          print('Unknown image format');
        }
      }
    }
  }

  // Future<void> getImage(ImageSource source) async {
  //   if (kIsWeb) {
  //     final result = await FilePicker.platform.pickFiles(type: FileType.image);
  //     if (result != null) {
  //       setState(() {
  //         _image = result.files.single.bytes;
  //       });
  //       widget.onImagePicked(_image); // Call the callback with image data
  //     } else {
  //       print('No image selected.');
  //     }
  //   } else {
  //     final pickedFile = await picker.pickImage(source: source);
  //     setState(() {
  //       if (pickedFile != null) {
  //         _image = File(pickedFile.path);
  //         widget.onImagePicked(_image); // Call the callback with image data
  //       } else {
  //         print('No image selected.');
  //       }
  //     });
  //   }
  // }

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
                  SizedBox(
                    width: 8,
                  ),
                  CircleAvatar(
                    radius: 30,
                    backgroundColor: Colors.grey[300],
                    backgroundImage: imageProvider,
                    child: _image == null
                        ? Icon(
                            widget.defult_icon,
                            size: 30,
                            color: Colors.grey[600],
                          )
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
