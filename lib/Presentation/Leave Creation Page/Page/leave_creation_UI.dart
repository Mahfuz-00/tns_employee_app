import 'package:flutter/material.dart';
import 'package:touch_and_solve_inventory_app/Common/Widgets/Label_Text_Without_Asterisk.dart';
import 'package:touch_and_solve_inventory_app/Common/Widgets/label_above_datafield.dart';
import 'package:touch_and_solve_inventory_app/Core/Config/Theme/app_colors.dart';
import 'package:touch_and_solve_inventory_app/Presentation/Activity%20Dashboard%20Page/Page/activity_dashboard_UI.dart';

import '../../../Common/Widgets/appbar_model.dart';
import '../../../Common/Widgets/bottom_naviagtion_bar.dart';
import '../../../Common/Widgets/drop_down.dart';
import '../../Activity Creation Page/Widget/date_picker.dart';

class LeaveCreation extends StatefulWidget {
  const LeaveCreation({super.key});

  @override
  State<LeaveCreation> createState() => _LeaveCreationState();
}

class _LeaveCreationState extends State<LeaveCreation> {
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
      appBar: AppBarModel(title: 'Submit Leave',),
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
                      SizedBox(height: 8,),
                      TextFormField(
                        controller: _tasktitlecontroller, // Use the controller
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          hintText: 'Enter task title',
                          labelText: 'Task Title',
                          labelStyle: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: AppColors.labelGrey,
                            fontFamily: 'Roboto',),
                          hintStyle: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: AppColors.labelGrey,
                            fontFamily: 'Roboto',),
                        ),
                        style: TextStyle(
                          fontSize: 16,
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
                      SizedBox(height: 8,),
                      TextFormField(
                        controller: _taskdescriptioncontroller, // Use the controller
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          hintText: 'Enter Task Description',
                          labelText: 'Task Description',
                          alignLabelWithHint: true, // Ensure label stays at the top
                          labelStyle: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: AppColors.labelGrey,
                            fontFamily: 'Roboto',),
                          hintStyle: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: AppColors.labelGrey,
                            fontFamily: 'Roboto',),
                        ),
                        style: TextStyle(
                          fontSize: 16,
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
                      SizedBox(height: 8,),
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
                      SizedBox(height: 8,),
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
                      SizedBox(height: 8,),
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
                      SizedBox(height: 8,),
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
        height: screenHeight * 0.167,
        child: Column(
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
                      MaterialPageRoute(builder: (context) => ActivityDashboard()),
                    );
                  }: null,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: isButtonEnabled ? AppColors.primary: AppColors.labelGrey,
                    padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                    fixedSize: Size(screenWidth*0.9, 50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Text('Create Task',
                    style: TextStyle(
                      fontFamily: 'Roboto',
                      fontSize: 16.0,
                      fontWeight: FontWeight.w600,
                      color: AppColors.textWhite,
                    ),),
                ),
              ),
            ),
            BottomNavBar(
              containerHeight: screenHeight * 0.08,
              currentPage: 'Activity',
            ),
          ],
        ),
      ),
    );
  }
}


