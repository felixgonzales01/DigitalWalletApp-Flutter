import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:myflutter/constants/colors.dart';
import 'package:myflutter/widgets/custom_tex_widget.dart';

class SendScreen extends StatefulWidget {
  const SendScreen({Key? key});

  @override
  _SendScreenState createState() => _SendScreenState();
}

class _SendScreenState extends State<SendScreen> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController _phoneNumberController = TextEditingController();
  TextEditingController _amountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            CustomText(
              text: "Send money",
              size: 20,
              color: whiteColor,
            ),
            SizedBox(
              height: 10,
            ),
            Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    controller: _phoneNumberController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter a phone number';
                      } else if (value.length != 11) {
                        return 'Phone number should contain 11 digits';
                      }
                      return null;
                    },
                    keyboardType: TextInputType.phone,
                    decoration: InputDecoration(
                      hintText: "+63 XXX XXX XXXX",
                      hintStyle: TextStyle(color: whiteColor.withOpacity(0.5)),
                      // set text color to white
                      // use TextStyle with color property or set it directly
                      // with Colors.white
                      // style: TextStyle(color: Colors.white),
                    ),
                    style: TextStyle(color: Colors.white),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    controller: _amountController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter an amount';
                      } else if (int.tryParse(value) == null) {
                        return 'Please enter a valid amount';
                      }
                      return null;
                    },
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      hintText: "Enter amount",
                      hintStyle: TextStyle(color: whiteColor.withOpacity(0.5)),
                      // set text color to white
                    ),
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  _showSuccessDialog(context, _phoneNumberController.text,
                      int.parse(_amountController.text));
                }
              },
              child: Text('Send'),
            )
          ],
        ),
      ),
    );
  }

  void _showSuccessDialog(
      BuildContext context, String phoneNumber, int amount) {
    final referenceNumber = DateTime.now().millisecondsSinceEpoch;
    final date = DateFormat('MMM d, y').format(DateTime.now());
    final time = DateFormat.jm().format(DateTime.now());

    AwesomeDialog(
      context: context,
      dialogType: DialogType.SUCCES,
      animType: AnimType.BOTTOMSLIDE,
      title: 'Success',
      desc:
          'Money sent successfully\n\nRecipient: $phoneNumber\nAmount: $amount\nReference Number: $referenceNumber\nDate: $date\nTime: $time',
      btnOkText: 'OK',
      btnOkOnPress: () {
        Navigator.of(context).pop();
      },
    ).show();
  }
}
