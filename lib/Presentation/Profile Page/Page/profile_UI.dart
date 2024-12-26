import 'package:flutter/material.dart';
import 'package:touch_and_solve_inventory_app/Common/Widgets/appbar_model.dart';
import 'package:touch_and_solve_inventory_app/Core/Config/Assets/app_images.dart';
import '../../../Common/Widgets/bottom_navigation_bar.dart';
import '../../../Common/Widgets/bottom_navigation_bar_with_swipe.dart';
import '../../../Core/Config/Theme/app_colors.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: AppColors.primary,
      appBar: AppBarModel(title: 'My Profile', color: AppColors.primary),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            // Container 2: Positioned over Container 1
            Container(
              width: screenWidth,
              margin: EdgeInsets.only(top: screenHeight * 0.1),
              padding: EdgeInsets.only(top: 75),
              height: screenHeight - screenHeight * 0.1,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(8),
                  topRight: Radius.circular(8),
                ),
                color: AppColors.backgroundWhite,
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 50.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Humayun Kabir Piash',
                            style: TextStyle(
                              fontSize: 20,
                              // Adjust font size based on screen width
                              fontWeight: FontWeight.w600,
                              fontFamily: 'Roboto',
                            ),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                          ),
                          SizedBox(width: 8.0),
                          Icon(
                            Icons.verified,
                            color: AppColors.primary,
                            size: screenWidth *
                                0.05, // Adjust icon size based on screen width
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 5),
                    // Adjust height relative to screen height
                    // Designation text
                    Center(
                      child: Text(
                        'UI/UX Designer',
                        style: TextStyle(
                          fontSize: screenWidth * 0.04,
                          // Adjust font size based on screen width
                          color: AppColors.primary,
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    // First Container: User Details
                    Text(
                      'Contact',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          fontFamily: 'Roboto',
                          color: AppColors.textDarkGrey),
                    ),
                    SizedBox(height: 10),
                    Container(
                      padding: const EdgeInsets.all(16.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: AppColors.containerBackgroundGrey400,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Image.asset(
                                AppImages.ProfileIcon2, // Asset image path
                                fit: BoxFit.cover,
                                // Ensures the image covers the container area
                                width: 20,
                                height: 20,
                              ),
                              SizedBox(width: 10),
                              Text(
                                '12345',
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                    fontFamily: 'Roboto',
                                    color: AppColors.textAsh),
                              ),
                            ],
                          ),
                          SizedBox(height: 10),
                          Row(
                            children: [
                              Image.asset(
                                AppImages.EmailFilledIcon, // Asset image path
                                fit: BoxFit.cover,
                                // Ensures the image covers the container area
                                width: 20,
                                height: 20,
                              ),
                              SizedBox(width: 10),
                              Text(
                                'johndoe@example.com',
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                    fontFamily: 'Roboto',
                                    color: AppColors.textAsh),
                              ),
                            ],
                          ),
                          SizedBox(height: 10),
                          Row(
                            children: [
                              Image.asset(
                                AppImages.LocationIcon, // Asset image path
                                fit: BoxFit.cover,
                                // Ensures the image covers the container area
                                width: 20,
                                height: 20,
                              ),
                              SizedBox(width: 10),
                              Text(
                                'New York',
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                    fontFamily: 'Roboto',
                                    color: AppColors.textAsh),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),

                    SizedBox(height: 20),

                    // Second Container: Settings Options
                    Text(
                      'Settings',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          fontFamily: 'Roboto',
                          color: AppColors.textDarkGrey),
                    ),
                    SizedBox(height: 10),
                    Container(
                      padding: const EdgeInsets.all(16.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: AppColors.containerBackgroundGrey400,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Image.asset(
                                AppImages.ChangePasswordIcon,
                                // Asset image path
                                fit: BoxFit.cover,
                                // Ensures the image covers the container area
                                width: 20,
                                height: 20,
                              ),
                              SizedBox(width: 10),
                              Text(
                                'Change Password',
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                    fontFamily: 'Roboto',
                                    color: AppColors.textAsh),
                              ),
                              Spacer(),
                              Icon(Icons.arrow_forward_ios,
                                  color: AppColors.primary, size: 16),
                            ],
                          ),
                          SizedBox(height: 10),
                          Row(
                            children: [
                              Image.asset(
                                AppImages.FAQIcon, // Asset image path
                                fit: BoxFit.cover,
                                // Ensures the image covers the container area
                                width: 20,
                                height: 20,
                              ),
                              SizedBox(width: 10),
                              Text(
                                'FAQ & Help',
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                    fontFamily: 'Roboto',
                                    color: AppColors.textAsh),
                              ),
                              Spacer(),
                              Icon(Icons.arrow_forward_ios,
                                  color: AppColors.primary, size: 16),
                            ],
                          ),
                          SizedBox(height: 10),
                          Row(
                            children: [
                              Image.asset(
                                AppImages.LogoutIcon, // Asset image path
                                fit: BoxFit.cover,
                                // Ensures the image covers the container area
                                width: 20,
                                height: 20,
                              ),
                              SizedBox(width: 10),
                              Text(
                                'Logout',
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                    fontFamily: 'Roboto',
                                    color: AppColors.textAsh),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // Container 3: Profile image section
            // Now starts 50px above Container 2
            /*Center(
              child: Container(
                width: 150,
                height: 150,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: AppColors.primary,
                  border: Border.all(
                    color: Colors.white, // Border color
                    width: 5, // Border width
                  ),
                ),
                margin: EdgeInsets.only(top: screenHeight * 0.1 - 75), // Starts 50px above Container 2
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12), // Ensures the image fits the container's rounded corners
                  child: Image.network(
                    'https://www.w3schools.com/w3images/avatar2.png',
                    fit: BoxFit.cover, // Ensures the image covers the container area
                  ),
                ),
              ),
            )*/

            Center(
              child: Container(
                width: 150,
                height: 150,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: AppColors.primary,
                  border: Border.all(
                    color: Colors.white, // Border color
                    width: 5, // Border width
                  ),
                ),
                margin: EdgeInsets.only(top: screenHeight * 0.1 - 75),
                // Starts 50px above Container 2
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  // Ensures the image fits the container's rounded corners
                  child: Image.asset(
                    AppImages.ProfileImage, // Asset image path
                    fit: BoxFit
                        .cover, // Ensures the image covers the container area
                  ),
                ),
              ),
            )
          ],
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
  }
}
