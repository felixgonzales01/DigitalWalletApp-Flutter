import 'package:myflutter/constants/colors.dart';
import 'package:myflutter/screens/send_money.dart';
import 'package:myflutter/screens/view_card.dart';
import 'package:myflutter/screens/cashout_screen.dart';
import 'package:myflutter/screens/vouchers_screen.dart';
import 'package:myflutter/screens/scan_qr.dart';
import 'package:myflutter/screens/analytics.dart';
import 'package:myflutter/screens/wallet.dart';
import 'package:myflutter/screens/settings.dart';
import 'package:myflutter/widgets/history_widget.dart';
import 'package:myflutter/widgets/service_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterDocked,
      floatingActionButton: GestureDetector(
          onTap: () => Get.to(ScanQRScreen()),
          child: FloatingActionButton(
            onPressed: null,
            child: Icon(Icons.qr_code_scanner_rounded),
            backgroundColor: bgColor,
          )),
      backgroundColor: bgColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 40, 20, 0),
            child: Column(
              children: [
                _buildHeadContent(),
                _buildCreditCard(context),
                _buildServiceChoice(),
                const SizedBox(
                  height: 35,
                ),
                const HistoryWidget(
                  image: "assets/images/roey.png",
                  text: "Roey Bazar",
                  date: "02/10/23",
                  amount: "- ₱4,500",
                  amountColor: pinkColor,
                ),
                const SizedBox(
                  height: 10,
                ),
                const HistoryWidget(
                  image: "assets/images/carl.png",
                  text: "CJ Cabrera",
                  date: "02/08/23",
                  amount: "+ ₱50,000",
                  amountColor: Colors.green,
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: _buildBottomNavBar(),
    );
  }

  BottomNavigationBar _buildBottomNavBar() {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      backgroundColor: Colors.transparent,
      elevation: 0,
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(
            Icons.home_rounded,
          ),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.analytics_rounded,
          ),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.wallet_rounded),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.settings_rounded),
          label: '',
        ),
      ],
      currentIndex: 0,
      selectedItemColor: pinkColor,
      unselectedIconTheme: const IconThemeData(size: 30),
      selectedIconTheme: const IconThemeData(size: 30),
      unselectedItemColor: const Color.fromARGB(255, 105, 105, 105),
      onTap: ((value) {
        switch (value) {
          case 1:
            Get.to(AnalyticsScreen());
            break;
          case 2:
            Get.to(WalletScreen());
            break;
          case 3:
            Get.to(SettingsScreen());
            break;
          default:
        }
      }),
    );
  }

  Row _buildServiceChoice() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        InkWell(
          onTap: () => Get.to(SendScreen()),
          child: ServiceWidget(
            serviceName: "Send",
            icon: Icons.send,
            colorIcon: Colors.lightBlue,
            circleColor: Colors.blueAccent,
          ),
        ),
        SizedBox(
          width: 12,
        ),
        InkWell(
          onTap: () => Get.to(ViewCard()),
          child: ServiceWidget(
            serviceName: "View Card",
            icon: Icons.payment_rounded,
            colorIcon: Color.fromARGB(255, 248, 115, 106),
            circleColor: Colors.redAccent,
          ),
        ),
        SizedBox(width: 12),
        InkWell(
          onTap: () => Get.to(CashOutScreen()),
          child: ServiceWidget(
            serviceName: "Cash Out",
            icon: Icons.money_outlined,
            colorIcon: Color.fromARGB(255, 143, 190, 89),
            circleColor: Colors.green,
          ),
        ),
        SizedBox(
          width: 12,
        ),
        InkWell(
          onTap: () => Get.to(VoucherScreen()),
          child: ServiceWidget(
            serviceName: "Vouchers",
            icon: Icons.percent,
            colorIcon: Color.fromARGB(255, 225, 172, 103),
            circleColor: Colors.orangeAccent,
          ),
        ),
      ],
    );
  }

  Stack _buildCreditCard(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          "assets/images/credit.png",
          height: MediaQuery.of(context).size.height / 2.45,
        ),
        const Positioned(
          top: 185,
          left: 25,
          child: Text(
            "xxxx       xxxx      xxxx       1002",
            style: TextStyle(
                fontFamily: 'CircularStd',
                fontSize: 18,
                color: Colors.black38,
                fontWeight: FontWeight.bold),
          ),
        ),
        const Positioned(
          top: 50,
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
          top: 220,
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
        )
      ],
    );
  }

  Row _buildHeadContent() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  "Welcome Back!",
                  style: TextStyle(
                      fontFamily: 'CircularStd',
                      color: Colors.white38,
                      fontSize: 16.5),
                ),
              ],
            ),
            //SizedBox(height: 6,),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: const [
                Text(
                  "Felix Gonzales",
                  style: TextStyle(
                      fontFamily: 'CircularStd',
                      color: whiteColor,
                      fontSize: 20),
                ),
              ],
            )
          ],
        ),
      ],
    );
  }
}
