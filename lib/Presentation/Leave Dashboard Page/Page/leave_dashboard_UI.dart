import 'package:flutter/material.dart';

import '../../../Common/Widgets/bottom_naviagtion_bar.dart';

class LeaveDashboard extends StatefulWidget {
  const LeaveDashboard({super.key});

  @override
  State<LeaveDashboard> createState() => _LeaveDashboardState();
}

class _LeaveDashboardState extends State<LeaveDashboard> {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(bottomNavigationBar: SizedBox(
      height: screenHeight * 0.08,
      child: BottomNavBar(
        containerHeight: screenHeight * 0.08,
        currentPage: 'Leave',
      ),
    ),);
  }
}
