import 'package:flutter/material.dart';
import 'package:myflutter/constants/colors.dart';

class VoucherScreen extends StatefulWidget {
  const VoucherScreen({Key? key}) : super(key: key);

  @override
  _VoucherScreenState createState() => _VoucherScreenState();
}

class _VoucherScreenState extends State<VoucherScreen> {
  List<String> availableVouchers = [
    'GKoosh Welcome Reward',
    'Unique Senders Cashback Promo',
    'Receive Money Promo',
  ];
  List<String> claimedVouchers = [];

  void _onVoucherTap(String voucher) {
    setState(() {
      availableVouchers.remove(voucher);
      claimedVouchers.add(voucher);
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Vouchers'),
          backgroundColor: bgColor,
          bottom: TabBar(
            tabs: [
              Tab(text: 'Available'),
              Tab(text: 'Claimed'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            _buildAvailableVouchers(),
            _buildClaimedVouchers(),
          ],
        ),
      ),
    );
  }

  Widget _buildAvailableVouchers() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            '',
            style: Theme.of(context).textTheme.headline6,
          ),
          SizedBox(height: 16),
          Expanded(
            child: ListView.builder(
              itemCount: availableVouchers.length,
              itemBuilder: (context, index) {
                final voucher = availableVouchers[index];
                return _buildVoucherTile(
                  voucher,
                  '₱${index + 1}00.00',
                  'Expires on 31 May 2023',
                  () => _onVoucherTap(voucher),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildClaimedVouchers() {
    return Center(
      child: claimedVouchers.isEmpty
          ? Text(
              'No claimed vouchers yet.',
              style: TextStyle(fontSize: 18),
            )
          : ListView.builder(
              itemCount: claimedVouchers.length,
              itemBuilder: (context, index) {
                final voucher = claimedVouchers[index];
                return _buildVoucherTile(
                  voucher,
                  '₱${index + 1}00.00',
                  'Expires on 31 May 2023',
                  () {},
                );
              },
            ),
    );
  }

  Widget _buildVoucherTile(
      String title, String price, String expiry, VoidCallback onTap) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.0),
        color: bgColor,
      ),
      child: ListTile(
        title: Text(
          price,
          style: TextStyle(color: Colors.white),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(color: Colors.white),
            ),
            SizedBox(height: 8),
            Text(
              expiry,
              style: TextStyle(color: Colors.grey),
            ),
          ],
        ),
        trailing: Icon(Icons.arrow_forward),
        onTap: onTap,
      ),
    );
  }
}
