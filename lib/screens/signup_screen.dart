import 'package:flutter/material.dart';
import 'package:myflutter/constants/colors.dart';
import 'package:myflutter/screens/home_screen.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  bool _termsAndConditionsAccepted = false;
  final _formKey = GlobalKey<FormState>();
  final _passwordController =
      TextEditingController(); // Add password controller

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Sign Up'),
          backgroundColor: bgColor,
        ),
        body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: SingleChildScrollView(
              child: Container(
                height: 650, // set a fixed height for the child widget
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 16.0),
                      TextFormField(
                        decoration: InputDecoration(
                          hintText: 'Full Name',
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 16.0, vertical: 12.0),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter your name';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 16.0),
                      TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          hintText: 'Email Address',
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 16.0, vertical: 12.0),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter your email address';
                          }
                          // add email format validation
                          if (!RegExp(r'\S+@\S+\.\S+').hasMatch(value)) {
                            return 'Please enter a valid email address';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 16.0),
                      TextFormField(
                        keyboardType: TextInputType.phone,
                        decoration: InputDecoration(
                          hintText: 'Mobile Number',
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 16.0, vertical: 12.0),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter your mobile number';
                          }
                          // add mobile number format validation
                          if (!RegExp(r'^\+?\d{10,12}$').hasMatch(value)) {
                            return 'Please enter a valid mobile number';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 16.0),
                      TextFormField(
                        controller:
                            _passwordController, // add password controller
                        obscureText: true,
                        decoration: InputDecoration(
                          hintText: 'Password',
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 16.0, vertical: 12.0),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter a password';
                          }
// add password length validation
                          if (value.length < 8) {
                            return 'Password should be at least 8 characters long';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 16.0),
                      TextFormField(
                        obscureText: true,
                        decoration: InputDecoration(
                          hintText: 'Confirm Password',
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 16.0, vertical: 12.0),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please confirm your password';
                          }
// add password match validation
                          if (value != _passwordController.text) {
                            return 'Passwords do not match';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 16.0),
                      TextFormField(
                        keyboardType: TextInputType.number,
                        maxLength: 6, // set max length to 6
                        decoration: InputDecoration(
                          hintText: 'Referral Code (Optional)',
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 16.0, vertical: 12.0),
                        ),
                        validator: (value) {
// validate only if value is not empty
                          if (value!.isNotEmpty) {
// validate if value is numeric
                            if (!RegExp(r'^\d+$').hasMatch(value)) {
                              return 'Referral code can only contain numbers';
                            }
// validate length
                            if (value.length != 6) {
                              return 'Referral code should be 6 digits';
                            }
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 16.0),
                      Text(
                        'By signing up, you agree to our Terms and Conditions.',
                        style: TextStyle(fontSize: 16.0),
                      ),
                      Spacer(),
                      Center(
                        child: ElevatedButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              _showTermsAndConditionsDialog();
                            }
                          },
                          child: Text(
                            'Create Account',
                            style: TextStyle(fontSize: 20.0),
                          ),
                          style: ElevatedButton.styleFrom(
                            primary: pinkColor,
                            padding: EdgeInsets.symmetric(
                                horizontal: 50.0, vertical: 16.0),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30.0),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 16.0),
                    ],
                  ),
                ),
              ),
            )));
  }

  void _showTermsAndConditionsDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Terms and Conditions'),
          content: SingleChildScrollView(
            child: Text(
              'Welcome to GKoosh. By using this app, you agree to these terms and conditions. Please read them carefully.\n\n' +
                  '1. Account Registration\n\n' +
                  'You must register an account with us to use GKoosh. You agree to provide accurate and complete information during registration and to update your account information promptly if any changes occur.\n\n' +
                  '2. Transactions\n\n' +
                  'Our digital wallet app allows you to make transactions such as sending and receiving funds. You are responsible for ensuring that all transactions you initiate are authorized and legitimate. We are not responsible for any losses you may incur due to unauthorized or fraudulent transactions.\n\n' +
                  '3. Fees and Charges\n\n' +
                  'We may charge fees and other charges for using GKoosh. These fees and charges will be disclosed to you before you initiate any transaction. You agree to pay all applicable fees and charges associated with your use of our app.\n\n' +
                  '4. Disclaimers and Limitations of Liability\n\n' +
                  'GKOOSH IS PROVIDED ON AN "AS IS" BASIS WITHOUT WARRANTIES OF ANY KIND, EITHER EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE, OR NON-INFRINGEMENT. WE DO NOT WARRANT THAT THE APP WILL BE ERROR-FREE OR UNINTERRUPTED, OR THAT ANY DEFECTS WILL BE CORRECTED. WE ARE NOT LIABLE FOR ANY INDIRECT, INCIDENTAL, SPECIAL, CONSEQUENTIAL, OR PUNITIVE DAMAGES ARISING OUT OF OR IN CONNECTION WITH YOUR USE OF THE APP.\n\n' +
                  '5. Governing Law and Jurisdiction\n\n' +
                  'These terms and conditions are governed by and construed in accordance with the laws of the Republic of the Philippines. Any dispute arising out of or in connection with these terms and conditions or your use of the app shall be subject to the exclusive jurisdiction of the courts in the City of Manila.\n\n' +
                  'If you have any questions about these terms and conditions, please contact us at support@gkoosh.com.',
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(builder: (_) => HomeScreen()),
                  (Route<dynamic> route) => false,
                );
              },
              child: Text('Agree'),
            ),
          ],
        );
      },
    );
  }
}
