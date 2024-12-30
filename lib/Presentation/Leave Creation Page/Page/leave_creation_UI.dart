import 'package:flutter/material.dart';
import 'package:touch_and_solve_inventory_app/Common/Widgets/label_above_datafield.dart';
import 'package:touch_and_solve_inventory_app/Core/Config/Theme/app_colors.dart';
import 'package:touch_and_solve_inventory_app/Presentation/Activity%20Dashboard%20Page/Page/activity_dashboard_UI.dart';

import '../../../Common/Widgets/appbar_model.dart';
import '../../../Common/Widgets/bottom_navigation_bar.dart';
import '../../../Common/Widgets/bottom_navigation_bar_with_swipe.dart';
import '../../../Common/Widgets/drop_down.dart';
import '../../Voucher Creation Page/Widget/single_date_picker.dart';
import '../Widget/phone_textformfield.dart';
import '../Widget/rangedatepicker.dart';

class LeaveCreation extends StatefulWidget {
  const LeaveCreation({super.key});

  @override
  State<LeaveCreation> createState() => _LeaveCreationState();
}

class _LeaveCreationState extends State<LeaveCreation> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _leavecategorycontroller =
      new TextEditingController();
  final TextEditingController _taskdelegationcontroller =
      new TextEditingController();
  final TextEditingController _leavedescriptioncontroller =
      new TextEditingController();
  final TextEditingController _leavedurationController = TextEditingController();
  final TextEditingController _assigntoController = TextEditingController();
  final TextEditingController _relationController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  String _selectedLeaveCategory = '';
  String _selectedTaskDelegation = '';
  String _selectedAssignTo = '';
  bool isButtonEnabled = false;

  DateTime? leaveDurationStart;
  DateTime? leaveDurationEnd;

  // Form validation function to enable/disable button
  void _validateForm() {
    print('Leave Category: ${_leavecategorycontroller.text}');
    print('Task Delegation: ${_taskdelegationcontroller.text}');
    print('Task Description: ${_leavedescriptioncontroller.text}');
    print('Leave Duration: ${_leavedurationController.text}');
    print('Assigned To: ${_assigntoController.text}');
    print('Relation: ${_relationController.text}');
    print('Phone: ${_phoneController.text}');
    print('Button enabled: $isButtonEnabled');

    // Check if any of the fields are empty
    bool areFieldsFilled = _leavecategorycontroller.text.isNotEmpty &&
        _taskdelegationcontroller.text.isNotEmpty &&
        _leavedescriptioncontroller.text.isNotEmpty &&
        _leavedurationController.text.isNotEmpty &&
        _relationController.text.isNotEmpty &&
        _phoneController.text.isNotEmpty &&
        _assigntoController.text.isNotEmpty;

    setState(() {
      isButtonEnabled = areFieldsFilled;
    });
  }

  // Handle date selection for start and end dates
  void _onLeaveDurationSelected(DateTime startDate, DateTime endDate) {
    setState(() {
      leaveDurationStart = startDate;
      leaveDurationEnd = endDate;
    });
  }


  @override
  void initState() {
    super.initState();

    // Adding listeners to the controllers to detect changes
    _leavecategorycontroller.addListener(_validateForm);
    _taskdelegationcontroller.addListener(_validateForm);
    _leavedescriptioncontroller.addListener(_validateForm);
    _leavedurationController.addListener(_validateForm);
    _assigntoController.addListener(_validateForm);
    _relationController.addListener(_validateForm);
    _phoneController.addListener(_validateForm);
  }

  @override
  void dispose() {
    // Dispose of controllers to avoid memory leaks
    _taskdelegationcontroller.dispose();
    _leavedescriptioncontroller.dispose();
    _leavedurationController.dispose();
    _assigntoController.dispose();
    _relationController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBarModel(
        title: 'Submit Leave',
      ),
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
                    borderRadius: BorderRadius.all(Radius.circular(4)),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Fill Leave Infromation',
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
                        'Information about leave details',
                        style: TextStyle(
                            fontSize: 14.0,
                            fontWeight: FontWeight.w400,
                            color: AppColors.labelGrey,
                            fontFamily: 'Roboto'),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      LabelWidget(labelText: 'Leave Category'),
                      Dropdown(
                        controller: _leavecategorycontroller,
                        label: 'Leave Category',
                        options: ['Personal', 'Sick', 'Official'],
                        // List of options
                        selectedValue: _selectedLeaveCategory,
                        onChanged: (value) {
                          setState(() {
                            _selectedLeaveCategory = value!;
                            _leavecategorycontroller.text = value ?? '';
                          });
                        },
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please select a category';
                          }
                          return null;
                        },
                        hinttext: 'Select Category',
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      LabelWidget(labelText: 'Leave Duration'),
                      RangeDatePicker(
                        controller: _leavedurationController,
                        label: 'Leave Duration',
                        onDateSelected: _onLeaveDurationSelected,
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      LabelWidget(labelText: 'Task Delegation'),
                      Dropdown(
                        controller: _taskdelegationcontroller,
                        label: 'Task Delegation',
                        options: ['Personal', 'Sick', 'Official'],
                        // List of options
                        selectedValue: _selectedTaskDelegation,
                        onChanged: (value) {
                          setState(() {
                            _selectedTaskDelegation = value!;
                            _taskdelegationcontroller.text = value ?? '';
                          });
                        },
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please select a category';
                          }
                          return null;
                        },
                        hinttext: 'Select Category',
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      LabelWidget(labelText: 'In Absence task assigned to'),
                      Dropdown(
                        controller: _assigntoController,
                        label: 'Select Assign Person',
                        options: ['Sajjad', 'Shihab', 'Munna'],
                        // List of options
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
                        },
                        hinttext: 'Select Assign Person',
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      LabelWidget(
                          labelText: 'Emergency Contact During Leave Period'),
                      PhoneNumberInputField(
                        onPhoneChanged: (phone) {
                          setState(() {
                            print('Phone Number: $phone');
                            _phoneController.text = phone;
                          });
                        },
                        onRelationChanged: (relation) {
                          print('Relation: $relation');
                          _relationController.text = relation;
                        },
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      LabelWidget(labelText: 'Leave Description'),
                      TextFormField(
                        controller: _leavedescriptioncontroller,
                        // Use the controller
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(4),
                          ),
                          hintText: 'Enter Leave Description',
                          labelText: 'Leave Description',
                          alignLabelWithHint: true,
                          // Ensure label stays at the top
                          labelStyle: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: AppColors.labelGrey,
                            fontFamily: 'Roboto',
                          ),
                          hintStyle: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: AppColors.labelGrey,
                            fontFamily: 'Roboto',
                          ),
                        ),
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: AppColors.labelGrey,
                          fontFamily: 'Roboto',
                        ),
                        maxLines: 3,
                        // Make the field larger by increasing maxLines
                        minLines: 3,
                        // Set the minimum number of lines to display
                        // floatingLabelBehavior: FloatingLabelBehavior.always, // Ensure the label stays at the top
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter leave description';
                          }
                          return null;
                        },
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
                  onPressed: isButtonEnabled
                      ? () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ActivityDashboard()),
                          );
                        }
                      : null,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: isButtonEnabled
                        ? AppColors.primary
                        : AppColors.labelGrey,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 24, vertical: 12),
                    fixedSize: Size(screenWidth * 0.9, 50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                  child: const Text(
                    'Create Task',
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
    );
  }
}
