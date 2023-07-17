import 'package:myflutter/constants/colors.dart';
import 'package:myflutter/screens/home_screen.dart';
import 'package:myflutter/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Icon(
              Icons.wallet,
              color: whiteColor,
            ),
            SizedBox(
              width: 8,
            ),
            Text(
              "GKoosh",
              style: TextStyle(
                fontFamily: 'CircularStd',
                color: whiteColor,
              ),
            )
          ],
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Stack(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height / 2.3,
                  // color: Colors.white,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(40),
                    color: Colors.white.withOpacity(0.15),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      const Text(
                        "Fueling the flames of ",
                        style: TextStyle(
                            fontFamily: 'CircularStd',
                            color: whiteColor,
                            fontSize: 30),
                      ),
                      const Text(
                        "digital finance",
                        style: TextStyle(
                            fontFamily: 'CircularStd',
                            color: whiteColor,
                            fontSize: 30),
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      const Text(
                        "Let the smoke of digital finance waft",
                        style: TextStyle(
                            fontFamily: 'CircularStd',
                            color: Colors.white38,
                            fontSize: 15.5),
                      ),
                      const Text(
                        "through your fingertips",
                        style: TextStyle(
                            fontFamily: 'CircularStd',
                            color: Colors.white38,
                            fontSize: 15.5),
                      ),
                      const SizedBox(
                        height: 65,
                      ),
                      InkWell(
                        onTap: (() {
                          Get.to(LoginScreen());
                        }),
                        child: const CircleAvatar(
                          radius: 30,
                          backgroundColor: pinkColor,
                          child: Icon(
                            Icons.arrow_forward,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 27,
                      )
                    ],
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Image.asset(
                    "assets/images/gkoosh.png",
                    height: MediaQuery.of(context).size.height / 2.5,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
