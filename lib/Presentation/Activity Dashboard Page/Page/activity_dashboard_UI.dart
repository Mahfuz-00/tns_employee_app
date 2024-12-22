import 'package:flutter/material.dart';
import 'package:touch_and_solve_inventory_app/Common/Widgets/bottom_naviagtion_bar.dart';
import 'package:touch_and_solve_inventory_app/Core/Config/Theme/app_colors.dart';
import 'package:touch_and_solve_inventory_app/Presentation/Dashboard%20Page/Widget/task_card.dart';

import '../../../Core/Config/Assets/app_images.dart';
import '../Widget/status_container_template.dart';

class ActivityDashboard extends StatefulWidget {
  const ActivityDashboard({super.key});

  @override
  State<ActivityDashboard> createState() => _ActivityDashboardState();
}

class _ActivityDashboardState extends State<ActivityDashboard> {
  String selectedSection = 'All'; // Default to 'All'

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
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
                                'Challenges Awaiting',
                                style: TextStyle(
                                    fontSize: 24.0,
                                    fontWeight: FontWeight.w600,
                                    color: AppColors.textWhite,
                                    fontFamily: 'Roboto'),
                              ),
                              SizedBox(height: 5),
                              Text(
                                'Let\'s tackle your to-do list',
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
                            AppImages.TaskImage,
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
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                // "All" section
                                Expanded(
                                  child: GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        selectedSection = 'All'; // Set the selected section to 'All'
                                      });
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: selectedSection == 'All' ? AppColors.primary : Colors.transparent, // Change color if selected
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                      padding: EdgeInsets.all(8.0),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            'All',
                                            style: TextStyle(
                                              fontSize: 14.0,
                                              fontWeight: FontWeight.w400,
                                              fontFamily: 'Roboto',
                                              color: selectedSection == 'All' ? Colors.white : AppColors.textBlack,
                                            ),
                                          ),
                                          SizedBox(width: 5.0),
                                          CircleAvatar(
                                            radius: 15.0,
                                            backgroundColor: AppColors.containerBackgroundGrey300,
                                            child: Text(
                                              '20',
                                              style: TextStyle(
                                                fontFamily: 'Roboto',
                                                fontSize: 14.0,
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
                                  child: GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        selectedSection = 'In Progress'; // Set the selected section to 'In Progress'
                                      });
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: selectedSection == 'In Progress' ? AppColors.primary : Colors.transparent, // Change color if selected
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                     padding: EdgeInsets.all(8.0),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            'In Progress',
                                            style: TextStyle(
                                              fontFamily: 'Roboto',
                                              fontSize: 14.0,
                                              fontWeight: FontWeight.w400,
                                              color: selectedSection == 'In Progress' ? Colors.white : AppColors.textBlack,
                                            ),
                                          ),
                                          SizedBox(width: 5.0),
                                          CircleAvatar(
                                            radius: 15.0,
                                            backgroundColor: AppColors.containerBackgroundGrey300,
                                            child: Text(
                                              '10',
                                              style: TextStyle(
                                                fontFamily: 'Roboto',
                                                fontSize: 14.0,
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
                                  child: GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        selectedSection = 'Finish'; // Set the selected section to 'Finish'
                                      });
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: selectedSection == 'Finish' ? AppColors.primary : Colors.transparent, // Change color if selected
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                      padding: EdgeInsets.all(8.0),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            'Finish',
                                            style: TextStyle(
                                              fontFamily: 'Roboto',
                                              fontSize: 14.0,
                                              fontWeight: FontWeight.w400,
                                              color: selectedSection == 'Finish' ? Colors.white : AppColors.textBlack,
                                            ),
                                          ),
                                          SizedBox(width: 5.0),
                                          CircleAvatar(
                                            radius: 15.0,
                                            backgroundColor: AppColors.containerBackgroundGrey300,
                                            child: Text(
                                              '5',
                                              style: TextStyle(
                                                fontFamily: 'Roboto',
                                                fontSize: 14.0,
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
                        SizedBox(height: 10,),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: TaskCard(
                              taskHeader: 'BCC 5 Apps',
                              progression: 1.0,
                              images: [
                                AppImages.MeetingPerson1,
                                AppImages.MeetingPerson2,
                                AppImages.MeetingPerson3,
                                AppImages.MeetingPerson1
                              ],
                              priority: 'High',
                              progress: 'In Progress',
                              date: '2 Dec',
                              commentCount: '5'),
                        ),
                        SizedBox(height: 10,),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: TaskCard(
                              taskHeader: 'Face Recognition Camera Integration',
                              progression: 1.0,
                              images: [
                                AppImages.MeetingPerson1,
                                AppImages.MeetingPerson2,
                                AppImages.MeetingPerson3,
                                AppImages.MeetingPerson1
                              ],
                              priority: 'Low',
                              progress: 'In Progress',
                              date: '4 Dec',
                              commentCount: '1'),
                        ),


                        SizedBox(height: 20,)
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
                    borderRadius: BorderRadius.circular(12),
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
                          'Summary of Your Work',
                          style: TextStyle(
                              fontSize: 18.0,
                              fontWeight: FontWeight.w600,
                              color: AppColors.textBlack,
                              fontFamily: 'Roboto'),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          'Your current task progress',
                          style: TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.w400,
                              color: AppColors.textBlack,
                              fontFamily: 'Roboto'),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            TaskStatusTemplate(
                              imageAsset: AppImages.TodoIcon,
                              label: 'To Do',
                              number: '5',
                            ),
                            TaskStatusTemplate(
                              imageAsset: AppImages.InProgressIcon,
                              label: 'In Progress',
                              number: '10',
                            ),
                            TaskStatusTemplate(
                              imageAsset: AppImages.DoneIcon,
                              label: 'Done',
                              number: '3',
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
        height: screenHeight * 0.167,
        child: Column(
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

                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primary,
                    padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                    fixedSize: Size(screenWidth*0.9, 50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Text('Create Task',
                    style: TextStyle(
                      fontFamily: 'Roboto',
                      fontSize: 16.0,
                      fontWeight: FontWeight.w600,
                      color: AppColors.textWhite,
                    ),),
                ),
              ),
            ),
            BottomNavBar(
              containerHeight: screenHeight * 0.08,
              currentPage: 'Activity',
            ),
          ],
        ),
      ),
    );
  }
}
