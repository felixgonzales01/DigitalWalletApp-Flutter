import 'package:flutter/material.dart';
import 'package:myflutter/constants/colors.dart';

class AnalyticsScreen extends StatelessWidget {
  const AnalyticsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Analytics'),
        backgroundColor: bgColor,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Spending by category',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                _buildCategoryItem(
                  category: 'Food',
                  amount: 3200.0,
                ),
                _buildCategoryItem(
                  category: 'Entertainment',
                  amount: 4600.0,
                ),
                _buildCategoryItem(
                  category: 'Transportation',
                  amount: 1500.0,
                ),
                _buildCategoryItem(
                  category: 'Shopping',
                  amount: 4900.0,
                ),
                _buildCategoryItem(
                  category: 'Bills',
                  amount: 7250.0,
                ),
                _buildCategoryItem(
                  category: 'Others',
                  amount: 1560.0,
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Spending by month',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                _buildMonthItem(
                  month: 'January',
                  amount: 800.0,
                ),
                _buildMonthItem(
                  month: 'February',
                  amount: 600.0,
                ),
                _buildMonthItem(
                  month: 'March',
                  amount: 700.0,
                ),
                _buildMonthItem(
                  month: 'April',
                  amount: 900.0,
                ),
                _buildMonthItem(
                  month: 'May',
                  amount: 1000.0,
                ),
                _buildMonthItem(
                  month: 'June',
                  amount: 1200.0,
                ),
                _buildMonthItem(
                  month: 'July',
                  amount: 1500.0,
                ),
                _buildMonthItem(
                  month: 'August',
                  amount: 1300.0,
                ),
                _buildMonthItem(
                  month: 'September',
                  amount: 1100.0,
                ),
                _buildMonthItem(
                  month: 'October',
                  amount: 900.0,
                ),
                _buildMonthItem(
                  month: 'November',
                  amount: 800.0,
                ),
                _buildMonthItem(
                  month: 'December',
                  amount: 1000.0,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCategoryItem({
    required String category,
    required double amount,
  }) {
    return ListTile(
      title: Text(category),
      trailing: Text('\₱$amount'),
    );
  }

  Widget _buildMonthItem({
    required String month,
    required double amount,
  }) {
    return ListTile(
      title: Text(month),
      trailing: Text('\₱$amount'),
    );
  }
}
