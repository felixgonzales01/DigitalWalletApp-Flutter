import 'package:flutter/material.dart';
import 'package:myflutter/constants/colors.dart';

class ViewCard extends StatelessWidget {
  const ViewCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Stack(
        children: [
          Image.asset(
            "assets/images/credit.png",
            height: MediaQuery.of(context).size.height / 2.25,
          ),
          const Positioned(
            top: 215,
            left: 25,
            child: Text(
              "5113       4532      9803       1002",
              style: TextStyle(
                  fontFamily: 'CircularStd',
                  fontSize: 18,
                  color: Colors.black38,
                  fontWeight: FontWeight.bold),
            ),
          ),
          const Positioned(
            top: 60,
            left: 25,
            child: Text(
              "FELIX GONZALES",
              style: TextStyle(
                  fontFamily: 'CircularStd',
                  fontSize: 16,
                  color: Colors.black38,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Positioned(
            top: 255,
            left: 25,
            child: Column(
              children: [
                const Text(
                  "Available Balance",
                  style: TextStyle(
                    fontFamily: 'CircularStd',
                    fontSize: 12,
                    color: Colors.black38,
                  ),
                ),
                Text(
                  "₱45,500",
                  style: TextStyle(
                      fontFamily: 'CircularStd',
                      fontSize: 16,
                      color: bgColor.withOpacity(0.9),
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
