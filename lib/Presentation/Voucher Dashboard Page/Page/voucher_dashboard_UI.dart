import 'package:flutter/material.dart';

import '../../../Common/Widgets/bottom_naviagtion_bar.dart';

class VoucherDashboard extends StatefulWidget {
  const VoucherDashboard({super.key});

  @override
  State<VoucherDashboard> createState() => _VoucherDashboardState();
}

class _VoucherDashboardState extends State<VoucherDashboard> {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      bottomNavigationBar: SizedBox(
        height: screenHeight * 0.08,
        child: BottomNavBar(
          containerHeight: screenHeight * 0.08,
          currentPage: 'Voucher',
        ),
      ),
    );
  }
}
