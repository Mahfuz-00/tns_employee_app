import 'package:flutter/material.dart';
import 'package:touch_and_solve_inventory_app/Core/Config/Assets/app_images.dart';
import 'package:touch_and_solve_inventory_app/Presentation/Activity%20Dashboard%20Page/Page/activity_dashboard_UI.dart';
import 'package:touch_and_solve_inventory_app/Presentation/Leave%20Dashboard%20Page/Page/leave_dashboard_UI.dart';
import 'package:touch_and_solve_inventory_app/Presentation/Voucher%20Dashboard%20Page/Page/voucher_dashboard_UI.dart';

import '../../Core/Config/Theme/app_colors.dart';
import '../../Presentation/Dashboard Page/Page/dashboard_UI.dart';

class BottomNavBar extends StatelessWidget {
  final double containerHeight;
  final String currentPage;

  const BottomNavBar({Key? key, required this.containerHeight, required this.currentPage})
      : super(key: key);

  // Function to handle the onPressed for each button
  void _onButtonPressed(BuildContext context, String pageName) {
    if (pageName == currentPage) return;

    switch (pageName) {
      case 'Home':
      // Replace current screen with the dashboard page
        Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => Dashboard()),
        );
      case 'Activity':
      // Navigate to Activity page
        Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => ActivityDashboard()),
        );
        break;
      case 'Leave':
      // Navigate to Leave page
        Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => LeaveDashboard()),
        );
        break;
      case 'Voucher':
      // Navigate to Voucher page
        Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => VoucherDashboard()),
        );
        break;
      default:
        print('Unknown page: $pageName');
    }
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.NavBarNavyBlue,
      padding: EdgeInsets.symmetric(
        horizontal: MediaQuery.of(context).size.width * 0.05,
        vertical: containerHeight * 0.02,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildNavButton(
              context,
              currentPage == 'Home'
                  ? AppImages.HomeFilledIcon
                  : AppImages.HomeIcon,
              'Home'),
          _buildNavButton(
              context,
              currentPage == 'Activity'
                  ? AppImages.ActivityFilledIcon
                  : AppImages.ActivityIcon,
              'Activity'),
          _buildNavButton(
              context,
              currentPage == 'Leave'
                  ? AppImages.LeaveFilledIcon
                  : AppImages.LeaveIcon,
              'Leave'),
          _buildNavButton(
              context,
              currentPage == 'Voucher'
                  ? AppImages.VoucherFilledIcon
                  : AppImages.VoucherIcon,
              'Voucher'),
        ],
      ),
    );
  }

  // Helper method to create individual buttons
  Widget _buildNavButton(BuildContext context, String imagePath, String label) {
    return GestureDetector(
      onTap: () => _onButtonPressed(context, label), // Trigger action on tap
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            imagePath, // Pass the image path here
            width: 30.0,  // Adjust image size as needed
            height: 30.0, // Adjust image size as needed
          ),
          const SizedBox(height: 8.0),
          Text(
            label,
            style: TextStyle(
              color: AppColors.textlightGreen, // You can customize the label color here
              fontSize: 12.0,
              fontWeight: FontWeight.w500,
              fontFamily: 'Roboto'
            ),
          ),
        ],
      ),
    );
  }
}
