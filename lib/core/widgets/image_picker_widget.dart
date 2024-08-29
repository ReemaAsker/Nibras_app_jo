// import 'dart:io';
// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:file_picker/file_picker.dart';
// import 'package:nibras_group_jor/core/helper/constants/my_colors.dart';

// // // class ImagePickerWidget extends StatefulWidget {
// // //   const ImagePickerWidget({
// // //     super.key,
// // //     this.defult_icon = Icons.home,
// // //     required this.onImagePicked,
// // //     required this.isEditable,
// // //   });
// // //   final IconData defult_icon;
// // //   final Function(dynamic) onImagePicked;
// // //   final bool isEditable;

// // //   @override
// // //   State<ImagePickerWidget> createState() => ImagePickerState();
// // // }

// // // class ImagePickerState extends State<ImagePickerWidget> {
// // //   dynamic _image;
// // //   final picker = ImagePicker();

// // //   Future<void> getImage(ImageSource source) async {
// // //     try {
// // //       if (kIsWeb) {
// // //         final result =
// // //             await FilePicker.platform.pickFiles(type: FileType.image);
// // //         if (result != null) {
// // //           setState(() {
// // //             _image = result.files.single.bytes;
// // //           });

// // //           widget.onImagePicked(returnUint8List(_image));
// // //         } else {
// // //           print('No image selected.');
// // //         }
// // //       } else {
// // //         final pickedFile = await picker.pickImage(source: source);

// // //         if (pickedFile != null) {
// // //           _image = await convertToMultipartFile(File(pickedFile.path));
// // //           widget.onImagePicked(_image); // Call the callback with image data
// // //         } else {
// // //           print('No image selected.');
// // //         }
// // //         setState(() {});
// // //         // );
// // //       }
// // //     } catch (e) {
// // //       print("eerrrrrrrrrrrrrrrrrrrrrrrrrrror" + e.toString());
// // //     }
// // //   }

// // //   Future<MultipartFile?> convertToMultipartFile(dynamic fileData,
// // //       {String? fileName}) async {
// // //     // if (fileData is Uint8List) {
// // //     //   return MultipartFile.fromBytes(
// // //     //     fileData,
// // //     //     filename: fileName ?? 'upload.png',
// // //     //   );
// // //     // }
// // //     // else
// // //     if (fileData is File) {
// // //       return await MultipartFile.fromFile(
// // //         fileData.path,
// // //         filename: fileName ?? fileData.path.split('/').last,
// // //       );
// // //     } else {
// // //       throw Exception('Unsupported file data type');
// // //     }
// // //   }

// // //   MultipartFile returnUint8List(dynamic fileData, {String? fileName}) {
// // //     // if (fileData is Uint8List) {
// // //     return MultipartFile.fromBytes(
// // //       fileData,
// // //       filename: fileName ?? 'upload.png',
// // //     );
// // //     // }
// // //   }

// // //   void checkImageType(dynamic image) {
// // //     if (image is File) {
// // //       final bytes = image.readAsBytesSync();
// // //       if (bytes.isNotEmpty) {
// // //         if (bytes[0] == 0xFF && bytes[1] == 0xD8 && bytes[2] == 0xFF) {
// // //           print('Image is JPG');
// // //         } else if (bytes[0] == 0x89 &&
// // //             bytes[1] == 0x50 &&
// // //             bytes[2] == 0x4E &&
// // //             bytes[3] == 0x47) {
// // //           print('Image is PNG');
// // //         } else {
// // //           print('Unknown image format');
// // //         }
// // //       }
// // //     } else if (image is Uint8List) {
// // //       if (image.isNotEmpty) {
// // //         if (image[0] == 0xFF && image[1] == 0xD8 && image[2] == 0xFF) {
// // //           print('Image is JPG');
// // //         } else if (image[0] == 0x89 &&
// // //             image[1] == 0x50 &&
// // //             image[2] == 0x4E &&
// // //             image[3] == 0x47) {
// // //           print('Image is PNG');
// // //         } else {
// // //           print('Unknown image format');
// // //         }
// // //       }
// // //     }
// // //   }

// // //   @override
// // //   Widget build(BuildContext context) {
// // //     ImageProvider? imageProvider;
// // //     if (_image != null) {
// // //       if (kIsWeb) {
// // //         imageProvider = MemoryImage(_image);
// // //       } else {
// // //         imageProvider = FileImage(_image as File);
// // //       }
// // //     }
// // //     return Center(
// // //       child: Column(
// // //         children: [
// // //           InkWell(
// // //             onTap: widget.isEditable
// // //                 ? () {
// // //                     showModalBottomSheet(
// // //                       context: context,
// // //                       builder: (BuildContext context) {
// // //                         return SafeArea(
// // //                           child: Column(
// // //                             mainAxisSize: MainAxisSize.min,
// // //                             children: <Widget>[
// // //                               ListTile(
// // //                                 leading: Icon(Icons.camera_alt),
// // //                                 title: Text('التقط صورة بالكاميرا'),
// // //                                 onTap: () {
// // //                                   getImage(ImageSource.camera);
// // //                                   Navigator.pop(context);
// // //                                 },
// // //                               ),
// // //                               ListTile(
// // //                                 leading: Icon(Icons.photo_library),
// // //                                 title: Text('اختر صورة من الاستديو'),
// // //                                 onTap: () {
// // //                                   getImage(ImageSource.gallery);
// // //                                   Navigator.pop(context);
// // //                                 },
// // //                               ),
// // //                             ],
// // //                           ),
// // //                         );
// // //                       },
// // //                     );
// // //                   }
// // //                 : null,
// // //             child: Container(
// // //               margin: EdgeInsets.only(top: 8),
// // //               width: double.infinity,
// // //               decoration: const BoxDecoration(
// // //                   color: MyColors.custom_yellow,
// // //                   borderRadius: BorderRadius.all(Radius.circular(10))),
// // //               padding: const EdgeInsets.all(12),
// // //               child: Row(
// // //                 crossAxisAlignment: CrossAxisAlignment.center,
// // //                 mainAxisAlignment: MainAxisAlignment.center,
// // //                 children: [
// // //                   Icon(
// // //                     Icons.cloud_upload_rounded,
// // //                     color: Colors.white,
// // //                     size: 20,
// // //                   ),
// // //                   SizedBox(
// // //                     width: 8,
// // //                   ),
// // //                   Text('اضغط هنا لرفع الصورة '),
// // //                   SizedBox(
// // //                     width: 8,
// // //                   ),
// // //                   CircleAvatar(
// // //                     radius: 30,
// // //                     backgroundColor: Colors.grey[300],
// // //                     backgroundImage: imageProvider,
// // //                     child: _image == null
// // //                         ? Icon(
// // //                             widget.defult_icon,
// // //                             size: 30,
// // //                             color: Colors.grey[600],
// // //                           )
// // //                         : null,
// // //                   ),
// // //                 ],
// // //               ),
// // //             ),
// // //           ),
// // //         ],
// // //       ),
// // //     );
// // //   }
// // // }
// // class ImagePickerWidget extends StatefulWidget {
// //   const ImagePickerWidget({
// //     super.key,
// //     this.defult_icon = Icons.home,
// //     required this.onImagePicked,
// //   });
// //   final IconData defult_icon;
// //   final Function(dynamic) onImagePicked; // Callback to handle image data

// //   @override
// //   State<ImagePickerWidget> createState() => ImagePickerState();
// // }

// // class ImagePickerState extends State<ImagePickerWidget> {
// //   dynamic _image; // Can be File or Uint8List
// //   final picker = ImagePicker();

// //   Future<void> getImage(ImageSource source) async {
// //     try {
// //       if (kIsWeb) {
// //         final result =
// //             await FilePicker.platform.pickFiles(type: FileType.image);
// //         if (result != null) {
// //           final bytes = result.files.single.bytes;
// //           if (bytes != null) {
// //             setState(() {
// //               _image = bytes; // Store as Uint8List
// //             });
// //             widget.onImagePicked(_image); // Return Uint8List
// //           } else {
// //             print('لا يوجد بيانات');
// //           }
// //         } else {
// //           print('لا صور مختارة');
// //         }
// //       } else {
// //         final pickedFile = await picker.pickImage(source: source);
// //         if (pickedFile != null) {
// //           final file = File(pickedFile.path);
// //           setState(() {
// //             _image = file; // Store as File
// //           });
// //           widget.onImagePicked(_image); // Return File
// //         } else {
// //           print('لا صور مختارة');
// //         }
// //       }
// //     } catch (e) {
// //       print("مشكلة");
// //     }
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     ImageProvider? imageProvider;
// //     if (_image != null) {
// //       if (kIsWeb) {
// //         imageProvider = MemoryImage(_image as Uint8List);
// //       } else {
// //         imageProvider = FileImage(_image as File);
// //       }
// //     }
// //     return Center(
// //       child: Column(
// //         children: [
// //           InkWell(
// //             onTap: () {
// //               showModalBottomSheet(
// //                 context: context,
// //                 builder: (BuildContext context) {
// //                   return SafeArea(
// //                     child: Column(
// //                       mainAxisSize: MainAxisSize.min,
// //                       children: <Widget>[
// //                         ListTile(
// //                           leading: Icon(Icons.camera_alt),
// //                           title: Text('التقط صورة بالكاميرا'),
// //                           onTap: () {
// //                             getImage(ImageSource.camera);
// //                             Navigator.pop(context);
// //                           },
// //                         ),
// //                         ListTile(
// //                           leading: Icon(Icons.photo_library),
// //                           title: Text('اختر صورة من الاستوديو'),
// //                           onTap: () {
// //                             getImage(ImageSource.gallery);
// //                             Navigator.pop(context);
// //                           },
// //                         ),
// //                       ],
// //                     ),
// //                   );
// //                 },
// //               );
// //             },
// //             child: Container(
// //               margin: EdgeInsets.only(top: 8),
// //               width: double.infinity,
// //               decoration: BoxDecoration(
// //                   color: MyColors.custom_yellow,
// //                   borderRadius: BorderRadius.all(Radius.circular(10))),
// //               padding: const EdgeInsets.all(12),
// //               child: Row(
// //                 crossAxisAlignment: CrossAxisAlignment.center,
// //                 mainAxisAlignment: MainAxisAlignment.center,
// //                 children: [
// //                   Icon(
// //                     Icons.cloud_upload_rounded,
// //                     color: Colors.white,
// //                     size: 20,
// //                   ),
// //                   SizedBox(
// //                     width: 8,
// //                   ),
// //                   Text('اضغط لتحميل الصورة'),
// //                   SizedBox(
// //                     width: 8,
// //                   ),
// //                   CircleAvatar(
// //                     radius: 30,
// //                     backgroundColor: Colors.grey[300],
// //                     backgroundImage: imageProvider,
// //                     child: _image == null
// //                         ? Icon(
// //                             widget.defult_icon,
// //                             size: 30,
// //                             color: Colors.grey[600],
// //                           )
// //                         : null,
// //                   ),
// //                 ],
// //               ),
// //             ),
// //           ),
// //         ],
// //       ),
// //     );
// //   }
// // }

// class ImagePickerWidget extends StatefulWidget {
//   const ImagePickerWidget({
//     super.key,
//     this.defaultIcon,
//     required this.onImagePicked,
//   });

//   final dynamic defaultIcon; // Can be IconData or NetworkImage
//   final Function(dynamic) onImagePicked; // Callback to handle image data

//   @override
//   State<ImagePickerWidget> createState() => ImagePickerState();
// }

// class ImagePickerState extends State<ImagePickerWidget> {
//   dynamic _image; // Can be File or Uint8List
//   final picker = ImagePicker();

//   Future<void> getImage(ImageSource source) async {
//     try {
//       if (kIsWeb) {
//         final result =
//             await FilePicker.platform.pickFiles(type: FileType.image);
//         if (result != null) {
//           final bytes = result.files.single.bytes;
//           if (bytes != null) {
//             setState(() {
//               _image = bytes; // Store as Uint8List
//             });
//             widget.onImagePicked(_image); // Return Uint8List
//           } else {
//             ScaffoldMessenger.of(context).showSnackBar(
//               SnackBar(
//                   backgroundColor: Colors.purple,
//                   content: Text('لا بيانات صورة.  . ')),
//             );
//           }
//         } else {
//           // SnackBar(content: SnackBar.);
//           ScaffoldMessenger.of(context).showSnackBar(
//             SnackBar(
//                 backgroundColor: Colors.purple,
//                 content: Text('لم يتم اختيار صورة. ')),
//           );
//           // print('No image selected');
//         }
//       } else {
//         final pickedFile = await picker.pickImage(source: source);
//         if (pickedFile != null) {
//           final file = File(pickedFile.path);
//           setState(() {
//             _image = file; // Store as File
//           });
//           widget.onImagePicked(_image); // Return File
//         } else {
//           ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//               backgroundColor: Colors.purple,
//               content: Text('لم يتم اختيار صورة. ')));
//         }
//       }
//     } catch (e) {
//       print("Error: $e");
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     ImageProvider? imageProvider;
//     if (_image != null) {
//       if (kIsWeb) {
//         imageProvider = MemoryImage(_image as Uint8List);
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
//                           title: Text('اختر من الاستوديو'),
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
//               decoration: BoxDecoration(
//                 color: MyColors.custom_yellow,
//                 borderRadius: BorderRadius.all(Radius.circular(10)),
//               ),
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
//                   SizedBox(width: 8),
//                   Text('انقر هنا لتحميل الصورة'),
//                   SizedBox(width: 8),
//                   CircleAvatar(
//                     radius: 30,
//                     // backgroundColor: Colors.grey[300],
//                     backgroundImage: imageProvider,
//                     child: _image == null
//                         ? widget.defaultIcon is IconData
//                             ? Icon(
//                                 widget.defaultIcon,
//                                 size: 30,
//                                 color: Colors.black,
//                               )
//                             : widget.defaultIcon is String
//                                 ? ClipOval(
//                                     child: Image.network(
//                                       widget.defaultIcon,
//                                       fit: BoxFit.cover,
//                                       width:
//                                           60, // Set width and height to match the circle radius
//                                       height: 60,
//                                     ),
//                                   )
//                                 : null
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
import 'dart:typed_data';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

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
        if (source == ImageSource.camera) {
          // Handle camera access for web
          final result =
              await FilePicker.platform.pickFiles(type: FileType.image);
          if (result != null) {
            final bytes = result.files.single.bytes;
            if (bytes != null) {
              setState(() {
                _image = bytes; // Store as Uint8List
              });
              widget.onImagePicked(_image); // Return Uint8List
            } else {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                    backgroundColor: Colors.purple,
                    content: Text('لا بيانات صورة.')),
              );
            }
          } else {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                  backgroundColor: Colors.purple,
                  content: Text('لم يتم اختيار صورة.')),
            );
          }
        } else {
          // Handle gallery access for web
          final result =
              await FilePicker.platform.pickFiles(type: FileType.image);
          if (result != null) {
            final bytes = result.files.single.bytes;
            if (bytes != null) {
              setState(() {
                _image = bytes; // Store as Uint8List
              });
              widget.onImagePicked(_image); // Return Uint8List
            } else {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                    backgroundColor: Colors.purple,
                    content: Text('لا بيانات صورة.')),
              );
            }
          } else {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                  backgroundColor: Colors.purple,
                  content: Text('لم يتم اختيار صورة.')),
            );
          }
        }
      } else {
        final pickedFile = await picker.pickImage(source: source);
        if (pickedFile != null) {
          final file = File(pickedFile.path);
          setState(() {
            _image = file; // Store as File
          });
          widget.onImagePicked(_image); // Return File
        } else {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              backgroundColor: Colors.purple,
              content: Text('لم يتم اختيار صورة.')));
        }
      }
    } catch (e) {
      print("Error: $e");
    }
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
                color: Colors.yellow,
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
                                ? ClipOval(
                                    child: Image.network(
                                      widget.defaultIcon,
                                      fit: BoxFit.cover,
                                      width: 60,
                                      height: 60,
                                    ),
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
