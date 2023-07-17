import 'package:myflutter/constants/colors.dart';
import 'package:flutter/material.dart';

class ServiceWidget extends StatelessWidget {
  final String serviceName;
  final Color colorIcon;
  final IconData icon;
  final Color circleColor;
  const ServiceWidget({
    Key? key,
    required this.serviceName,
    required this.colorIcon,
    required this.icon,
    required this.circleColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          backgroundColor: circleColor.withOpacity(0.3),
          radius: 30,
          child: Icon(icon, color: colorIcon),
        ),
        const SizedBox(height: 12),
        Text(
          serviceName,
          style: TextStyle(
              fontFamily: 'CircularStd',
              color: whiteColor.withOpacity(0.5),
              fontSize: 13.5),
        ),
      ],
    );
  }
}
