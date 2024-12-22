import 'package:flutter/material.dart';
import 'package:touch_and_solve_inventory_app/Presentation/Dashboard%20Page/Widget/progression_indicator.dart';

import '../../../Core/Config/Assets/app_images.dart';
import '../../../Core/Config/Theme/app_colors.dart';

class LeaveCard extends StatefulWidget {
  final String leaveHeader;
  final String Date;
  final String Status;
  final String UsedLeave;
  final String AvailableLeave;

  const LeaveCard({
    super.key,
    required this.leaveHeader,
    required this.Date,
    required this.Status,
    required this.UsedLeave,
    required this.AvailableLeave,
  });

  @override
  State<LeaveCard> createState() => _LeaveCardState();
}

class _LeaveCardState extends State<LeaveCard> {
  //late double _progress;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Container(
      margin: EdgeInsets.zero,
      padding: EdgeInsets.zero,
      child: Card(
        color: AppColors.backgroundWhite,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
            side: BorderSide(width: 1,color: AppColors.containerBackgroundGrey300)),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Row with circular logo, header, and time spreader
              Row(
                children: [
                  // Circular Logo
                  CircleAvatar(
                    radius: 16,
                    child: Image.asset(AppImages.LeaveIcon2),
                  ),
                  SizedBox(width: 8),
                  Text(
                    widget.leaveHeader, // Second Header
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: AppColors.textDarkBlack,
                        fontFamily: 'Roboto'),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                  SizedBox(width: 8), // Spacing between elements
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 5),
                    decoration: BoxDecoration(
                      //color: AppColors.textWhite,
                      borderRadius: BorderRadius.circular(4),
                      /*border: Border.all(color: AppColors.textWhite), */ // Adjust border color as needed
                    ),
                    child: Row(
                      children: [
                        Image.asset(
                          AppImages.CalenderIcon,
                          color: Colors.grey,
                          width: 16,
                          height: 16,
                        ),
                        SizedBox(width: 5), // Spacing between icon and text
                        Text(
                          /*widget.date*/
                          widget.Date, // Replace with your date
                          style: TextStyle(
                              color: AppColors.textBlack,
                              fontWeight: FontWeight.w500,
                              fontSize: 16,
                              fontFamily: 'Roboto'),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 8),

              Container(
                width: screenWidth * 0.25,
                height: 40,
                padding: EdgeInsets.symmetric(vertical: 5),
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 5),
                  width: screenWidth * 0.20,
                  height: screenHeight * 0.035,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    color: AppColors.containerBackgroundGrey300,
                  ),
                  child: Row(
                    children: [
                      Icon(
                        Icons.timer, // Timer icon
                        size: 18,
                        color: Colors.grey[600],
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        widget.Status,
                        style: TextStyle(
                            color: AppColors.textBlack,
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                            fontFamily: 'Roboto'),
                      )
                    ],
                  ),
                ),
              ),

              SizedBox(height: 5),

              Align(
                alignment: Alignment.centerLeft,
                child: Row(
                  children: [
                    // First container with circular widget, number, and "Leave Used"
                    Container(
                      //width: 100, // Fixed width for consistent size
                      padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                      decoration: BoxDecoration(
                        color: AppColors.textWhite,
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        // Center-align content
                        children: [
                          Container(
                            width: 20,
                            height: 20,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors
                                  .grey[300], // Background color of the circle
                            ),
                            child: Center(
                              child: Text(
                                widget.UsedLeave, // Replace with dynamic value
                                style: TextStyle(
                                    color: AppColors.primary,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                    fontFamily: 'Roboto'),
                              ),
                            ),
                          ),
                          SizedBox(width: 5), // Spacing between circle and text
                          Text(
                            'Leave Used', // Replace with dynamic text
                            style: TextStyle(
                                color: AppColors.textBlack,
                                fontWeight: FontWeight.w500,
                                fontSize: 16,
                                fontFamily: 'Roboto'),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: 10),
                    // Spacing between the two containers
                    // Second container with circular widget, number, and "Available Leave"
                    Container(
                      //width: 100, // Fixed width for consistent size
                      padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                      decoration: BoxDecoration(
                        color: AppColors.textWhite,
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        // Center-align content
                        children: [
                          Container(
                            width: 20,
                            height: 20,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors
                                  .grey[300], // Background color of the circle
                            ),
                            child: Center(
                              child: Text(
                                widget.AvailableLeave,
                                // Replace with dynamic value
                                style: TextStyle(
                                    color: AppColors.primary,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                    fontFamily: 'Roboto'),
                              ),
                            ),
                          ),
                          SizedBox(width: 5), // Spacing between circle and text
                          Text(
                            'Available Leave', // Replace with dynamic text
                            style: TextStyle(
                                color: AppColors.textBlack,
                                fontWeight: FontWeight.w500,
                                fontSize: 16,
                                fontFamily: 'Roboto'),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
