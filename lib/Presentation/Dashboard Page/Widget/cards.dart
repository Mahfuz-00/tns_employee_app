import 'package:flutter/material.dart';
import 'package:touch_and_solve_inventory_app/Core/Config/Theme/app_colors.dart';
import 'package:touch_and_solve_inventory_app/Presentation/Dashboard%20Page/Widget/meeting_card.dart';
import 'package:touch_and_solve_inventory_app/Presentation/Dashboard%20Page/Widget/progression_indicator.dart';
import 'package:touch_and_solve_inventory_app/Presentation/Dashboard%20Page/Widget/task_card.dart';

import '../../../Core/Config/Assets/app_images.dart';

// Class to hold the images, headers, and subtitles and pass them as input
class CardsWidget extends StatelessWidget {
  final String header; // First header
  final String subtitle; // First subtitle
  final int totalCount;

  //final List<Map<String, dynamic>> secondCardData;
  final MeetingCard? meetingCard; // Nullable Meeting Card widget
  final TaskCard? taskCard; // Nullable Task Card widget
  final Widget? leaveCard; // Nullable Leave Card widget

  // Constructor to accept images, headers, and subtitles as input
  CardsWidget({
    required this.header,
    required this.subtitle,
    //required this.secondCardData,
    required this.totalCount,
    this.meetingCard,
    this.taskCard,
    this.leaveCard,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Container(
      padding: EdgeInsets.zero,
      margin: EdgeInsets.zero,
      child: Card(
        color: AppColors.backgroundWhite,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.all(14.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header and Subtitle 1
              Row(
                children: [
                  Text(
                    header, // First Header
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: AppColors.textBlack,
                        fontFamily: 'Roboto'),
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  Container(
                    height: 30,
                    width: 30,
                    decoration: BoxDecoration(
                      color: AppColors.backgroundDarkGrey,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Center(
                      child: Text(
                        totalCount.toString(),
                        // Replace with dynamic meeting count
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: AppColors.primary,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 4),
              Text(
                subtitle, // First Subtitle
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: AppColors.textGrey,
                    fontFamily: 'Roboto'),
              ),
              SizedBox(height: 5),

              // Conditionally render the relevant card
              if (meetingCard != null) meetingCard!,
              // Render Meeting Card if provided
              if (taskCard != null) taskCard!,
              // Render Task Card if provided
              if (leaveCard != null) leaveCard!,
              // Render Leave Card if provided
            ],
          ),
        ),
      ),
    );
  }
}




