import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:touch_and_solve_inventory_app/Common/Widgets/bottom_navigation_bar.dart';
import 'package:touch_and_solve_inventory_app/Common/Widgets/bottom_navigation_bar_with_swipe.dart';
import 'package:touch_and_solve_inventory_app/Core/Config/Theme/app_colors.dart';
import 'package:touch_and_solve_inventory_app/Domain/Entities/task_entities.dart';
import 'package:touch_and_solve_inventory_app/Presentation/Activity%20Creation%20Page/Page/activity_creation_UI.dart';
import 'package:touch_and_solve_inventory_app/Presentation/Dashboard%20Page/Widget/task_card.dart';

import '../../../Common/Helper/navigation_transition.dart';
import '../../../Core/Config/Assets/app_images.dart';
import '../Bloc/task_bloc.dart';
import '../Bloc/task_event.dart';
import '../Bloc/task_state.dart';
import '../Widget/section_tile.dart';
import '../Widget/status_container_template.dart';

class ActivityDashboard extends StatefulWidget {
  const ActivityDashboard({super.key});

  @override
  State<ActivityDashboard> createState() => _ActivityDashboardState();
}

class _ActivityDashboardState extends State<ActivityDashboard> {
  String selectedSection = 'All'; // Default to 'All'

  @override
  void initState() {
    super.initState();
    // Use a post-frame callback to ensure the Bloc is ready before adding the event
    /*  WidgetsBinding.instance.addPostFrameCallback((_) {
      final taskBloc = BlocProvider.of<TaskBloc>(context);
      taskBloc.add(LoadTasksEvent()); // Dispatch the event
    });*/

    final taskBloc = BlocProvider.of<TaskBloc>(context);
    taskBloc.add(LoadTasksEvent()); // Dispatch the event
  }

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
                    padding: EdgeInsets.only(top: screenHeight * 0.09 + 20),
                    child: Column(
                      children: [
                        // Second container with task sections
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
                                SectionTile(
                                  title: 'All',
                                  count: blocBuilderForCount(
                                      'All', AppColors.textBlack),
                                  selectedSection: selectedSection,
                                  onTap: (section) {
                                    setState(() {
                                      selectedSection = section;
                                    });
                                  },
                                ),
                                SectionTile(
                                  title: 'In Progress',
                                  count: blocBuilderForCount(
                                      'In Progress', AppColors.textBlack),
                                  selectedSection: selectedSection,
                                  onTap: (section) {
                                    setState(() {
                                      selectedSection = section;
                                    });
                                  },
                                ),
                                SectionTile(
                                  title: 'Finish',
                                  count: blocBuilderForCount(
                                      'Finish', AppColors.textBlack),
                                  selectedSection: selectedSection,
                                  onTap: (section) {
                                    setState(() {
                                      selectedSection = section;
                                    });
                                  },
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        BlocBuilder<TaskBloc, TaskState>(
                          builder: (context, state) {
                            if (state is TaskLoadingState) {
                              // Show a loading spinner when the tasks are being loaded
                              return Center(child: CircularProgressIndicator());
                            } else if (state is TaskLoadedState) {
                              // Display the list of tasks when they are loaded
                              return ListView.builder(
                                shrinkWrap: true,
                                physics: NeverScrollableScrollPhysics(),
                                itemCount: state.tasks.length,
                                itemBuilder: (context, index) {
                                  final task = state.tasks[index];
                                  return Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 16.0),
                                    child: TaskCard(
                                      taskHeader: task.taskHeader,
                                      date: task.date,
                                      priority: task.priority,
                                      progress: task.progress,
                                      progression: task.progression,
                                      images: task.images,
                                      commentCount: task.commentCount,
                                    ),
                                  );
                                },
                              );
                            } else if (state is TaskErrorState) {
                              // Show an error message if there's an error while fetching tasks
                              return Center(
                                child: Text('Error: ${state.errorMessage}'),
                              );
                            } else {
                              // Default state (TaskInitialState), when no data has been loaded yet
                              return Center(
                                  child: Text(
                                'No tasks available.',
                                style: TextStyle(
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.w400,
                                    color: AppColors.textBlack,
                                    fontFamily: 'Roboto'),
                              ));
                            }
                          },
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
                  height: screenHeight * 0.18,
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
                          'Summary of Your Work',
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
                          'Your current task progress',
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
                            TaskStatusTemplate(
                              imageAsset: AppImages.TodoIcon,
                              label: 'To Do',
                              // BlocBuilder wraps only the number, not the whole widget
                              number: blocBuilderForCount(
                                  'To Do', AppColors.textBlack),
                            ),
                            TaskStatusTemplate(
                              imageAsset: AppImages.InProgressIcon,
                              label: 'In Progress',
                              number: blocBuilderForCount(
                                  'In Progress', AppColors.textBlack),
                            ),
                            TaskStatusTemplate(
                              imageAsset: AppImages.DoneIcon,
                              label: 'Done',
                              number: blocBuilderForCount(
                                  'Finish', AppColors.textBlack),
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
                      customPageRoute(ActivityCreation()),
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
                    'Create Task',
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
                currentPage: 'Activity',
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget blocBuilderForCount(String section, Color? color) {
    return BlocBuilder<TaskBloc, TaskState>(
      builder: (context, state) {
        // Handle different states based on the TaskBloc
        if (state is TaskLoadingState) {
          return Text(
            '0',
            style: TextStyle(
                fontSize: 12.0,
                fontWeight: FontWeight.w400,
                color: color,
                fontFamily: 'Roboto'),
          ); // Show 0 while loading
        } else if (state is TaskLoadedState) {
          // Check if the section exists in taskCounts and return the value
          final count = state.taskCounts[section]?.toString() ?? '0';
          return Text(
            count,
            style: TextStyle(
                fontSize: 12.0,
                fontWeight: FontWeight.w400,
                color: color,
                fontFamily: 'Roboto'),
          ); // Return the count as text
        } else if (state is TaskErrorState) {
          return Text(
            '--',
            style: TextStyle(
                fontSize: 12.0,
                fontWeight: FontWeight.w400,
                color: color,
                fontFamily: 'Roboto'),
          ); // Show '--' in case of an error
        } else {
          return Text(
            '0',
            style: TextStyle(
                fontSize: 12.0,
                fontWeight: FontWeight.w400,
                color: color,
                fontFamily: 'Roboto'),
          ); // Default fallback value
        }
      },
    );
  }
}
