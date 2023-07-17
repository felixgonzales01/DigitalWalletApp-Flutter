import 'dart:math';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:myflutter/constants/colors.dart';
import 'package:share/share.dart';
import 'package:image_picker/image_picker.dart';

import 'login_screen.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  String _referralCode = '';
  final ImagePicker _imagePicker = ImagePicker();
  late ImageProvider<Object> _imageProvider;

  // Function to handle logout
  void _handleLogout() {
    // Navigate to LoginScreen
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => LoginScreen()),
        (route) => false);
  }

  // Function to generate random referral code
  String _generateReferralCode() {
    var random = Random();
    var code = '';
    for (var i = 0; i < 6; i++) {
      code += random.nextInt(9).toString();
    }
    return code;
  }

  // Function to select an image from gallery
  Future<void> _selectImage() async {
    final pickedFile = await _imagePicker.pickImage(
      source: ImageSource.gallery,
    );
    if (pickedFile != null) {
      setState(() {
        _imageProvider = FileImage(
          File(pickedFile.path),
        );
      });
    }
  }

  // Function to take a photo with the camera
  Future<void> _takePhoto() async {
    final pickedFile = await _imagePicker.pickImage(
      source: ImageSource.camera,
    );
    if (pickedFile != null) {
      setState(() {
        _imageProvider = FileImage(
          File(pickedFile.path),
        );
      });
    }
  }

  // Function to show permission error dialog
  void _showPermissionErrorDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Permissions error'),
          content: Text('Please grant camera and gallery access.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }

  @override
  void initState() {
    super.initState();
    _imageProvider = NetworkImage(
        'https://scontent.fmnl4-2.fna.fbcdn.net/v/t1.15752-9/343555512_6262999640389059_503916406130302505_n.jpg?_nc_cat=106&ccb=1-7&_nc_sid=ae9488&_nc_eui2=AeFPvMVfPA-frYTPytoTQ1wVWqTFfV5yxhRapMV9XnLGFA8mx-dQognzythxOrRKswfd97OCgQqKPD7iRuR7s__H&_nc_ohc=M69k8cD3kmgAX-RabmX&_nc_ht=scontent.fmnl4-2.fna&oh=03_AdQL1QLkvliiJICFd2StmY6CwVhnIV57XGLiaF_E3zy4Ng&oe=647FFF4B');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
        backgroundColor: bgColor,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 16.0),
            UserAccountWidget(
              name: 'Felix Gonzales',
              mobileNumber: '+639123456789',
              imageProvider: _imageProvider,
              logoUrl: '',
              onTap: () {
                showModalBottomSheet(
                  context: context,
                  builder: (BuildContext context) {
                    return Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        ListTile(
                          leading: Icon(Icons.photo_library),
                          title: Text('Choose from gallery'),
                          onTap: () {
                            Navigator.pop(context);
                            _selectImage();
                          },
                        ),
                        ListTile(
                          leading: Icon(Icons.camera_alt),
                          title: Text('Take a photo'),
                          onTap: () {
                            Navigator.pop(context);
                            _takePhoto();
                          },
                        ),
                      ],
                    );
                  },
                );
              },
            ),
            SizedBox(height: 16.0),
            Text(
              'Invite a friend and get a reward!',
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            ),
            ListTile(
              title: Text('Invite friends'),
              leading: Icon(Icons.people),
              onTap: () {
                setState(() {
                  _referralCode = _generateReferralCode();
                });
                // Generate referral code and show share sheet
                final RenderBox box = context.findRenderObject() as RenderBox;
                Share.share(
                    'Get a reward when you sign up to GKoosh using my invite code! $_referralCode',
                    subject: 'Join the app with my referral code',
                    sharePositionOrigin:
                        box.localToGlobal(Offset.zero) & box.size);
              },
              subtitle: _referralCode.isEmpty
                  ? null
                  : Text('This is your referral code: $_referralCode'),
            ),
            SizedBox(height: 16.0),
            Text(
              'Account',
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            ),
            ListTile(
              title: Text('Log out'),
              leading: Icon(Icons.logout),
              onTap: _handleLogout,
            ),
            SizedBox(height: 16.0),
            Text(
              'About',
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            ),
            ListTile(
              title: Text('Version'),
              subtitle: Text('1.0.0'),
              leading: Icon(Icons.info_outline),
            ),
            SizedBox(height: 15.0),
            Align(
              alignment: Alignment.centerRight,
              child: Container(
                width: 350.0,
                child: Image.asset(
                  'assets/images/gkoosh.png',
                  height: 200.0,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class UserAccountWidget extends StatelessWidget {
  final String name;
  final String mobileNumber;
  final ImageProvider<Object> imageProvider;
  final String logoUrl;
  final VoidCallback onTap;

  const UserAccountWidget({
    Key? key,
    required this.name,
    required this.mobileNumber,
    required this.imageProvider,
    required this.logoUrl,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        children: [
          CircleAvatar(
            backgroundImage: imageProvider,
            radius: 30.0,
          ),
          SizedBox(width: 16.0),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18.0,
                ),
              ),
              Text(mobileNumber),
            ],
          ),
        ],
      ),
    );
  }
}
