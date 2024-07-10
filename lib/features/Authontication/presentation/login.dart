import 'package:flutter/material.dart';
import 'package:nibras_group_jor/core/helper/constants/my_colors.dart';
import 'package:nibras_group_jor/core/helper/constants/strings.dart';

import '../../../core/widgets/custom_text_feild.dart';
import 'widgets/backgroundScreen.dart';
import 'package:intl/intl.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<Login> {
  late TextEditingController passwordController;
  final GlobalKey<FormState> _formKey = GlobalKey();
  DateTime now = DateTime.now();

  // Format for the date (e.g., 17 Sep 2020)
  String formattedDate = DateFormat(' yyyy dd MMM  ').format(DateTime.now()); //
  // Format for the time (e.g., 01:02:50 PM)
  String formattedTime = DateFormat('hh:mm:ss a  ').format(DateTime.now());
  bool _isHidden = true;
  void _togglePasswordView() {
    setState(() {
      _isHidden = !_isHidden;
    });
  }

  @override
  void initState() {
    passwordController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white54,
          ),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: SingleChildScrollView(
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Column(
                        children: [
                          Text('NIBRAS',
                              style: TextStyle(
                                  letterSpacing: 12,
                                  color: MyColors.custom_yellow,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w800)),
                          Text(' لادارة الشؤون القانونية',
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.w800)),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '$formattedTime',
                          style: TextStyle(
                            color: MyColors.custom_yellow,
                            fontSize: 14,
                          ),
                        ),
                        Text(
                          '$formattedDate',
                          style: TextStyle(
                            color: MyColors.custom_yellow,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    const CustomTextField(
                      label: 'اسم المستخدم',
                      hintText: '  ',
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    CustomTextField(
                      label: 'كلمة المرور',
                      hintText: '  ',
                      obscureText: !_isHidden,
                      suffixIcon: GestureDetector(
                        onTap: _togglePasswordView,
                        child: Icon(
                          _isHidden ? Icons.visibility : Icons.visibility_off,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text(
                        'تعديل كلمة المرور؟',
                        style:
                            TextStyle(color: MyColors.custom_red, fontSize: 12),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    InkWell(
                      onTap: () {
                        if (_formKey.currentState!.validate()) {
                          Navigator.pushReplacementNamed(context, homeScreen);
                        }
                      },
                      child: Container(
                        padding: const EdgeInsets.all(12),
                        width: double.infinity,
                        decoration: const BoxDecoration(
                            color: MyColors.custom_yellow,
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                        child: const Center(
                          child: Text(
                            'الدخول الى النظام',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 120,
                    ),
                    const Center(
                        child: Text(
                      'يــاخيـرَ ذاكــرةٍ تـُوَثِّقُ للـورى         ما خَطَّهُ الفِكْرُ السَّليمُ ونَظَّما ',
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold),
                    )),
                    const Center(
                        child: Text(
                      'مسجل لدى دائرة المكتبة الوطنية تحت رقم ايداع (2023/3/1555) ',
                      style: TextStyle(
                          color: MyColors.custom_dark_grey,
                          fontWeight: FontWeight.bold),
                    )),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
/*
                                                                             
    

*/