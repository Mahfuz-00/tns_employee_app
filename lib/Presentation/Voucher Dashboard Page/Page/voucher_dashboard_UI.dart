import 'package:flutter/material.dart';
import 'package:touch_and_solve_inventory_app/Presentation/Voucher%20Creation%20Page/Page/voucher_creation_UI.dart';

import '../../../Common/Helper/navigation_transition.dart';
import '../../../Common/Widgets/bottom_navigation_bar.dart';
import '../../../Common/Widgets/bottom_navigation_bar_with_swipe.dart';
import '../../../Common/Widgets/internet_connection_check.dart';
import '../../../Core/Config/Assets/app_images.dart';
import '../../../Core/Config/Theme/app_colors.dart';
import '../../Activity Dashboard Page/Widget/status_container_template.dart';
import '../../Dashboard Page/Widget/task_card.dart';
import '../Widgets/voucher_container.dart';
import '../Widgets/voucher_container_card.dart';

class VoucherDashboard extends StatefulWidget {
  const VoucherDashboard({super.key});

  @override
  State<VoucherDashboard> createState() => _VoucherDashboardState();
}

class _VoucherDashboardState extends State<VoucherDashboard> {
  String selectedSection = 'Review'; // Default to 'All'

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return InternetConnectionChecker(
      child: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Stack(
              children: [
                // First container (30% of the screen height)
                Column(
                  children: [
                    Container(
                      height: screenHeight * 0.25,
                      // First container occupies 30% of the screen height
                      padding: EdgeInsets.symmetric(horizontal: 32, vertical: 30),
                      color: AppColors.primary,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Expense Summary',
                                  style: TextStyle(
                                      fontSize: 24.0,
                                      fontWeight: FontWeight.w600,
                                      color: AppColors.textWhite,
                                      fontFamily: 'Roboto'),
                                ),
                                SizedBox(height: 5),
                                Text(
                                  'Claim your expense here',
                                  style: TextStyle(
                                      fontSize: 14.0,
                                      fontWeight: FontWeight.w600,
                                      color: AppColors.textWhite,
                                      fontFamily: 'Roboto'),
                                ),
                              ],
                            ),
                          ),
                          Spacer(),
                          Container(
                            alignment: Alignment.centerLeft,
                            padding: const EdgeInsets.only(bottom: 60.0),
                            child: Image.asset(
                              AppImages.ExpenseImage,
                              height: 100,
                              width: 100,
                            ),
                          )
                        ],
                      ),
                    ),

                    // Third container (Rest of the body content below Container 1)
                    Container(
                      width: screenWidth,
                      color: AppColors.containerBackgroundGrey300,
                      padding: EdgeInsets.only(top: screenHeight * 0.1 + 20),
                      child: Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 16),
                            child: Container(
                              //padding: const EdgeInsets.all(16.0),
                              width: screenWidth,
                              decoration: BoxDecoration(
                                color: AppColors.backgroundWhite,
                                borderRadius: BorderRadius.circular(4),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  // "All" section
                                  Expanded(
                                    flex: 1,
                                    child: GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          selectedSection =
                                              'Review'; // Set the selected section to 'All'
                                        });
                                      },
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: selectedSection == 'Review'
                                              ? AppColors.textNavyBlue
                                              : Colors.transparent,
                                          // Change color if selected
                                          borderRadius: BorderRadius.circular(4),
                                        ),
                                        padding: EdgeInsets.all(8.0),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Text(
                                              'Review',
                                              style: TextStyle(
                                                fontSize: 12.0,
                                                fontWeight: FontWeight.w400,
                                                fontFamily: 'Roboto',
                                                color:
                                                    selectedSection == 'Review'
                                                        ? Colors.white
                                                        : AppColors.textBlack,
                                              ),
                                              overflow: TextOverflow.ellipsis,
                                              maxLines: 1,
                                            ),
                                            SizedBox(width: 5.0),
                                            CircleAvatar(
                                              radius: 12.0,
                                              backgroundColor: selectedSection ==
                                                      'Review'
                                                  ? AppColors
                                                      .containerBackgroundRed
                                                  : AppColors
                                                      .containerBackgroundGrey300,
                                              child: Text(
                                                '20',
                                                style: TextStyle(
                                                  fontFamily: 'Roboto',
                                                  fontSize: 12.0,
                                                  fontWeight: FontWeight.w400,
                                                  color: AppColors.textBlack,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),

                                  // "In Progress" section
                                  Expanded(
                                    flex: 1,
                                    child: GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          selectedSection =
                                              'Approved'; // Set the selected section to 'In Progress'
                                        });
                                      },
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: selectedSection == 'Approved'
                                              ? AppColors.textNavyBlue
                                              : Colors.transparent,
                                          // Change color if selected
                                          borderRadius: BorderRadius.circular(4),
                                        ),
                                        padding: EdgeInsets.all(8.0),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Text(
                                              'Approved',
                                              style: TextStyle(
                                                fontFamily: 'Roboto',
                                                fontSize: 12.0,
                                                fontWeight: FontWeight.w400,
                                                color: selectedSection ==
                                                        'Approved'
                                                    ? Colors.white
                                                    : AppColors.textBlack,
                                              ),
                                              overflow: TextOverflow.ellipsis,
                                              maxLines: 1,
                                            ),
                                            SizedBox(width: 5.0),
                                            CircleAvatar(
                                              radius: 12.0,
                                              backgroundColor: selectedSection ==
                                                      'Approved'
                                                  ? AppColors
                                                      .containerBackgroundRed
                                                  : AppColors
                                                      .containerBackgroundGrey300,
                                              child: Text(
                                                '10',
                                                style: TextStyle(
                                                  fontFamily: 'Roboto',
                                                  fontSize: 12.0,
                                                  fontWeight: FontWeight.w400,
                                                  color: AppColors.textBlack,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),

                                  // "Finish" section
                                  Expanded(
                                    flex: 1,
                                    child: GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          selectedSection =
                                              'Rejected'; // Set the selected section to 'Finish'
                                        });
                                      },
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: selectedSection == 'Rejected'
                                              ? AppColors.textNavyBlue
                                              : Colors.transparent,
                                          // Change color if selected
                                          borderRadius: BorderRadius.circular(4),
                                        ),
                                        padding: EdgeInsets.all(8.0),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Text(
                                              'Rejected',
                                              style: TextStyle(
                                                fontFamily: 'Roboto',
                                                fontSize: 12.0,
                                                fontWeight: FontWeight.w400,
                                                color: selectedSection ==
                                                        'Rejected'
                                                    ? Colors.white
                                                    : AppColors.textBlack,
                                              ),
                                              overflow: TextOverflow.ellipsis,
                                              maxLines: 1,
                                            ),
                                            SizedBox(width: 5.0),
                                            CircleAvatar(
                                              radius: 12.0,
                                              backgroundColor: selectedSection ==
                                                      'Rejected'
                                                  ? AppColors
                                                      .containerBackgroundRed
                                                  : AppColors
                                                      .containerBackgroundGrey300,
                                              child: Text(
                                                '5',
                                                style: TextStyle(
                                                  fontFamily: 'Roboto',
                                                  fontSize: 12.0,
                                                  fontWeight: FontWeight.w400,
                                                  color: AppColors.textBlack,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          VoucherContainers(
                            submitDate: '10 December 2024',
                            approvedBy: 'HR Admin',
                            approvalDate: '25 Dec 2024',
                            approvedImage: AppImages.HRImage,
                            project: '5 Apps',
                            expense: 'TK. 255',
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          VoucherContainers(
                            submitDate: '7 December 2024',
                            approvedBy: 'HR Admin',
                            approvalDate: '15 Dec 2024',
                            approvedImage: AppImages.HRImage,
                            project: 'Asset Project',
                            expense: 'TK. 150',
                          ),
                          SizedBox(
                            height: 20,
                          )
                        ],
                      ),
                    ),
                  ],
                ),

                // Second container (Stacked on top of Container 1 and Container 3)
                Positioned(
                  top: screenHeight * 0.15, // Adjust to start over Container 1
                  left: 0,
                  right: 0,
                  child: Container(
                    height: screenHeight * 0.2,
                    // Height of Container 2 (should cover part of Container 1)
                    margin: EdgeInsets.symmetric(horizontal: 16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(4),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 10,
                          offset: Offset(0, 5),
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Total Expense',
                            style: TextStyle(
                                fontSize: 16.0,
                                fontWeight: FontWeight.w600,
                                color: AppColors.textBlack,
                                fontFamily: 'Roboto'),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            'Period 1 Jan 2024 - 31 Dec 2024',
                            style: TextStyle(
                                fontSize: 14.0,
                                fontWeight: FontWeight.w400,
                                color: AppColors.labelGrey,
                                fontFamily: 'Roboto'),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              VoucherStatusTemplate(
                                imageAsset: AppImages.VoucherTotalIcon,
                                label: 'Total',
                                number: 'TK. 1010',
                              ),
                              VoucherStatusTemplate(
                                color: AppColors.containerBackgroundYellow,
                                label: 'Review',
                                number: 'TK. 510',
                              ),
                              VoucherStatusTemplate(
                                color: AppColors.darkGreen,
                                label: 'Approved',
                                number: 'TK. 500',
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: SizedBox(
          height: screenHeight * 0.18,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                height: screenHeight * 0.1,
                width: screenWidth,
                decoration: BoxDecoration(
                  color: Colors.white,
                ),
                child: Center(
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        customPageRoute(VoucherCreation()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primary,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 24, vertical: 12),
                      fixedSize: Size(screenWidth * 0.9, 50),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ),
                    child: const Text(
                      'New Expense',
                      style: TextStyle(
                        fontFamily: 'Roboto',
                        fontSize: 14.0,
                        fontWeight: FontWeight.w600,
                        color: AppColors.textWhite,
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: BottomNavBar(
                  containerHeight: screenHeight * 0.08,
                  currentPage: 'Voucher',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
