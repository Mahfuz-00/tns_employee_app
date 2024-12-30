import 'package:flutter/material.dart';
import 'package:touch_and_solve_inventory_app/Common/Widgets/Label_Text_Without_Asterisk.dart';
import 'package:touch_and_solve_inventory_app/Common/Widgets/label_above_datafield.dart';
import 'package:touch_and_solve_inventory_app/Core/Config/Theme/app_colors.dart';
import 'package:touch_and_solve_inventory_app/Presentation/Activity%20Dashboard%20Page/Page/activity_dashboard_UI.dart';

import '../../../Common/Widgets/appbar_model.dart';
import '../../../Common/Widgets/bottom_navigation_bar.dart';
import '../../../Common/Widgets/drop_down.dart';
import '../Widget/date_picker.dart';

class ActivityCreation extends StatefulWidget {
  const ActivityCreation({super.key});

  @override
  State<ActivityCreation> createState() => _ActivityCreationState();
}

class _ActivityCreationState extends State<ActivityCreation> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _tasktitlecontroller = new TextEditingController();
  final TextEditingController _taskdescriptioncontroller = new TextEditingController();
  final TextEditingController _startDateController = TextEditingController();
  final TextEditingController _endDateController = TextEditingController();
  final TextEditingController _assigntoController = TextEditingController();
  final TextEditingController _priorityController = TextEditingController();
  final TextEditingController _statusController = TextEditingController();
  String _selectedAssignTo = '';
  String _selectedPriority = '';
  String _selectedStatus = '';
  bool isButtonEnabled = false;

  DateTime? startDate;
  DateTime? endDate;

  // Form validation function to enable/disable button
  void _validateForm() {
    print('Task Title: ${_tasktitlecontroller.text}');
    print('Task Description: ${_taskdescriptioncontroller.text}');
    print('Start Date: ${_startDateController.text}');
    print('End Date: ${_endDateController.text}');
    print('Assigned To: ${_assigntoController.text}');
    print('Priority: ${_priorityController.text}');
    print('Status: ${_statusController.text}');
    print('Button enabled: $isButtonEnabled');

    // Check if any of the fields are empty
    bool areFieldsFilled = _tasktitlecontroller.text.isNotEmpty &&
        _taskdescriptioncontroller.text.isNotEmpty &&
        _startDateController.text.isNotEmpty &&
        _endDateController.text.isNotEmpty &&
        _assigntoController.text.isNotEmpty &&
        _priorityController.text.isNotEmpty &&
        _statusController.text.isNotEmpty;

    setState(() {
      isButtonEnabled = areFieldsFilled;
    });
  }

  // Handle date selection for start and end dates
  void _onStartDateSelected(DateTime selectedDate) {
    setState(() {
      startDate = selectedDate;
    });
  }

  void _onEndDateSelected(DateTime selectedDate) {
    setState(() {
      endDate = selectedDate;
    });
  }

  @override
  void initState() {
    super.initState();

    // Adding listeners to the controllers to detect changes
    _tasktitlecontroller.addListener(_validateForm);
    _taskdescriptioncontroller.addListener(_validateForm);
    _startDateController.addListener(_validateForm);
    _endDateController.addListener(_validateForm);
    _assigntoController.addListener(_validateForm);
    _priorityController.addListener(_validateForm);
    _statusController.addListener(_validateForm);
  }

  @override
  void dispose() {
    // Dispose of controllers to avoid memory leaks
    _tasktitlecontroller.dispose();
    _taskdescriptioncontroller.dispose();
    _startDateController.dispose();
    _endDateController.dispose();
    _assigntoController.dispose();
    _priorityController.dispose();
    _statusController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBarModel(title: 'Create a new activity',),
      body: Form(
        key: _formKey,
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.all(16),
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: AppColors.backgroundWhite,
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      LabelWidget(labelText: 'Task Title'),
                      TextFormField(
                        controller: _tasktitlecontroller, // Use the controller
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(4),
                          ),
                          hintText: 'Enter task title',
                          labelText: 'Task Title',
                          labelStyle: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: AppColors.labelGrey,
                            fontFamily: 'Roboto',),
                          hintStyle: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: AppColors.labelGrey,
                            fontFamily: 'Roboto',),
                        ),
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: AppColors.labelGrey,
                          fontFamily: 'Roboto',),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter a task title';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 16,),
                      LabelWidget(labelText: 'Task Description'),
                      TextFormField(
                        controller: _taskdescriptioncontroller, // Use the controller
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(4),
                          ),
                          hintText: 'Enter Task Description',
                          labelText: 'Task Description',
                          alignLabelWithHint: true, // Ensure label stays at the top
                          labelStyle: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: AppColors.labelGrey,
                            fontFamily: 'Roboto',),
                          hintStyle: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: AppColors.labelGrey,
                            fontFamily: 'Roboto',),
                        ),
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: AppColors.labelGrey,
                          fontFamily: 'Roboto',),
                        maxLines: 3, // Make the field larger by increasing maxLines
                        minLines: 3, // Set the minimum number of lines to display
                       // floatingLabelBehavior: FloatingLabelBehavior.always, // Ensure the label stays at the top
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter a task description';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 16,),
                      LabelWidget(labelText: 'Select Time'),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          DatePickerFormField(
                            controller: _startDateController,
                            label: 'Start Date',
                            onDateSelected: _onStartDateSelected,
                          ),
                          SizedBox(width: 16),
                          DatePickerFormField(
                            controller: _endDateController,
                            label: 'End Date',
                            onDateSelected: _onEndDateSelected,
                          ),
                        ],
                      ),
                      SizedBox(height: 16,),
                      LabelWidget(labelText: 'Assign To'),
                      Dropdown(
                        controller: _assigntoController,
                        label: 'Select Assign Person',
                        options: ['Sajjad', 'Shihab', 'Munna'], // List of options
                        selectedValue: _selectedAssignTo,
                        onChanged: (value) {
                          setState(() {
                            _selectedAssignTo = value!;
                            _assigntoController.text = value ?? '';
                          });
                        },
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please select a person';
                          }
                          return null;
                        }, hinttext: 'Select Assign Person',
                      ),
                      SizedBox(height: 16,),
                      LabelWidget(labelText: 'Priority'),
                      Dropdown(
                        controller: _priorityController,
                        label: 'Select Priority',
                        options: ['Low', 'Medium', 'High'], // List of options
                        selectedValue: _selectedPriority,
                        onChanged: (value) {
                          setState(() {
                            _selectedPriority = value!;
                            _priorityController.text = value ?? '';
                          });
                        },
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please select a priority';
                          }
                          return null;
                        }, hinttext: 'Select Priority',
                      ),
                      SizedBox(height: 16,),
                      LabelWidget(labelText: 'Status'),
                      Dropdown(
                        controller: _statusController,
                        label: 'Select Status',
                        options: ['Pending', 'In Progress', 'Done'], // List of options
                        selectedValue: _selectedStatus,
                        onChanged: (value) {
                          setState(() {
                            _selectedStatus = value!;
                            _statusController.text = value ?? '';
                          });
                        },
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please select a status';
                          }
                          return null;
                        }, hinttext: 'Select Status',
                      ),
                    ],
                  ),

                ),
              ],
            ),
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
                  onPressed: isButtonEnabled ? () {
                    Navigator.push(
                      context,
                      _customPageRoute(ActivityCreation()),
                    );
                  }: null,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: isButtonEnabled ? AppColors.primary: AppColors.labelGrey,
                    padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                    fixedSize: Size(screenWidth*0.9, 50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                  child: const Text('Create Task',
                    style: TextStyle(
                      fontFamily: 'Roboto',
                      fontSize: 14.0,
                      fontWeight: FontWeight.w600,
                      color: AppColors.textWhite,
                    ),),
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

  // Define your custom page route with slide transition
  PageRouteBuilder _customPageRoute(Widget page) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => page,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        // Define the slide animation from the left
        const begin = Offset(1.0, 0.0); // Start off-screen on the left
        const end = Offset.zero; // End at the screen center
        const curve = Curves.easeInOut; // Smooth curve

        var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
        var offsetAnimation = animation.drive(tween);

        return SlideTransition(position: offsetAnimation, child: child);
      },
      transitionDuration: Duration(milliseconds: 500), // Duration of the transition
    );
  }
}


