import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:touch_and_solve_inventory_app/Common/Widgets/Label_Text_Without_Asterisk.dart';
import 'package:touch_and_solve_inventory_app/Common/Widgets/label_above_datafield.dart';
import 'package:touch_and_solve_inventory_app/Core/Config/Theme/app_colors.dart';
import 'package:touch_and_solve_inventory_app/Presentation/Activity%20Dashboard%20Page/Page/activity_dashboard_UI.dart';

import '../../../Common/Widgets/appbar_model.dart';
import '../../../Common/Widgets/bottom_navigation_bar.dart';
import '../../../Common/Widgets/bottom_navigation_bar_with_swipe.dart';
import '../../../Common/Widgets/drop_down.dart';
import '../../../Common/Widgets/internet_connection_check.dart';
import '../../../Core/Config/Assets/app_images.dart';
import '../../Activity Creation Page/Widget/date_picker.dart';
import '../Widget/custom_border_painter.dart';
import '../Widget/head_of_accounts_and_expense_amount_set.dart';
import '../Widget/single_date_picker.dart';

class VoucherCreation extends StatefulWidget {
  const VoucherCreation({super.key});

  @override
  State<VoucherCreation> createState() => _VoucherCreationState();
}

class _VoucherCreationState extends State<VoucherCreation> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _expenseamountcontroller =
      new TextEditingController();
  final TextEditingController _expensedescriptioncontroller =
      new TextEditingController();
  final TextEditingController _voucherDateController = TextEditingController();
  final TextEditingController _projectController = TextEditingController();
  String _selectedProject = '';
  bool isButtonEnabled = false;

  DateTime? tansactionDate;

  // Form validation function to enable/disable button
  void _validateForm() {
    print('Expense Date: ${_voucherDateController.text}');
    print('Project: ${_projectController.text}');
    print('Expense Data: ${_expenseData}');
    // print('Task Title: ${_expenseamountcontroller.text}');
    print('Voucher Description: ${_expensedescriptioncontroller.text}');
    print('Button enabled: $isButtonEnabled');

    // Check if any of the fields are empty
    bool areFieldsFilled = /*_expenseamountcontroller.text.isNotEmpty &&*/
        _expenseData != null &&
            _expensedescriptioncontroller.text.isNotEmpty &&
            _voucherDateController.text.isNotEmpty &&
            _projectController.text.isNotEmpty;

    setState(() {
      isButtonEnabled = areFieldsFilled;
    });
  }

  // List to store the expenses data
  List<Map<String, String>> _expenseData = [];

  // Callback function to handle the data from ExpenseListWidget
  void _handleExpenseData(List<Map<String, String>> expenseList) {
    setState(() {
      _expenseData = expenseList;
      print('Expense Data: ${_expenseData}');
    });
  }

  // Handle date selection for start and end dates
  void _onTransactionDateSelected(DateTime selectedDate) {
    setState(() {
      tansactionDate = selectedDate;
    });
  }

  Future<void> _pickFile() async {
    // Trigger the file picker dialog
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf', 'jpeg', 'png'], // Allowed file extensions
    );

    // Check if a file was picked
    if (result != null) {
      // Get the file path
      String? filePath = result.files.single.path;

      if (filePath != null) {
        // File picked successfully, you can now upload the file
        print("File selected: $filePath");
        // Implement your file upload logic here (e.g., upload to a server)
      } else {
        // If no file is selected
        print("No file selected");
      }
    } else {
      const snackBar = SnackBar(
        content: Text('File picking canceled'),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      // User canceled the picker
      print("File picking canceled");
    }
  }

  @override
  void initState() {
    super.initState();

    // Adding listeners to the controllers to detect changes
    _expenseamountcontroller.addListener(_validateForm);
    _expensedescriptioncontroller.addListener(_validateForm);
    _voucherDateController.addListener(_validateForm);
    _projectController.addListener(_validateForm);
  }

  @override
  void dispose() {
    // Dispose of controllers to avoid memory leaks
    _expenseamountcontroller.dispose();
    _expensedescriptioncontroller.dispose();
    _voucherDateController.dispose();
    _projectController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return InternetConnectionChecker(
      child: Scaffold(
        appBar: AppBarModel(
          title: 'Submit Expense',
        ),
        body: SafeArea(
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
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      //mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'Fill Claim Infromation',
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
                          'Information about claim details',
                          style: TextStyle(
                              fontSize: 14.0,
                              fontWeight: FontWeight.w400,
                              color: AppColors.labelGrey,
                              fontFamily: 'Roboto'),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        LabelWidget(labelText: 'Voucher Date'),
                        SingleDatePicker(
                          controller: _voucherDateController,
                          label: 'Voucher Date',
                          onDateSelected: _onTransactionDateSelected,
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        LabelWidget(labelText: 'Project'),
                        Dropdown(
                          controller: _projectController,
                          label: 'Select Project',
                          options: ['ASSET', 'Inventory Software', '5 Apps'],
                          // List of options
                          selectedValue: _selectedProject,
                          onChanged: (value) {
                            setState(() {
                              _selectedProject = value!;
                              _projectController.text = value ?? '';
                            });
                          },
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please select a project';
                            }
                            return null;
                          },
                          hinttext: 'Select Project',
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        ExpenseListWidget(
                          onExpenseAdded: _handleExpenseData,
                        ),
                        /*       LabelWidget(labelText: 'Expense Amount'),
                        TextFormField(
                          controller: _expenseamountcontroller,
                          // Use the controller
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(4),
                              ),
                              hintText: 'Enter expense amount',
                              labelText: 'Expense Amount',
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
                              suffixIcon: Icon(
                                Icons.add,
                                color: AppColors.primary,
                                size: 24,
                              )),
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: AppColors.labelGrey,
                            fontFamily: 'Roboto',
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your expense amount';
                            }
                            return null;
                          },
                        ),
                        SizedBox(
                          height: 16,
                        ),*/
                        LabelWidget(labelText: 'Expense Description'),
                        TextFormField(
                          controller: _expensedescriptioncontroller,
                          // Use the controller
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(4),
                            ),
                            hintText: 'Enter Expense Description',
                            labelText: 'Expense Description',
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
                              return 'Please enter a expense description';
                            }
                            return null;
                          },
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        Center(
                          child: GestureDetector(
                            onTap: _pickFile,
                            child: Container(
                              height: 120,
                              width: screenWidth * 0.9,
                              decoration: BoxDecoration(
                                color: AppColors.containerBackgroundPurple,
                                //border: Border.all(color: Colors.grey),
                                borderRadius: BorderRadius.circular(4),
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(4),
                                child: CustomPaint(
                                  painter: DashedBorderPainter(),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Image.asset(
                                        AppImages.VoucherFileUploadIcon,
                                        height: 30,
                                        width: 30,
                                      ),
                                      SizedBox(height: 8),
                                      Text(
                                        "Upload Claim Document",
                                        style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500,
                                          color: AppColors.primary,
                                          fontFamily: 'Roboto',
                                        ),
                                      ),
                                      SizedBox(height: 4),
                                      Text(
                                        "Format should be in .pdf, .jpeg, .png less than 5 MB",
                                        style: TextStyle(
                                          fontSize: 10,
                                          fontWeight: FontWeight.w400,
                                          color: AppColors.labelGrey,
                                          fontFamily: 'Roboto',
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
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
                      'Submit Expense',
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
                  currentPage: 'Voucher',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
