import 'dart:ui';

import 'package:myflutter/constants/colors.dart';
import 'package:myflutter/screens/home_screen.dart';
import 'package:myflutter/screens/signup_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _mobileNumberController = TextEditingController();
  bool _isMobileNumberValid = false;

  @override
  void dispose() {
    _mobileNumberController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        centerTitle: true,
      ),
      body: Form(
        key: _formKey,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Container(
                height: MediaQuery.of(context).size.height / 2,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white.withOpacity(0.1)),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Enter your mobile number",
                          style: TextStyle(
                              fontFamily: 'CircularStd',
                              color: whiteColor,
                              fontSize: 26)),
                      const SizedBox(
                        height: 20,
                      ),
                      _buildLoginMethodChoice(),
                      const SizedBox(
                        height: 15,
                      ),
                      _buildTextFormField(),
                      const SizedBox(
                        height: 40,
                      ),
                      _buildButtonSignIn(context),
                      const SizedBox(
                        height: 10,
                      ),
                      _buildSignUpButton(context),
                    ]),
              ),
            ),
          ],
        ),
      ),
    );
  }

  InkWell _buildButtonSignIn(BuildContext context) {
    return InkWell(
      onTap: () {
        if (_formKey.currentState!.validate()) {
          if (_isMobileNumberValid) {
            Get.to(const HomeScreen());
          } else {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('Please enter a valid Philippine mobile number.'),
              ),
            );
          }
        }
      },
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20), color: pinkColor),
        height: 40,
        width: MediaQuery.of(context).size.width / 3,
        child: const Center(
            child: Text(
          "Sign In",
          style: TextStyle(color: whiteColor, fontWeight: FontWeight.bold),
        )),
      ),
    );
  }

  Padding _buildTextFormField() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: TextFormField(
        controller: _mobileNumberController,
        keyboardType: TextInputType.number,
        cursorColor: whiteColor,
        style: const TextStyle(fontFamily: 'CircularStd', color: whiteColor),
        decoration: InputDecoration(
          iconColor: whiteColor,
          prefixIcon: const Icon(Icons.phone_iphone_rounded),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          fillColor: whiteColor,
          hintStyle: TextStyle(
              color: whiteColor.withOpacity(0.4), fontFamily: 'CircularStd'),
          labelStyle: const TextStyle(
            fontFamily: 'CircularStd',
            color: pinkColor,
          ),
          hintText: "+63 XXX XXX XXXX",
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter your mobile number.';
          } else if (!RegExp(r'^\d{10}$').hasMatch(value)) {
            return 'Please enter a valid 10-digit mobile number.';
          }
          return null;
        },
        onChanged: (value) {
          setState(() {
            _isMobileNumberValid = _formKey.currentState!.validate();
          });
        },
      ),
    );
  }

  Container _buildLoginMethodChoice() {
    return Container(
      height: 50,
      width: 180,
      decoration: BoxDecoration(
          color: whiteColor, borderRadius: BorderRadius.circular(20)),
      child: InkWell(
        child: Container(
          height: 45,
          width: 85,
          child: const Icon(
            Icons.phone_iphone_rounded,
            color: whiteColor,
          ),
          decoration: BoxDecoration(
              color: pinkColor, borderRadius: BorderRadius.circular(20)),
        ),
      ),
    );
  }

  InkWell _buildSignUpButton(BuildContext context) {
    return InkWell(
      onTap: (() {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => SignUpScreen()),
        );
      }),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20), color: whiteColor),
        height: 40,
        width: MediaQuery.of(context).size.width / 3,
        child: const Center(
            child: Text(
          "Sign Up",
          style: TextStyle(
            color: pinkColor,
            fontWeight: FontWeight.bold,
          ),
        )),
      ),
    );
  }
}
