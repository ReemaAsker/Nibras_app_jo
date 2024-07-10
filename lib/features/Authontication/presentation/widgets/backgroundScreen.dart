import 'package:flutter/material.dart';

class BackgroundWidget extends StatelessWidget {
  final Widget body;

  const BackgroundWidget({
    required this.body,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("images/bb.jpg"),
          fit: BoxFit.fill,
        ),
      ),
      child: body,
    );
  }
}
