import 'package:flutter/material.dart';
import 'package:myflutter/constants/colors.dart';

class WalletScreen extends StatelessWidget {
  const WalletScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Wallet'),
        backgroundColor: bgColor,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            color: Colors.blueGrey[100],
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Total Balance',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  '\₱45,500.00',
                  style: TextStyle(
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(16),
              children: [
                _buildTransactionItem(
                  name: 'Power Mac Center',
                  date: 'Feb 25, 2023',
                  amount: -49990.0,
                ),
                _buildTransactionItem(
                  name: 'Transfer from Carl Roey Maneja',
                  date: 'Feb 24, 2023',
                  amount: 32000.0,
                ),
                _buildTransactionItem(
                  name: 'Starbucks',
                  date: 'Feb 23, 2023',
                  amount: -683.50,
                ),
                _buildTransactionItem(
                  name:
                      'Technological Institute of the Philippines Quezon City',
                  date: 'Feb 22, 2023',
                  amount: -70000.0,
                ),
                _buildTransactionItem(
                  name: 'Transfer to Nicole Gonzales',
                  date: 'Feb 21, 2023',
                  amount: -5000.0,
                ),
                _buildTransactionItem(
                  name: 'McDonalds',
                  date: 'Feb 20, 2023',
                  amount: -239.0,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTransactionItem({
    required String name,
    required String date,
    required double amount,
  }) {
    return ListTile(
      title: Text(name),
      subtitle: Text(date),
      trailing: Text(
        '\₱${amount.toStringAsFixed(2)}',
        style: TextStyle(
          color: amount < 0 ? Colors.red : Colors.green,
        ),
      ),
    );
  }
}
