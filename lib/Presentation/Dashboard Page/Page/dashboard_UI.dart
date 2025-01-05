import 'package:flutter/material.dart';
import 'package:touch_and_solve_inventory_app/Common/Widgets/bottom_navigation_bar.dart';
import 'package:touch_and_solve_inventory_app/Common/Widgets/internet_connection_check.dart';
import 'package:touch_and_solve_inventory_app/Core/Config/Assets/app_images.dart';
import 'package:touch_and_solve_inventory_app/Core/Config/Theme/app_colors.dart';
import 'package:touch_and_solve_inventory_app/Presentation/Dashboard%20Page/Widget/cards.dart';

import '../../../Common/Widgets/bottom_navigation_bar_with_swipe.dart';
import '../../Profile Page/Page/profile_UI.dart';
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
    return InternetConnectionChecker(
      child: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  color: AppColors.backgroundWhite,
                  padding: EdgeInsets.all(5),
                  height: screenHeight * 0.1,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Avatar in the first container
                      GestureDetector(
                        onTap: () {
                          // Navigate to user profile page
                          // Replace 'ProfilePage' with your actual page
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Profile(),
                            ),
                          );
                        },
                        child: SizedBox(
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
                      ),
                      // Name, verified mark, and designation in the second container
                      SizedBox(
                        width: screenWidth * 0.55,  // Set width relative to screen width
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 8.0), // Added padding for better spacing
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              // Row for name and verified badge
                              Row(
                                children: [
                                  Expanded(
                                    flex: 6,
                                    child: Text(
                                      'Humayun Kabir Piash',
                                      style: TextStyle(
                                        fontSize: 16, // Adjust font size based on screen width
                                        fontWeight: FontWeight.w600,
                                        fontFamily: 'Roboto',
                                      ),
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 1,
                                    ),
                                  ),
                                  SizedBox(width: 8.0),
                                  Expanded(
                                    flex: 1,
                                    child: Icon(
                                      Icons.verified,
                                      color: AppColors.primary,
                                      size: screenWidth * 0.05, // Adjust icon size based on screen width
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 5),  // Adjust height relative to screen height
                              // Designation text
                              Text(
                                'UI/UX Designer',
                                style: TextStyle(
                                  fontSize: 14, // Adjust font size based on screen width
                                  color: AppColors.primary,
                                  fontFamily: 'Roboto',
                                  fontWeight: FontWeight.w400,
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
                  padding: EdgeInsets.all(12),
                  color: AppColors.containerBackgroundGrey300,
                  child: Column(
                    children: [
                      MyWorkSummary(screenWidth: screenWidth, screenHeight: screenHeight),
                     /* SizedBox(
                        height: 10,
                      ),
                      MeetingSection(),*/
                      SizedBox(
                        height: 10,
                      ),
                      ActivitySection(),
                      SizedBox(
                        height: 10,
                      ),
                      LeaveSection(),
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

class LeaveSection extends StatelessWidget {
  const LeaveSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CardsWidget(
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
    );
  }
}

class ActivitySection extends StatelessWidget {
  const ActivitySection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CardsWidget(
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
    );
  }
}

class MeetingSection extends StatelessWidget {
  const MeetingSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CardsWidget(
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
    );
  }
}

class MyWorkSummary extends StatelessWidget {
  const MyWorkSummary({
    super.key,
    required this.screenWidth,
    required this.screenHeight,
  });

  final double screenWidth;
  final double screenHeight;

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.symmetric(
            horizontal: screenWidth * 0.01),
        height: screenHeight * 0.125,
        decoration: BoxDecoration(
            color: AppColors.primary,
            borderRadius: BorderRadius.circular(4)),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
              flex: 11,
              child: Container(
                padding: const EdgeInsets.only(
                    top: 15.0, bottom: 15, left: 15, right: 5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'My Work Summary',
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w400,
                          color: AppColors.textWhite,
                          fontFamily: 'Roboto'),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                    Text(
                      'Today Task & Presence Activity',
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: AppColors.textWhite,
                          fontFamily: 'Roboto'),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    )
                  ],
                ),
              ),
            ),
            Spacer(),
            Expanded(
              flex: 4,
              child: Container(
                alignment: Alignment.centerRight,
                padding: const EdgeInsets.only(top: 10.0),
                child: Image.asset(
                  AppImages.CameraIcon,
                  height: 100,
                  width: 100,
                ),
              ),
            )
          ],
        ));
  }
}
