import 'package:flutter/material.dart';

import '../../../Core/Config/Theme/app_colors.dart';

class TaskStatusTemplate extends StatelessWidget {
  final String imageAsset;
  final String label;
  final String number;

  const TaskStatusTemplate({
    required this.imageAsset,
    required this.label,
    required this.number,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Container(
      width: screenWidth * 0.255,
      //margin: EdgeInsets.symmetric(horizontal: 10),
      padding: EdgeInsets.all(7),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        color: AppColors.containerBackgroundGrey100,
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
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            //mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(
                imageAsset,
                width: 20,
                height: 20,
                fit: BoxFit.cover,
              ),
              SizedBox(width: 3), // Spacing between image and label
              Text(
                label,
                style: TextStyle(
                    fontSize: 12.0,
                    fontWeight: FontWeight.w400,
                    color: AppColors.textBlack,
                    fontFamily: 'Roboto'),
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
              ),
            ],
          ),
          SizedBox(height: 4), // Spacing between label and number
          Text(number,
              style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.w400,
                  color: AppColors.textBlack,
                  fontFamily: 'Roboto')),
        ],
      ),
    );
  }
}
