import 'package:flutter/material.dart';
import 'package:touch_and_solve_inventory_app/Common/Widgets/bottom_naviagtion_bar.dart';
import 'package:touch_and_solve_inventory_app/Core/Config/Assets/app_images.dart';
import 'package:touch_and_solve_inventory_app/Core/Config/Theme/app_colors.dart';
import 'package:touch_and_solve_inventory_app/Presentation/Dashboard%20Page/Widget/cards.dart';

import '../Widget/leave_card.dart';
import '../Widget/meeting_card.dart';
import '../Widget/task_card.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.all(5),
                height: screenHeight * 0.1,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Avatar in the first container
                    SizedBox(
                      width: screenWidth * 0.18,
                      child: Container(
                        alignment: Alignment.center,
                        child: CircleAvatar(
                          radius: 30.0,
                          backgroundImage: AssetImage(AppImages
                              .ProfileIcon), // Replace with your image path
                        ),
                      ),
                    ),
                    // Name, verified mark, and designation in the second container
                    SizedBox(
                      width: screenWidth * 0.55,
                      child: Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            // Row for name and verified badge
                            Row(
                              children: [
                                Text(
                                  'Humayun Kabir Piash',
                                  // Replace with dynamic data
                                  style: TextStyle(
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(width: 8.0),
                                Icon(
                                  Icons.verified,
                                  color: AppColors.primary,
                                  size: 20.0,
                                ),
                              ],
                            ),
                            SizedBox(height: 4.0),
                            // Designation text
                            Text(
                              'UI/UX Designer', // Replace with dynamic data
                              style: TextStyle(
                                fontSize: 14.0,
                                color: AppColors.primary,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    ActionIcons(screenWidth, AppImages.CommentIcon),
                    SizedBox(
                      width: 8,
                    ),
                    ActionIcons(screenWidth, AppImages.NotificationIcon),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.all(screenWidth * 0.04),
                color: AppColors.containerBackgroundGrey300,
                child: Column(
                  children: [
                    Container(
                        margin: EdgeInsets.symmetric(
                            horizontal: screenWidth * 0.01),
                        height: screenHeight * 0.125,
                        decoration: BoxDecoration(
                            color: AppColors.primary,
                            borderRadius: BorderRadius.circular(5)),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: 15.0, bottom: 15, left: 15, right: 5),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'My Work Summary',
                                    style: TextStyle(
                                        fontSize: 20.0,
                                        fontWeight: FontWeight.w400,
                                        color: AppColors.textWhite,
                                        fontFamily: 'Roboto'),
                                  ),
                                  Text(
                                    'Today Task & Presence Activity',
                                    style: TextStyle(
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.w400,
                                        color: AppColors.textWhite,
                                        fontFamily: 'Roboto'),
                                  )
                                ],
                              ),
                            ),
                            Spacer(),
                            Container(
                              alignment: Alignment.centerLeft,
                              padding: const EdgeInsets.only(top: 10.0),
                              child: Image.asset(
                                AppImages.CameraIcon,
                                height: 100,
                                width: 100,
                              ),
                            )
                          ],
                        )),
                    SizedBox(
                      height: 10,
                    ),
                    CardsWidget(
                      header: 'Today\'s Meeting',
                      subtitle: 'Your schedule for the day',
                      totalCount: 4,
                      meetingCard: MeetingCard(
                        meetingHeader: 'General Meeting',
                        subtitle2: '03:30 PM - 05:00 PM',
                        images: [
                          AppImages.MeetingPerson1,
                          AppImages.MeetingPerson2,
                          AppImages.MeetingPerson3,
                          AppImages.MeetingPerson1
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    CardsWidget(
                      header: 'Today\'s Task',
                      subtitle: 'The Tasks assigned to you for today',
                      totalCount: 5,
                      taskCard: TaskCard(
                        taskHeader: 'BCC 5 Apps Projects',
                        images: [
                          AppImages.MeetingPerson1,
                          AppImages.MeetingPerson2,
                          AppImages.MeetingPerson3,
                          AppImages.MeetingPerson1
                        ],
                        progression: 1.0,
                        priority: 'High',
                        progress: 'In Progress',
                        date: '7 Dec',
                        commentCount: '10',
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    CardsWidget(
                      header: 'Leave Balance',
                      subtitle: 'Period 1 Jan 2024 - 30 Dec 2024',
                      totalCount: 5,
                      leaveCard: LeaveCard(
                        leaveHeader: 'Emergency Sick Leave',
                        Date: '2 Dec',
                        Status: 'Review',
                        UsedLeave: '5',
                        AvailableLeave: '9',
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: SizedBox(
        height: screenHeight * 0.08,
        child: BottomNavBar(
          containerHeight: screenHeight * 0.08,
          currentPage: 'Home',
        ),
      ),
    );
  }

  SizedBox ActionIcons(double screenWidth, String imagepath) {
    return SizedBox(
      width: screenWidth * 0.1,
      child: Container(
        height: 45,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          shape: BoxShape.circle, // Ensures the container is circular
          color: AppColors.backgroundGrey, // Background color for the container
        ),
        child: ClipOval(
          // Ensures the image fits inside the circular container
          child: Image.asset(
            imagepath, // Replace with your image path
            fit: BoxFit.cover,
            // Ensures the image covers the container proportionally
            width: 25,
            // Match the height of the container
            height: 25, // Match the height of the container
          ),
        ),
      ),
    );
  }
}
