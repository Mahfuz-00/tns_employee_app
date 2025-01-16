import '../../Domain/Entities/dashboard_entities.dart';

/// A data model for the dashboard containing various attributes like
/// activity details, project details, user information, and voucher details.
class DashboardModel {
  final int? activityId;
  final String? endDate;
  final String? estimateHours;
  final String? status;
  final String? title;
  final String? project;
  final String? createdAt;
  final String? assignorName;
  final String? assignorImage;

  final int? projectId;
  final String? projectName;
  final String? projectSlug;
  final String? projectDescription;
  final String? projectStatus;
  final String? projectCreatedAt;
  final String? projectUpdatedAt;

  final String? availableLeave;
  final String? usedLeave;

  final int? attendanceId;
  final int? userId;
  final String? inTime;
  final String? outTime;
  final String? deviceIp;
  final String? attendanceProject;
  final String? attendanceCreatedAt;
  final String? attendanceUpdatedAt;

  final String? userName;
  final String? userEmail;
  final String? userPhone;
  final String? userDepartment;
  final String? userDesignation;
  final String? userEmployeeId;
  final int? userBalance;
  final int? userOpeningBalance;
  final String? userOpeningBalanceDate;
  final String? userProfilePhotoUrl;

  final int? voucherId;
  final int? voucherUserId;
  final String? voucherDate;
  final int? costCenterId;
  final String? payeeType;
  final String? payeeOthersName;
  final String? voucherCustomerId;
  final String? voucherSupplierId;
  final int? voucherPaidbyId;
  final String? voucherDescription;
  final String? totalAmount;
  final String? voucherPurchaseId;
  final String? voucherSaleId;
  final int? voucherApproverId;
  final String? voucherCreatedAt;
  final String? voucherUpdatedAt;
  final String? costCenterName;
  final String? voucherCustomerName;
  final String? voucherSupplierName;
  final String? voucherPaidByName;
  final String? voucherApproverName;
  final String? voucherStatus;

  /// Constructor with all fields made nullable
  const DashboardModel({
    this.activityId,
    this.endDate,
    this.estimateHours,
    this.status,
    this.title,
    this.project,
    this.createdAt,
    this.assignorName,
    this.assignorImage,
    this.projectId,
    this.projectName,
    this.projectSlug,
    this.projectDescription,
    this.projectStatus,
    this.projectCreatedAt,
    this.projectUpdatedAt,
    this.availableLeave,
    this.usedLeave,
    this.attendanceId,
    this.userId,
    this.inTime,
    this.outTime,
    this.deviceIp,
    this.attendanceProject,
    this.attendanceCreatedAt,
    this.attendanceUpdatedAt,
    this.userName,
    this.userEmail,
    this.userPhone,
    this.userDepartment,
    this.userDesignation,
    this.userEmployeeId,
    this.userBalance,
    this.userOpeningBalance,
    this.userOpeningBalanceDate,
    this.userProfilePhotoUrl,
    this.voucherId,
    this.voucherUserId,
    this.voucherDate,
    this.costCenterId,
    this.payeeType,
    this.payeeOthersName,
    this.voucherCustomerId,
    this.voucherSupplierId,
    this.voucherPaidbyId,
    this.voucherDescription,
    this.totalAmount,
    this.voucherPurchaseId,
    this.voucherSaleId,
    this.voucherApproverId,
    this.voucherCreatedAt,
    this.voucherUpdatedAt,
    this.costCenterName,
    this.voucherCustomerName,
    this.voucherSupplierName,
    this.voucherPaidByName,
    this.voucherApproverName,
    this.voucherStatus,
  });

  /// Converts JSON into a `DashboardModel`
  factory DashboardModel.fromJson(Map<String, dynamic> json) {
    return DashboardModel(
      activityId: json['activities']['id'] as int?,
      endDate: json['activities']['end_date'] as String?,
      estimateHours: json['activities']['estimate_hours'] as String?,
      status: json['activities']['status'] as String?,
      title: json['activities']['title'] as String?,
      project: json['activities']['project'] as String?,
      createdAt: json['activities']['created_at'] as String?,
      assignorName: json['activities']['assignor_name'] as String?,
      assignorImage: json['activities']['assignor_image'] as String?,
      projectId: json['activities']['project_profile']['id'] as int?,
      projectName: json['activities']['project_profile']['name'] as String?,
      projectSlug: json['activities']['project_profile']['slug'] as String?,
      projectDescription:
          json['activities']['project_profile']['description'] as String?,
      projectStatus: json['activities']['project_profile']['status'] as String?,
      projectCreatedAt:
          json['activities']['project_profile']['created_at'] as String?,
      projectUpdatedAt:
          json['activities']['project_profile']['updated_at'] as String?,
      availableLeave: json['AvailableLeave'] as String?,
      usedLeave: json['UsedLeave'] as String?,
      attendanceId: json['attendance']['id'] as int?,
      userId: json['attendance']['user_id'] as int?,
      inTime: json['attendance']['in_time'] as String?,
      outTime: json['attendance']['out_time'] as String?,
      deviceIp: json['attendance']['device_ip'] as String?,
      attendanceProject: json['attendance']['project'] as String?,
      attendanceCreatedAt: json['attendance']['created_at'] as String?,
      attendanceUpdatedAt: json['attendance']['updated_at'] as String?,
      userName: json['attendance']['user']['name'] as String?,
      userEmail: json['attendance']['user']['email'] as String?,
      userPhone: json['attendance']['user']['phone'] as String?,
      userDepartment: json['attendance']['user']['department'] as String?,
      userDesignation: json['attendance']['user']['designation'] as String?,
      userEmployeeId: json['attendance']['user']['employee_id'] as String?,
      userBalance: json['attendance']['user']['balance'] as int?,
      userOpeningBalance: json['attendance']['user']['opening_balance'] as int?,
      userOpeningBalanceDate:
          json['attendance']['user']['opening_balance_date'] as String?,
      userProfilePhotoUrl:
          json['attendance']['user']['profile_photo_url'] as String?,
      voucherId: json['voucher']['id'] as int?,
      voucherUserId: json['voucher']['user_id'] as int?,
      voucherDate: json['voucher']['date'] as String?,
      costCenterId: json['voucher']['cost_center_id'] as int?,
      payeeType: json['voucher']['payee_type'] as String?,
      payeeOthersName: json['voucher']['payee_others_name'] as String?,
      voucherCustomerId: json['voucher']['customer_id'] as String?,
      voucherSupplierId: json['voucher']['supplier_id'] as String?,
      voucherPaidbyId: json['voucher']['paid_by_id'] as int?,
      voucherPurchaseId: json['voucher']['purchase_id'] as String?,
      voucherSaleId: json['voucher']['sale_id'] as String?,
      voucherDescription: json['voucher']['description'] as String?,
      totalAmount: json['voucher']['total_amount'] as String?,
      voucherApproverId: json['voucher']['approver_id'] as int?,
      voucherCreatedAt: json['voucher']['created_at'] as String?,
      voucherUpdatedAt: json['voucher']['updated_at'] as String?,
      voucherCustomerName: json['voucher']['customer_name'] as String?,
      costCenterName: json['voucher']['cost_center_name'] as String?,
      voucherSupplierName: json['voucher']['supplier_name'] as String?,
      voucherPaidByName: json['voucher']['paidby_name'] as String?,
      voucherApproverName: json['voucher']['approver_name'] as String?,
      voucherStatus: json['voucher']['status'] as String?,
    );
  }

  /// Converts a `DashboardModel` to JSON
  Map<String, dynamic> toJson() {
    return {
      'activity_id': activityId,
      'end_date': endDate,
      'estimate_hours': estimateHours,
      'status': status,
      'title': title,
      'project': project,
      'created_at': createdAt,
      'assignor_name': assignorName,
      'assignor_image': assignorImage,
      'project_id': projectId,
      'project_name': projectName,
      'project_slug': projectSlug,
      'project_description': projectDescription,
      'project_status': projectStatus,
      'project_created_at': projectCreatedAt,
      'project_updated_at': projectUpdatedAt,
      'available_leave': availableLeave,
      'used_leave': usedLeave,
      'attendance_id': attendanceId,
      'user_id': userId,
      'in_time': inTime,
      'out_time': outTime,
      'device_ip': deviceIp,
      'attendance_project': attendanceProject,
      'attendance_created_at': attendanceCreatedAt,
      'attendance_updated_at': attendanceUpdatedAt,
      'user_name': userName,
      'user_email': userEmail,
      'user_phone': userPhone,
      'user_department': userDepartment,
      'user_designation': userDesignation,
      'user_employee_id': userEmployeeId,
      'user_balance': userBalance,
      'user_opening_balance': userOpeningBalance,
      'user_opening_balance_date': userOpeningBalanceDate,
      'user_profile_photo_url': userProfilePhotoUrl,
      'voucher_id': voucherId,
      'voucher_date': voucherDate,
      'cost_center_id': costCenterId,
      'payee_type': payeeType,
      'payee_others_name': payeeOthersName,
      'description': voucherDescription,
      'total_amount': totalAmount,
      'cost_center_name': costCenterName,
      'status': voucherStatus,
    };
  }

  /// Converts domain entities to `DashboardModel`
  factory DashboardModel.fromEntities(DashboardEntity entity) {
    return DashboardModel(
      activityId: entity.activityId,
      endDate: entity.endDate,
      estimateHours: entity.estimateHours,
      status: entity.status,
      title: entity.title,
      project: entity.project,
      createdAt: entity.createdAt,
      assignorName: entity.assignorName,
      assignorImage: entity.assignorImage,
      projectId: entity.projectId,
      projectName: entity.projectName,
      projectSlug: entity.projectSlug,
      projectDescription: entity.projectDescription,
      projectStatus: entity.projectStatus,
      projectCreatedAt: entity.projectCreatedAt,
      projectUpdatedAt: entity.projectUpdatedAt,
      availableLeave: entity.availableLeave,
      usedLeave: entity.usedLeave,
      attendanceId: entity.attendanceId,
      userId: entity.userId,
      inTime: entity.inTime,
      outTime: entity.outTime,
      deviceIp: entity.deviceIp,
      attendanceProject: entity.attendanceProject,
      attendanceCreatedAt: entity.attendanceCreatedAt,
      attendanceUpdatedAt: entity.attendanceUpdatedAt,
      userName: entity.userName,
      userEmail: entity.userEmail,
      userPhone: entity.userPhone,
      userDepartment: entity.userDepartment,
      userDesignation: entity.userDesignation,
      userEmployeeId: entity.userEmployeeId,
      userBalance: entity.userBalance,
      userOpeningBalance: entity.userOpeningBalance,
      userOpeningBalanceDate: entity.userOpeningBalanceDate,
      userProfilePhotoUrl: entity.userProfilePhotoUrl,
      voucherId: entity.voucherId,
      voucherDate: entity.voucherDate,
      costCenterId: entity.costCenterId,
      payeeType: entity.payeeType,
      payeeOthersName: entity.payeeOthersName,
      voucherDescription: entity.voucherDescription,
      totalAmount: entity.totalAmount,
      costCenterName: entity.costCenterName,
      voucherStatus: entity.voucherStatus,
    );
  }

  /// Converts `DashboardModel` to domain entities
  @override
  DashboardEntity toEntity() {
    return DashboardEntity(
      activityId: activityId,
      endDate: endDate,
      estimateHours: estimateHours,
      status: status,
      title: title,
      project: project,
      createdAt: createdAt,
      assignorName: assignorName,
      assignorImage: assignorImage,
      projectId: projectId,
      projectName: projectName,
      projectSlug: projectSlug,
      projectDescription: projectDescription,
      projectStatus: projectStatus,
      projectCreatedAt: projectCreatedAt,
      projectUpdatedAt: projectUpdatedAt,
      availableLeave: availableLeave,
      usedLeave: usedLeave,
      attendanceId: attendanceId,
      userId: userId,
      inTime: inTime,
      outTime: outTime,
      deviceIp: deviceIp,
      attendanceProject: attendanceProject,
      attendanceCreatedAt: attendanceCreatedAt,
      attendanceUpdatedAt: attendanceUpdatedAt,
      userName: userName,
      userEmail: userEmail,
      userPhone: userPhone,
      userDepartment: userDepartment,
      userDesignation: userDesignation,
      userEmployeeId: userEmployeeId,
      userBalance: userBalance,
      userOpeningBalance: userOpeningBalance,
      userOpeningBalanceDate: userOpeningBalanceDate,
      userProfilePhotoUrl: userProfilePhotoUrl,
      voucherId: voucherId,
      voucherUserId: voucherUserId,
      voucherDate: voucherDate,
      costCenterId: costCenterId,
      payeeType: payeeType,
      payeeOthersName: payeeOthersName,
      voucherCustomerId: voucherCustomerId,
      voucherSupplierId: voucherSupplierId,
      voucherPaidbyId: voucherPaidbyId,
      voucherDescription: voucherDescription,
      totalAmount: totalAmount,
      voucherPurchaseId: voucherPurchaseId,
      voucherSaleId: voucherSaleId,
      voucherApproverId: voucherApproverId,
      voucherCreatedAt: voucherCreatedAt,
      voucherUpdatedAt: voucherUpdatedAt,
      voucherCustomerName: voucherCustomerName,
      costCenterName: costCenterName,
      voucherSupplierName: voucherSupplierName,
      voucherPaidByName: voucherPaidByName,
      voucherApproverName: voucherApproverName,
      voucherStatus: voucherStatus,
    );
  }
}
