import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:touch_and_solve_inventory_app/Presentation/Leave%20Creation%20Page/Page/leave_creation_UI.dart';
import 'package:touch_and_solve_inventory_app/Presentation/Leave%20Dashboard%20Page/Widgets/leave_containers_card.dart';

import '../../../Common/Helper/dimmed_overlay.dart';
import '../../../Common/Helper/navigation_transition.dart';
import '../../../Common/Widgets/bottom_navigation_bar.dart';
import '../../../Common/Widgets/bottom_navigation_bar_with_swipe.dart';
import '../../../Common/Widgets/internet_connection_check.dart';
import '../../../Core/Config/Assets/app_images.dart';
import '../../../Core/Config/Theme/app_colors.dart';
import '../../Activity Dashboard Page/Widget/status_container_template.dart';
import '../../Dashboard Page/Widget/task_card.dart';
import '../Bloc/leave_bloc.dart';
import '../Widgets/leave_container.dart';
import '../Widgets/section_tile.dart';

class LeaveDashboard extends StatefulWidget {
  const LeaveDashboard({super.key});

  @override
  State<LeaveDashboard> createState() => _LeaveDashboardState();
}

class _LeaveDashboardState extends State<LeaveDashboard> {
  String selectedSection = 'Pending';

  String getPaidPeriodString() {
    // Get today's date
    DateTime today = DateTime.now();

    // Format the start date of the month (1st of the current month)
    DateTime startDate = DateTime(today.year, today.month, 1);
    String startDateFormatted =
        DateFormat('d MMM yyyy').format(startDate); // "1 Jan 2025"

    // Get the last day of the current month
    DateTime endDate =
        DateTime(today.year, today.month + 1, 0); // Last day of current month
    String endDateFormatted = DateFormat('d MMM yyyy')
        .format(endDate); // "31 Jan 2025" or last day of the month

    // Return the final formatted string
    return 'Paid Period $startDateFormatted - $endDateFormatted';
  }

  @override
  void initState() {
    super.initState();
    BlocProvider.of<LeaveBloc>(context).add(LoadLeaveApplications());
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    String paidPeriod = getPaidPeriodString();

    return InternetConnectionChecker(
      child: Scaffold(
        body: BlocListener<LeaveBloc, LeaveState>(
          listener: (context, state) {
            // Handle different states and show snack bars or other UI updates
            if (state is LeaveApplicationError) {
              print('Error: ${state.message}');
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(state.message)),
              );
            }
          },
          child: BlocBuilder<LeaveBloc, LeaveState>(
            builder: (context, state) {
              if (state is LeaveApplicationLoading) {
                return Center(child: OverlayLoader());
              } else if (state is LeaveApplicationLoaded) {
                int _getLeaveCountByStatus(String status) {
                  // Filter leave records by status
                  int count = state.leaveApplications
                      .expand((leaveEntity) => leaveEntity
                          .leaveRecords) // Flatten the leaveRecords lists
                      .where((leave) =>
                          leave.status.toLowerCase() ==
                          status.toLowerCase()) // Filter by status
                      .toList()
                      .length;
                  return count;
                }

                print('Loaded: ${state.leaveApplications.toString()}');
                print(
                    'Remaining Days: ${state.leaveApplications[0].remainingDays}');

                final usedDays =
                    14 - int.parse(state.leaveApplications[0].remainingDays);
                return SafeArea(
                  child: SingleChildScrollView(
                    child: Stack(
                      children: [
                        // First container (30% of the screen height)
                        Column(
                          children: [
                            Container(
                              height: screenHeight * 0.25,
                              // First container occupies 30% of the screen height
                              padding: EdgeInsets.symmetric(
                                  horizontal: 32, vertical: 30),
                              color: AppColors.primary,
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(top: 10),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Leave Summary',
                                          style: TextStyle(
                                              fontSize: 24.0,
                                              fontWeight: FontWeight.w600,
                                              color: AppColors.textWhite,
                                              fontFamily: 'Roboto'),
                                        ),
                                        SizedBox(height: 5),
                                        Text(
                                          'Submit Leave',
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
                                    padding:
                                        const EdgeInsets.only(bottom: 60.0),
                                    child: Image.asset(
                                      AppImages.LeaveImage,
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
                              padding: EdgeInsets.only(
                                  top: screenHeight * 0.09 + 20),
                              child: Column(
                                children: [
                                  // Second container with leave sections
                                  Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 16),
                                    child: Container(
                                      width: screenWidth,
                                      decoration: BoxDecoration(
                                        color: AppColors.backgroundWhite,
                                        borderRadius: BorderRadius.circular(4),
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          SectionTile(
                                            title: 'Pending',
                                            count: _getLeaveCountByStatus(
                                                    'pending')
                                                .toString(),
                                            selectedSection: selectedSection,
                                            onTap: (section) {
                                              setState(() {
                                                selectedSection = section;
                                              });
                                            },
                                          ),
                                          SectionTile(
                                            title: 'Approved',
                                            count: _getLeaveCountByStatus(
                                                    'approved')
                                                .toString(),
                                            selectedSection: selectedSection,
                                            onTap: (section) {
                                              setState(() {
                                                selectedSection = section;
                                              });
                                            },
                                          ),
                                          SectionTile(
                                            title: 'Rejected',
                                            count: _getLeaveCountByStatus(
                                                    'rejected')
                                                .toString(),
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
                                  SizedBox(height: 20),
                                  ListView.builder(
                                    shrinkWrap: true,
                                    physics: NeverScrollableScrollPhysics(),
                                    itemCount: state.leaveApplications.where((leave) {
                                      return leave.leaveRecords.any((record) {
                                        return record.status.toLowerCase() == selectedSection.toLowerCase();
                                      });
                                    }).length,
                                    itemBuilder: (context, index) {
                                      final leave = state.leaveApplications
                                          .where((leave) => leave.leaveRecords.any((record) {
                                        return record.status.toLowerCase() == selectedSection.toLowerCase();
                                      }))
                                          .toList()[index]; // Filtering and getting the correct item

                                      // Prepare leave status
                                      String leaveStatus = 'N/A';
                                      for (var record in leave.leaveRecords) {
                                        if (record.status.toLowerCase() == 'pending') {
                                          leaveStatus = 'Pending';
                                          break;
                                        } else if (record.status.toLowerCase() == 'approved') {
                                          leaveStatus = 'Approved';
                                          break;
                                        } else if (record.status.toLowerCase() == 'rejected') {
                                          leaveStatus = 'Rejected';
                                          break;
                                        }
                                      }
                                      print('Leave Status 3 : $leaveStatus');

                                      DateTime parsedstartDateTime =
                                          DateTime.parse(
                                              leave.leaveRecords[0].startDate);
                                      DateTime parsedEndDateTime =
                                          DateTime.parse(
                                              leave.leaveRecords[0].endDate);
                                      DateTime parsedCreatedDateTime =
                                          DateTime.parse(
                                              leave.leaveRecords[0].createdAt);
                                      DateTime parsedUpdatedDateTime =
                                          DateTime.parse(
                                              leave.leaveRecords[0].updatedAt);

                                      String StartDate =
                                          DateFormat('dd MMM yyyy')
                                              .format(parsedstartDateTime);
                                      String EndDate = DateFormat('dd MMM yyyy')
                                          .format(parsedEndDateTime);
                                      String CreatedDate =
                                          DateFormat('dd MMMM yyyy')
                                              .format(parsedCreatedDateTime);
                                      String UpdatedDate =
                                          DateFormat('dd MMMM yyyy')
                                              .format(parsedUpdatedDateTime);

                                      print('Date: $StartDate');
                                      print('Time: $EndDate');
                                      print('Created: $CreatedDate');
                                      print('Updated: $UpdatedDate');

                                      return Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 16.0),
                                        child: GestureDetector(
                                          onTap: () {
                                            // Navigate to the new page and pass leave data
                                            /* Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) => LeaveDetailPage(
                                                  leaveApplications: state.leaveApplications,
                                                  initialIndex: index,
                                                ),
                                              ),
                                            );*/
                                          },
                                          child: LeaveContainers(
                                            submitDate: CreatedDate ?? 'N/A',
                                            // or any other relevant field
                                            leaveDate:
                                                '${StartDate} - ${EndDate}',
                                            totalLeave:
                                                '${leave.leaveRecords[0].totalDay} day(s)',
                                            approvedBy: leave
                                                    .leaveRecords[0].name
                                                    .toString() ??
                                                'N/A',
                                            // assuming you have approverName
                                            approvalDate: UpdatedDate ?? 'N/A',
                                            // assuming you have updatedAt
                                            approvedImage: leave.leaveRecords[0]
                                                    .approverPhoto ??
                                                'Unknown', // assuming approverPhoto is a URL or asset
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                  SizedBox(height: 20),
                                ],
                              ),
                            )
                          ],
                        ),

                        // Second container (Stacked on top of Container 1 and Container 3)
                        Positioned(
                          top: screenHeight * 0.15,
                          // Adjust to start over Container 1
                          left: 0,
                          right: 0,
                          child: Container(
                            height: screenHeight * 0.19,
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
                                    'Total Leave',
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
                                    paidPeriod,
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
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      LeaveStatusTemplate(
                                        color: AppColors.darkGreen,
                                        label: 'Available',
                                        number: state
                                            .leaveApplications[0].remainingDays,
                                      ),
                                      LeaveStatusTemplate(
                                        color: AppColors.NavyBlue,
                                        label: 'Leave Used',
                                        number: usedDays.toString(),
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
                );
              } else if (state is LeaveApplicationError) {
                return Center(child: Text("Error: ${state.message}"));
              } else {
                return Center(child: Text("No Data"));
              }
            },
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
                        customPageRoute(LeaveCreation()),
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
                      'New Leave',
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
                  currentPage: 'Leave',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
