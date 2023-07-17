import 'package:myflutter/constants/colors.dart';
import 'package:flutter/material.dart';

class HistoryWidget extends StatelessWidget {
  final String image;
  final String text;
  final String date;
  final String amount;
  final Color amountColor;
  const HistoryWidget({
    Key? key,
    required this.image,
    required this.text,
    required this.date,
    required this.amount,
    required this.amountColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 100,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: whiteColor.withOpacity(0.2)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            CircleAvatar(radius: 30, backgroundImage: AssetImage(image)),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  text,
                  style: const TextStyle(
                      fontFamily: 'CircularStd',
                      color: whiteColor,
                      fontSize: 13),
                ),
                Text(
                  date,
                  style: TextStyle(
                      fontFamily: 'CircularStd',
                      color: whiteColor.withOpacity(0.5),
                      fontSize: 12),
                ),
              ],
            ),
            Text(
              amount,
              style: TextStyle(
                  fontFamily: 'CircularStd',
                  color: amountColor.withOpacity(0.8),
                  fontSize: 13.5),
            ),
          ],
        ),
      ),
    );
  }
}
