import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:touch_and_solve_inventory_app/Common/Widgets/bottom_navigation_bar.dart';
import 'package:touch_and_solve_inventory_app/Common/Widgets/internet_connection_check.dart';
import 'package:touch_and_solve_inventory_app/Core/Config/Assets/app_images.dart';
import 'package:touch_and_solve_inventory_app/Core/Config/Theme/app_colors.dart';
import 'package:touch_and_solve_inventory_app/Presentation/Dashboard%20Page/Widget/cards.dart';

import '../../../Common/Bloc/profile_bloc.dart';
import '../../../Common/Helper/dimmed_overlay.dart';
import '../../../Common/Widgets/bottom_navigation_bar_with_swipe.dart';
import '../../Attendance Dashboard Page/Widget/attendance_container.dart';
import '../../Profile Page/Page/profile_UI.dart';
import '../Bloc/dashboard_bloc.dart';
import '../Widget/attendance_card.dart';
import '../Widget/leave_card.dart';
import '../Widget/meeting_card.dart';
import '../Widget/task_card.dart';
import '../Widget/voucher_card.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  void initState() {
    super.initState();
    // Dispatch the event to fetch profile data
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<ProfileBloc>().add(FetchProfile());
      context.read<DashboardBloc>().add(LoadDashboardDataEvent());
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return InternetConnectionChecker(
      child: BlocBuilder<ProfileBloc, ProfileState>(
        builder: (context, state) {
          if (state is ProfileLoading) {
            Center(child: OverlayLoader());
          } else if (state is ProfileLoaded) {
            return Scaffold(
              body: SafeArea(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      BlocBuilder<ProfileBloc, ProfileState>(
                        builder: (context, state) {
                          if (state is ProfileLoading) {
                            return Center(child: OverlayLoader());
                          } else if (state is ProfileLoaded) {
                            final profile = state.profile;
                            return Container(
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
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          child: profile.photoUrl != null
                                              ? CachedNetworkImage(
                                                  imageUrl: profile.photoUrl!,
                                                  fit: BoxFit.cover,
                                                  placeholder: (context, url) =>
                                                      Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            16.0),
                                                    child: OverlayLoader(),
                                                  ),
                                                  errorWidget: (context, url,
                                                          error) =>
                                                      Container(
                                                          decoration:
                                                              BoxDecoration(
                                                            color: Colors
                                                                .grey.shade300,
                                                            shape:
                                                                BoxShape.circle,
                                                          ),
                                                          alignment:
                                                              Alignment.center,
                                                          child: Icon(
                                                            Icons.error,
                                                            color: Colors.red,
                                                          )),
                                                )
                                              : Image.asset(
                                                  AppImages.ProfileImage,
                                                  fit: BoxFit.cover,
                                                ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  // Name, verified mark, and designation in the second container
                                  SizedBox(
                                    width: screenWidth * 0.55,
                                    // Set width relative to screen width
                                    child: Container(
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 8.0),
                                      // Added padding for better spacing
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          // Row for name and verified badge
                                          Row(
                                            children: [
                                              Expanded(
                                                flex: 6,
                                                child: Text(
                                                  profile.name,
                                                  style: TextStyle(
                                                    fontSize: 16,
                                                    // Adjust font size based on screen width
                                                    fontWeight: FontWeight.w600,
                                                    fontFamily: 'Roboto',
                                                  ),
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  maxLines: 1,
                                                ),
                                              ),
                                              SizedBox(width: 8.0),
                                              Expanded(
                                                flex: 1,
                                                child: Icon(
                                                  Icons.verified,
                                                  color: AppColors.primary,
                                                  size: screenWidth *
                                                      0.05, // Adjust icon size based on screen width
                                                ),
                                              ),
                                            ],
                                          ),
                                          SizedBox(height: 5),
                                          // Adjust height relative to screen height
                                          // Designation text
                                          Text(
                                            profile.designation,
                                            style: TextStyle(
                                              fontSize: 14,
                                              // Adjust font size based on screen width
                                              color: AppColors.primary,
                                              fontFamily: 'Roboto',
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  ActionIcons(
                                      screenWidth, AppImages.CommentIcon),
                                  SizedBox(
                                    width: 8,
                                  ),
                                  ActionIcons(
                                      screenWidth, AppImages.NotificationIcon),
                                ],
                              ),
                            );
                          } else if (state is ProfileError) {
                            return Center(
                                child: Text('Error: ${state.message}'));
                          }
                          return Container(
                              color: AppColors.backgroundWhite,
                              child: Center(child: OverlayLoader()));
                        },
                      ),
                      BlocListener<DashboardBloc, DashboardState>(
                        listener: (context, state) {
                          if (state is DashboardErrorState) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text(state.message)),
                            );
                          }
                        },
                        child: Container(
                          padding: EdgeInsets.all(12),
                          color: AppColors.containerBackgroundGrey300,
                          child: Column(
                            children: [
                              MyWorkSummary(
                                  screenWidth: screenWidth,
                                  screenHeight: screenHeight),
                              /* SizedBox(
                        height: 10,
                      ),
                      MeetingSection(),*/
                              SizedBox(
                                height: 10,
                              ),
                              BlocBuilder<DashboardBloc, DashboardState>(
                                builder: (context, state) {
                                  if (state is DashboardLoadingState) {
                                    return Center(child: OverlayLoader());
                                  } else if (state is DashboardLoadedState) {
                                    return Column(
                                      children: [
                                        ActivitySection(
                                          title:
                                              state.dashboardData?.title ?? '',
                                          progress:
                                              state.dashboardData?.status ?? '',
                                          date: state.dashboardData?.endDate ??
                                              '',
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        LeaveSection(
                                          availableLeave: state.dashboardData
                                                  ?.availableLeave ??
                                              '',
                                          usedLeave:
                                              state.dashboardData?.usedLeave ??
                                                  '',
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        AttendanceSection(
                                          inTime:
                                              state.dashboardData?.inTime ?? '',
                                          outTime:
                                              state.dashboardData?.outTime ??
                                                  '',
                                          projectName: state.dashboardData
                                                  ?.attendanceProject ??
                                              '',
                                          inDate: state.dashboardData
                                                  ?.attendanceCreatedAt ??
                                              '',
                                          approvedBy:
                                              state.dashboardData?.userName ??
                                                  '',
                                          approvedImage: state.dashboardData
                                                  ?.userProfilePhotoUrl ??
                                              '',
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        VoucherSection(
                                          submittedDate: state.dashboardData
                                                  ?.voucherCreatedAt ??
                                              '',
                                          expense: state.dashboardData
                                                  ?.totalAmount ??
                                              '',
                                          approvedBy: state.dashboardData
                                                  ?.voucherApproverName ??
                                              '',
                                          approvedDate: state.dashboardData
                                                  ?.voucherUpdatedAt??
                                              '',
                                        )
                                      ],
                                    );
                                  } else if (state is DashboardErrorState) {
                                    return Center(
                                        child: Text('Error: ${state.message}'));
                                  }
                                  return const Center(child: Text('No Data'));
                                },
                              ),
                            ],
                          ),
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
          } else if (state is ProfileError) {
            return Center(child: Text('Error: ${state.message}'));
          }
          return Container(
              color: AppColors.backgroundWhite,
              child: Center(child: OverlayLoader()));
        },
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

class AttendanceSection extends StatelessWidget {
  final String inTime;
  final String outTime;
  final String projectName;
  final String inDate;
  final String approvedBy;
  final String approvedImage;

  const AttendanceSection({
    super.key,
    required this.inTime,
    required this.outTime,
    required this.projectName,
    required this.inDate,
    required this.approvedBy,
    required this.approvedImage,
  });

  @override
  Widget build(BuildContext context) {
    return CardsWidget(
      header: 'Recent Attendance',
      attendanceCard: AttendenceCard(
        projectName: projectName,
        location: 'Mirpur - 12',
        duration: '00:00 Hours',
        clockIn: inTime,
        clockOut: outTime,
        approvedby: approvedBy,
        approvedDate: inDate,
        approverImage: approvedImage, // or from data if dynamic
      ),
    );
  }
}

class VoucherSection extends StatelessWidget {
  final String submittedDate;
  /*final String ProjectName;*/
  final String expense;
  final String approvedBy;
  final String approvedDate;

  const VoucherSection({
    super.key,
    required this.submittedDate,
/*    required this.ProjectName,*/
    required this.expense,
    required this.approvedBy,
    required this.approvedDate,
  });

  @override
  Widget build(BuildContext context) {
    return CardsWidget(
      header: 'Recent Voucher',
      voucherCard: VoucherCard(
        submitDate: submittedDate,
        approvedBy: approvedBy,
        approvalDate: approvedDate,
      /*  project: ProjectName,*/
        expense: expense,
      ),
    );
  }
}

class LeaveSection extends StatelessWidget {
  final String availableLeave;
  final String usedLeave;

  const LeaveSection({
    super.key,
    required this.availableLeave,
    required this.usedLeave,
  });

  @override
  Widget build(BuildContext context) {
    print('Available Leave: ${availableLeave.toString()}');
    print('Used Leave: ${usedLeave.toString()}');

    return CardsWidget(
      header: 'Leave Balance',
      totalCount: availableLeave,
      leaveCard: LeaveCard(
        leaveHeader: 'Emergency Sick Leave',
        Date: '2 Dec',
        Status: 'Review',
        UsedLeave: usedLeave,
        AvailableLeave: availableLeave,
      ),
    );
  }
}

class ActivitySection extends StatelessWidget {
  final String title;
  final String progress;
  final String date;

  const ActivitySection({
    super.key,
    required this.title,
    required this.progress,
    required this.date,
  });

  @override
  Widget build(BuildContext context) {
    return CardsWidget(
      header: 'Recent Task',
      subtitle: 'The Tasks assigned to you recently',
      totalCount: '5',
      taskCard: TaskCard(
        taskHeader: title,
        images: [
          AppImages.MeetingPerson1,
          AppImages.MeetingPerson2,
          AppImages.MeetingPerson3,
          AppImages.MeetingPerson1
        ],
        /*   progression: 1.0,*/
        priority: 'High',
        progress: 'In Progress',
        date: '7 Dec',
        commentCount: 10,
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
      totalCount: '4',
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
        margin: EdgeInsets.symmetric(horizontal: screenWidth * 0.01),
        height: screenHeight * 0.125,
        decoration: BoxDecoration(
            color: AppColors.primary, borderRadius: BorderRadius.circular(4)),
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
