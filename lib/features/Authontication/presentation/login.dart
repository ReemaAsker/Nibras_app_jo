import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:nibras_group_jor/core/helper/constants/my_colors.dart';
import 'package:nibras_group_jor/core/helper/constants/strings.dart';
import 'package:nibras_group_jor/core/widgets/validations_rules.dart';
import '../../../core/widgets/custom_text_feild.dart'; // Importing a custom text field widget
import 'package:intl/intl.dart'; // Importing intl package for date and time formatting

// A stateful widget for the login page
class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _MyWidgetState();
}

// State class for the Login widget
class _MyWidgetState extends State<Login> {
  late TextEditingController
      passwordController; // Controller for the password text field
  final GlobalKey<FormState> _formKey = GlobalKey(); // Global key for the form
  DateTime now = DateTime.now(); // Current date and time

  // Format for the date (e.g., 17 Sep 2020)
  String formattedDate = DateFormat(' yyyy dd MMM  ').format(DateTime.now());

  // Format for the time (e.g., 01:02:50 PM)
  String formattedTime = DateFormat('hh:mm:ss a  ').format(DateTime.now());

  bool _isHidden = true; // Variable to toggle password visibility

  // Method to toggle the visibility of the password
  void _togglePasswordView() {
    setState(() {
      _isHidden = !_isHidden;
    });
  }

  @override
  void initState() {
    passwordController =
        TextEditingController(); // Initializing the password controller
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0), // Padding around the container
          child: SingleChildScrollView(
            child: Form(
              key: _formKey, // Assigning the form key
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            AnimatedTextKit(
                              animatedTexts: [
                                TyperAnimatedText(' NIBRAS',
                                    textStyle: TextStyle(
                                        letterSpacing: 28,
                                        fontSize: 25,
                                        fontWeight: FontWeight.bold,
                                        color: MyColors.custom_blue)),
                                TyperAnimatedText(
                                    'نَـــــــــــبْـــــــــــــرَاسٌ',
                                    textStyle: TextStyle(
                                        fontSize: 25,
                                        fontWeight: FontWeight.bold,
                                        color: MyColors.custom_blue)),
                              ],
                              isRepeatingAnimation: true,
                              totalRepeatCount: 10,
                              pause: Duration(milliseconds: 4000),
                            ),
                          ],
                        ),
                        AnimatedTextKit(
                          animatedTexts: [
                            TyperAnimatedText(' لادارة الشؤون القانونية',
                                textStyle: TextStyle(
                                    letterSpacing: 3,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: MyColors.custom_yellow)),
                          ],
                          isRepeatingAnimation: true,
                          totalRepeatCount: 10,
                          pause: Duration(milliseconds: 4000),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 50), // Spacer
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '$formattedTime', // Display formatted time
                        style: TextStyle(
                          color: MyColors.custom_yellow,
                          fontSize: 14,
                        ),
                      ),
                      Text(
                        '$formattedDate', // Display formatted date
                        style: TextStyle(
                          color: MyColors.custom_yellow,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 40), // Spacer
                  CustomTextField(
                    validator: (value) => IsTextEmpty(value),
                    label: 'اسم المستخدم', // Username field label
                    hintText: '  ',
                  ),
                  SizedBox(height: 20), // Spacer
                  CustomTextField(
                    // validator: (value) => passwordValidation(value),
                    label: 'كلمة المرور', // Password field label
                    hintText: '  ',
                    obscureText: !_isHidden, // Obscure text based on _isHidden
                    suffixIcon: GestureDetector(
                      onTap: _togglePasswordView, // Toggle password visibility
                      child: Icon(
                        _isHidden ? Icons.visibility : Icons.visibility_off,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      'تعديل كلمة المرور؟', // Text for password modification
                      style: TextStyle(
                        color: MyColors.custom_red,
                        fontSize: 12,
                      ),
                    ),
                  ),
                  SizedBox(height: 30), // Spacer
                  InkWell(
                    onTap: () {
                      if (_formKey.currentState!.validate()) {
                        Navigator.pushReplacementNamed(context,
                            homeScreen); // Navigate to home screen if the form is valid
                      }
                    },
                    child: Container(
                      padding: const EdgeInsets.all(12),
                      width: double.infinity,
                      decoration: const BoxDecoration(
                        color: MyColors.custom_yellow, // Button color
                        borderRadius: BorderRadius.all(
                            Radius.circular(10)), // Button border radius
                      ),
                      child: const Center(
                        child: Text(
                          'الدخول الى النظام', // Button text
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 120), // Spacer
                  const Center(
                    child: Text(
                      'يــاخيـرَ ذاكــرةٍ تـُوَثِّقُ للـورى         ما خَطَّهُ الفِكْرُ السَّليمُ ونَظَّما ', // Arabic quote
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const Center(
                    child: Text(
                      'مسجل لدى دائرة المكتبة الوطنية تحت رقم ايداع (2023/3/1555) ', // Registration text
                      style: TextStyle(
                        color: MyColors.custom_dark_grey,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
