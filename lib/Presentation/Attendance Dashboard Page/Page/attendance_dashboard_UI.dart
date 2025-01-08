import 'package:flutter/material.dart';
import 'package:touch_and_solve_inventory_app/Common/Widgets/internet_connection_check.dart';

import '../../../Common/Helper/navigation_transition.dart';
import '../../../Common/Widgets/bottom_navigation_bar.dart';
import '../../../Core/Config/Assets/app_images.dart';
import '../../../Core/Config/Theme/app_colors.dart';
import '../Widget/attendance_container.dart';
import '../Widget/attendance_modal_slider.dart';

class AttendanceDashboard extends StatefulWidget {
  const AttendanceDashboard({super.key});

  @override
  State<AttendanceDashboard> createState() => _AttendanceDashboardState();
}

class _AttendanceDashboardState extends State<AttendanceDashboard> {
  bool isModalOpen = false;
  final TextEditingController _entrytimeController = TextEditingController();
  final TextEditingController _projectController = TextEditingController();
  final TextEditingController _locationController = TextEditingController();
  final TextEditingController _remarkController = TextEditingController();

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
                      padding:
                          EdgeInsets.symmetric(horizontal: 32, vertical: 30),
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
                                  'Let\'s Check In!',
                                  style: TextStyle(
                                      fontSize: 24.0,
                                      fontWeight: FontWeight.w600,
                                      color: AppColors.textWhite,
                                      fontFamily: 'Roboto'),
                                ),
                                SizedBox(height: 5),
                                Text(
                                  'Don\'t miss your check in schedule',
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
                              AppImages.AttendanceImage,
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
                      padding: EdgeInsets.only(top: screenHeight * 0.09 + 70),
                      child: Column(
                        children: [
                          AttendenceContainers(
                            date: '10 January 2025',
                            projectName: 'BCC 5 Apps Project',
                            location: 'Agargoan',
                            duration: '8:00 Hours',
                            clockIn: '10:00 AM',
                            clockOut: '6:00 PM',
                            approvedby: 'HR Admin',
                            approvedDate: '10 January 2025',
                            approverImage: AppImages.HRImage,
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          AttendenceContainers(
                            date: '11 January 2025',
                            projectName: 'AFIP',
                            location: 'ECB Chattar',
                            duration: '8:00 Hours',
                            clockIn: '10:00 AM',
                            clockOut: '6:00 PM',
                            approvedby: 'HR Admin',
                            approvedDate: '11 January 2025',
                            approverImage: AppImages.HRImage,
                          ),
                          SizedBox(
                            height: 20,
                          ),
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
                    height: screenHeight * 0.19 + 50,
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
                            'Total Working Hours',
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
                            'Paid Period 1 Jan 2025 - 30 Jan 2025',
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
                              Container(
                                width: screenWidth * 0.4,
                                //margin: EdgeInsets.symmetric(horizontal: 10),
                                padding: EdgeInsets.all(7),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(4),
                                  color: AppColors.containerBackgroundGrey100,
                                  border: Border.all(
                                      color: Colors.grey.withOpacity(0.2)),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.2),
                                      spreadRadius: 2,
                                      blurRadius: 5,
                                      offset: Offset(0, 3), // Shadow position
                                    ),
                                  ],
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      //mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Container(
                                          width: 12,
                                          height: 12,
                                          decoration: BoxDecoration(
                                            // Apply the color here
                                            shape: BoxShape
                                                .circle, // Make it round like an icon
                                          ),
                                          child: Icon(
                                            Icons.access_time_filled,
                                            size: 12,
                                          ),
                                        ),
                                        SizedBox(width: 3),
                                        // Spacing between image and label
                                        Text(
                                          'Today',
                                          style: TextStyle(
                                              fontSize: 12.0,
                                              fontWeight: FontWeight.w400,
                                              color: AppColors.textBlack,
                                              fontFamily: 'Roboto'),
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 1,
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 4),
                                    // Spacing between label and number
                                    Text('00:00 Hours',
                                        style: TextStyle(
                                            fontSize: 16.0,
                                            fontWeight: FontWeight.w400,
                                            color: AppColors.textBlack,
                                            fontFamily: 'Roboto')),
                                  ],
                                ),
                              ),
                              Container(
                                width: screenWidth * 0.4,
                                //margin: EdgeInsets.symmetric(horizontal: 10),
                                padding: EdgeInsets.all(7),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(4),
                                  color: AppColors.containerBackgroundGrey100,
                                  border: Border.all(
                                      color: Colors.grey.withOpacity(0.2)),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.2),
                                      spreadRadius: 2,
                                      blurRadius: 5,
                                      offset: Offset(0, 3), // Shadow position
                                    ),
                                  ],
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      //mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Container(
                                          width: 12,
                                          height: 12,
                                          decoration: BoxDecoration(
                                            // Apply the color here
                                            shape: BoxShape
                                                .circle, // Make it round like an icon
                                          ),
                                          child: Icon(
                                            Icons.access_time_filled,
                                            size: 12,
                                          ),
                                        ),
                                        SizedBox(width: 3),
                                        // Spacing between image and label
                                        Text(
                                          'This Pay Period',
                                          style: TextStyle(
                                              fontSize: 12.0,
                                              fontWeight: FontWeight.w400,
                                              color: AppColors.textBlack,
                                              fontFamily: 'Roboto'),
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 1,
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 4),
                                    // Spacing between label and number
                                    Text('32:00 Hours',
                                        style: TextStyle(
                                            fontSize: 16.0,
                                            fontWeight: FontWeight.w400,
                                            color: AppColors.textBlack,
                                            fontFamily: 'Roboto')),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 16,
                          ),
                          Expanded(
                            child: Center(
                              child: ElevatedButton(
                                onPressed: () {
                                  // Bottom Slider
                                  showModalBottomSheet(
                                    context: context,
                                    isScrollControlled: true,
                                    backgroundColor: Color(0x00000000),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.vertical(
                                        top: Radius.circular(16),
                                      ),
                                    ),
                                    builder: (BuildContext context) {
                                      // Using addPostFrameCallback to setState after the build phase
                                      WidgetsBinding.instance
                                          .addPostFrameCallback((_) {
                                        setState(() {
                                          isModalOpen = true;
                                        });
                                      });

                                      return BottomSlider(
                                        isModalOpen: isModalOpen,
                                        onModalStateChanged: (isOpen) {
                                          setState(() {
                                            isModalOpen = isOpen;
                                          });
                                        },
                                        entrytimeController:
                                            _entrytimeController,
                                        locationController: _locationController,
                                        projectController: _projectController,
                                        remarkController: _remarkController,
                                      );
                                    },
                                  ).whenComplete(() {
                                    // This will be called when the modal is dismissed
                                    setState(() {
                                      isModalOpen = false;
                                    });
                                  });
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: AppColors.primary,
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 24, vertical: 12),
                                  fixedSize: Size(screenWidth * 0.85, 50),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(4),
                                  ),
                                ),
                                child: const Text(
                                  'Check In Now',
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
          height: screenHeight * 0.08,
          child: BottomNavBar(
            containerHeight: screenHeight * 0.08,
            currentPage: 'Attendance',
          ),
        ),
      ),
    );
  }
}
