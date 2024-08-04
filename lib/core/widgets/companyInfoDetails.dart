import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CompanyInfoWidget extends StatefulWidget {
  const CompanyInfoWidget(
      {super.key, this.resList = const [], this.clikable = true});
  final List<String> resList;
  final bool clikable;

  @override
  State<CompanyInfoWidget> createState() => _CompanyWidgetState();
}

class _CompanyWidgetState extends State<CompanyInfoWidget> {
  String addLineBreakAfterTwoWords(String sen) {
    List<String> words = sen.split(' ');

    if (words.length > 3) {
      List<String> result = [];
      for (int i = 0; i < words.length; i += 6) {
        int endIndex = (i + 6 < words.length) ? i + 6 : words.length;
        result.add(words.sublist(i, endIndex).join(' '));
      }
      return result.join('\n');
    } else {
      return sen;
    }
  }

  Color _containerColor = Colors.white54;

  void _changeContainerColor() {
    setState(() {
      _containerColor = Colors.amber;
      Navigator.of(context).pop();
    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.clikable ? _changeContainerColor : null,
      child: Container(
        padding: EdgeInsets.all(12),
        margin: EdgeInsets.symmetric(vertical: 8),
        decoration: BoxDecoration(
            color: widget.clikable
                ? _containerColor
                : _containerColor.withOpacity(0),
            borderRadius: BorderRadius.circular(10)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            for (var res in widget.resList)
              Row(
                children: [
                  Text(addLineBreakAfterTwoWords(res)),
                  SizedBox(
                    width: 10,
                  )
                ],
              )
          ],
        ),
      ),
    );
  }
}
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';

// class CompanyInfoWidget extends StatefulWidget {
//   const CompanyInfoWidget({
//     this.resList = const [],
//   }) : super();

//   final List<String> resList;

//   @override
//   State<CompanyInfoWidget> createState() => _CompanyWidgetState();
// }

// class _CompanyWidgetState extends State<CompanyInfoWidget> {
//   String addLineBreakAfterTwoWords(String sen) {
//     List<String> words = sen.split(' ');

//     if (words.length > 3) {
//       List<String> result = [];
//       for (int i = 0; i < words.length; i += 6) {
//         int endIndex = (i + 6 < words.length) ? i + 6 : words.length;
//         result.add(words.sublist(i, endIndex).join(' '));
//       }
//       return result.join('\n');
//     } else {
//       return sen;
//     }
//   }

//   Color _containerColor = Colors.white54;

//   void _changeContainerColor() {
//     setState(() {
//       _containerColor = Colors.amber;
//       Navigator.of(context).pop();
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return InkWell(
//       onTap: _changeContainerColor,
//       child: Container(
//         padding: EdgeInsets.all(12),
//         margin: EdgeInsets.symmetric(vertical: 8),
//         decoration: BoxDecoration(
//             color: _containerColor, borderRadius: BorderRadius.circular(10)),
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//           children: [
//             for (var res in widget.resList)
//               Row(
//                 children: [
//                   TextField(
//                     decoration: InputDecoration(
//                       hintText: res,
//                     ),
//                   ),
//                   Spacer(),
//                 ],
//               ),
//           ],
//         ),
//       ),
//     );
//   }
// }
