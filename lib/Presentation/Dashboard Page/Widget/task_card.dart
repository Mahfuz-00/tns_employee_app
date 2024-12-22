import 'package:flutter/material.dart';
import 'package:touch_and_solve_inventory_app/Presentation/Dashboard%20Page/Widget/progression_indicator.dart';

import '../../../Core/Config/Assets/app_images.dart';
import '../../../Core/Config/Theme/app_colors.dart';

class TaskCard extends StatefulWidget {
  final String taskHeader;
  final String progress;
  final String priority;
  final double progression;
  final String date;
  final String commentCount;
  final List<String> images;

  const TaskCard({
    super.key,
    required this.taskHeader,
    required this.progression,
    required this.images,
    required this.priority,
    required this.progress,
    required this.date,
    required this.commentCount,
  });

  @override
  State<TaskCard> createState() => _TaskCardState();
}

class _TaskCardState extends State<TaskCard> {
  late double _progress;

  @override
  void initState() {
    super.initState();
    _progress =
        widget.progression; // Use widget.progression to access the value
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
            side: BorderSide(
                width: 1, color: AppColors.containerBackgroundGrey300)),
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
                    child: Image.asset(AppImages.TaskIcon),
                  ),
                  SizedBox(width: 8),
                  Text(
                    widget.taskHeader, // Second Header
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: AppColors.textDarkBlack,
                        fontFamily: 'Roboto'),
                  ),
                ],
              ),
              SizedBox(height: 8),
              Row(
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 5),
                    width: screenWidth * 0.30,
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
                          'In Progress',
                          style: TextStyle(
                              color: AppColors.textBlack,
                              fontWeight: FontWeight.w500,
                              fontSize: 16,
                              fontFamily: 'Roboto'),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 5),
                    width: screenWidth * 0.18,
                    height: screenHeight * 0.035,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      color: _getBackgroundColor(
                          widget.priority), // Dynamically set the color
                    ),
                    child: Row(
                      children: [
                        Icon(
                          Icons.flag_rounded,
                          size: 18,
                          color: AppColors.textWhite,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          _getProgressionText(widget.priority),
                          // Dynamically set the text
                          style: TextStyle(
                            color: AppColors.textWhite,
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                            fontFamily: 'Roboto',
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 8),
              InteractiveProgressBar(
                initialProgress: _progress,
                onProgressChanged: (newProgress) {
                  setState(() {
                    _progress = newProgress; // Update progress when changed
                  });
                },
              ),
              SizedBox(height: 8),
              // Row with circular images (people) and button
              Row(
                children: [
                  // Stacked Circular Images
                  Container(
                    width: screenWidth * 0.4,
                    height: 40,
                    padding: EdgeInsets.symmetric(vertical: 5),
                    child: Stack(
                      children: [
                        // Show up to 3 images, and the rest will show a "+" sign
                        ...List.generate(
                          widget.images.length > 3 ? 3 : widget.images.length,
                          (index) {
                            return Positioned(
                              left: index * 20.0,
                              // Adjust the overlap by modifying the multiplier
                              child: CircleAvatar(
                                radius: 15, // Adjust size as needed
                                backgroundImage: AssetImage(
                                  widget.images[
                                      index], // Replace with your image paths
                                ),
                              ),
                            );
                          },
                        ),
                        if (widget.images.length > 3)
                          Positioned(
                            left: 5 * 14.0,
                            // Position the text after the 3rd image
                            child: Container(
                              padding: EdgeInsets.all(5),
                              // Add some padding around the text
                              child: Text(
                                '+${widget.images.length - 3}',
                                // Display + number of images after 3
                                style: TextStyle(
                                    color: AppColors.textBlack,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 16,
                                    fontFamily: 'Roboto'),
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),
                  SizedBox(width: 5),
                  // Spacing between images and button

                  // First container with calendar icon and date
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 5),
                    decoration: BoxDecoration(
                      color: AppColors.textWhite,
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
                          widget.date, // Replace with your date
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
                  // Spacing between first and second container

                  // Second container with comment icon and comment count
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 5),
                    decoration: BoxDecoration(
                      color: AppColors.textWhite,
                      borderRadius: BorderRadius.circular(2),
                      /*border: Border.all(
                          color: Colors.grey),*/ // Adjust border color as needed
                    ),
                    child: Row(
                      children: [
                        Image.asset(
                          AppImages.CommentIcon2,
                          color: Colors.grey,
                          width: 16,
                          height: 16,
                        ),
                        SizedBox(width: 5), // Spacing between icon and text
                        Text(
                          widget.commentCount,
                          // Replace with your comment count
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
            ],
          ),
        ),
      ),
    );
  }

  String _getProgressionText(String progression) {
    switch (progression.toLowerCase()) {
      case 'low':
        return 'Low';
      case 'medium':
        return 'Medium';
      case 'high':
        return 'High';
      default:
        return 'Unknown';
    }
  }

  Color _getBackgroundColor(String progression) {
    switch (progression.toLowerCase()) {
      case 'low':
        return AppColors.primary; // Define in your AppColors
      case 'medium':
        return AppColors.containerBackgroundYellow; // Define in your AppColors
      case 'high':
        return AppColors.containerBackgroundRed;
      default:
        return Colors.grey; // Default color for unknown progression
    }
  }
}
