import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:touch_and_solve_inventory_app/Core/Config/Assets/app_images.dart';

import '../../../Core/Config/Theme/app_colors.dart';

class AttendenceCard extends StatelessWidget {
  final String projectName;
  final String location;
  final String duration;
  final String clockIn;
  final String clockOut;
  final String approvedDate;
  final String approvedby;

/*  final String approverImage;*/

  const AttendenceCard({
    required this.projectName,
    required this.location,
    required this.duration,
    required this.clockIn,
    required this.clockOut,
    required this.approvedby,
    required this.approvedDate,
/*    required this.approverImage,*/
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('Clocked in : $clockIn');
    print('Clocked Out : $clockOut');
    print('Attendance Date: $approvedDate');
    // Format the date and time strings to a more readable format
    DateTime? parsedDateInTime =
    clockIn.trim().isNotEmpty ? DateTime.tryParse(clockIn) : null;
    DateTime? parsedDateOutTime =
    clockOut.trim().isNotEmpty ? DateTime.tryParse(clockOut) : null;
    DateTime? parsedApprovedDate =
    approvedDate.trim().isNotEmpty ? DateTime.tryParse(approvedDate) : null;

    String inDate = parsedDateInTime != null
        ? DateFormat('dd MMMM yyyy').format(parsedDateInTime)
        : '-';
    String inTime = parsedDateInTime != null
        ? DateFormat('hh:mm a').format(parsedDateInTime)
        : '/';

    String outDate = parsedDateOutTime != null
        ? DateFormat('dd MMMM yyyy').format(parsedDateOutTime)
        : '-';
    String outTime = parsedDateOutTime != null
        ? DateFormat('hh:mm a').format(parsedDateOutTime)
        : '/';

    String ApprovedDate = parsedApprovedDate != null
        ? DateFormat('dd MMMM yyyy').format(parsedApprovedDate)
        : '-';
    print('Attendance Date: $ApprovedDate');

    print('Project Name of Attendance: $projectName');


    String totalTime = '-';

    if (parsedDateInTime != null && parsedDateOutTime != null) {
      final duration = parsedDateOutTime.difference(parsedDateInTime);
      final hours = duration.inHours;
      final minutes = duration.inMinutes.remainder(60);
      totalTime = '${hours}h ${minutes}m';
    } else if (parsedDateInTime != null && parsedDateOutTime == null) {
      totalTime = 'Ongoing'; // or use '-'
    }


    final screenWidth = MediaQuery.of(context).size.width;
    return Container(
      width: screenWidth * 0.925, // Adjust width as needed
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        color: Colors.white,
        border: Border.all(color: Colors.grey.withOpacity(0.2)),
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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Row with image and label
          Row(
            children: [
              Image.asset(
                AppImages.AttendanceConatinerIcon,
                width: 20,
                height: 20,
                fit: BoxFit.cover,
              ),
              SizedBox(width: 8),
              Text(
                inDate,
                style: TextStyle(
                  fontFamily: 'Roboto',
                  fontSize: 14.0,
                  fontWeight: FontWeight.w500,
                  color: AppColors.textBlack,
                ),
              ),
            ],
          ),
          SizedBox(height: 12),
          // Space between Row and inner container

          // Inner container with two columns (Leave Date and Total Leave)
          Container(
            //margin: EdgeInsets.only(top: 8),
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                width: 1, // Specify the border width
                color: AppColors
                    .containerBackgroundGrey300, // Specify the border color
              ),
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Project Name',
                          style: TextStyle(
                            fontFamily: 'Roboto',
                            fontSize: 12.0,
                            fontWeight: FontWeight.w400,
                            color: AppColors.textBlack,
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          projectName.toString() == '' ? 'Head Office' : projectName,
                          style: TextStyle(
                            fontFamily: 'Roboto',
                            fontSize: 14.0,
                            fontWeight: FontWeight.w500,
                            color: AppColors.textBlack,
                          ),
                        ),
                        SizedBox(height: 12),
                        Text(
                          'Total Hours',
                          style: TextStyle(
                            fontFamily: 'Roboto',
                            fontSize: 12.0,
                            fontWeight: FontWeight.w400,
                            color: AppColors.textBlack,
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          totalTime,
                          style: TextStyle(
                            fontFamily: 'Roboto',
                            fontSize: 14.0,
                            fontWeight: FontWeight.w500,
                            color: AppColors.textBlack,
                          ),
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Location',
                          style: TextStyle(
                            fontFamily: 'Roboto',
                            fontSize: 12.0,
                            fontWeight: FontWeight.w400,
                            color: AppColors.textBlack,
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          location,
                          style: TextStyle(
                            fontFamily: 'Roboto',
                            fontSize: 14.0,
                            fontWeight: FontWeight.w500,
                            color: AppColors.textBlack,
                          ),
                        ),
                        SizedBox(height: 12),
                        Text(
                          'Clock In & Out',
                          style: TextStyle(
                            fontFamily: 'Roboto',
                            fontSize: 12.0,
                            fontWeight: FontWeight.w400,
                            color: AppColors.textBlack,
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          '$inTime - $outTime',
                          style: TextStyle(
                            fontFamily: 'Roboto',
                            fontSize: 14.0,
                            fontWeight: FontWeight.w500,
                            color: AppColors.textBlack,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),

          SizedBox(height: 12),
          // Space between inner container and approval section

          // Approval Section moved to be part of the outer container
          Row(
            children: [
              /*        Row(
                children: [
                  Icon(
                    Icons.check_circle,
                    color: AppColors.primary,
                    size: 14,
                  ),
                  SizedBox(
                    width: 4,
                  ),
                  Text(
                    'Approved at $ApprovedDate',
                    style: TextStyle(
                      fontFamily: 'Roboto',
                      fontSize: 12.0,
                      fontWeight: FontWeight.w500,
                      color: AppColors.primary,
                    ),
                  ),
                ],
              ),
              Spacer(),*/
              if (approvedDate != null) ...[
                Icon(
                  Icons.check_circle,
                  color: AppColors.primary,
                  size: 14,
                ),
                SizedBox(
                  width: 4,
                ),
                Text(
                  'Approved By',
                  style: TextStyle(
                    fontFamily: 'Roboto',
                    fontSize: 12.0,
                    fontWeight: FontWeight.w500,
                    color: AppColors.textBlack,
                  ),
                ),
              ] else ...[
                Text(
                  'By',
                  style: TextStyle(
                    fontFamily: 'Roboto',
                    fontSize: 12.0,
                    fontWeight: FontWeight.w500,
                    color: AppColors.textBlack,
                  ),
                ),
              ],
              SizedBox(width: 8),
              /*  CircleAvatar(
                radius: 12,
                backgroundImage: AssetImage(approverImage),
              ),
              SizedBox(width: 8),*/
              Text(
                approvedby,
                style: TextStyle(
                  fontFamily: 'Roboto',
                  fontSize: 12.0,
                  fontWeight: FontWeight.w500,
                  color: AppColors.textBlack,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
