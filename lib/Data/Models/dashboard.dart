import '../../Domain/Entities/dashboard_entities.dart';

/// A data model for the dashboard containing various attributes like
/// activity details, project details, user information, and voucher details.
class DashboardModel {
  final int? activityId;
  final int? activityPendingCount;
  final String? activityPriority;
  final String? activityStartDate;
  final String? AcitvityEndDate;
  final String? estimateHours;
  final String? activityStatus;
  final String? title;
  final String? project;
  final String? createdAt;
  final String? assignorName;
  final String? assignorImage;
  final String? projectName;
  List<AssignedUserModel>? assignedUsers;

  final String? availableLeave;
  final String? usedLeave;
  final int? leaveId;
  final int? leaveUserid;
  final String? leaveType;
  final String? leaveStartDate;
  final String? leaveEndDate;
  final String? leaveStatus;
  final String? leaveCreatedAt;
  final String? leaveUpdatedAt;
  final int? leaveDays;
  final String? leaveReason;
  final int? leaveResponsiblePersonId;
  final int? leaveApproverId;

  final int? attendanceId;
  final int? userId;
  final String? inTime;
  final String? outTime;
  final String? deviceIp;
  final String? attendanceProject;
  final String? attendanceCreatedAt;
  final String? attendanceUpdatedAt;
  final String? userName;

  final int? voucherId;
  final int? voucherUserId;
  final String? voucherDate;
  final String? voucherProject;
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
  DashboardModel({
    this.activityId,
    this.activityPendingCount,
    this.activityPriority,
    this.activityStartDate,
    this.AcitvityEndDate,
    this.estimateHours,
    this.activityStatus,
    this.title,
    this.project,
    this.createdAt,
    this.assignorName,
    this.assignorImage,
    this.projectName,
    this.assignedUsers,
    this.availableLeave,
    this.usedLeave,
    this.attendanceId,
    this.leaveId,
    this.leaveUserid,
    this.leaveType,
    this.leaveStartDate,
    this.leaveEndDate,
    this.leaveStatus,
    this.leaveCreatedAt,
    this.leaveUpdatedAt,
    this.leaveDays,
    this.leaveReason,
    this.leaveResponsiblePersonId,
    this.leaveApproverId,
    this.userId,
    this.inTime,
    this.outTime,
    this.deviceIp,
    this.attendanceProject,
    this.attendanceCreatedAt,
    this.attendanceUpdatedAt,
    this.userName,
    this.voucherId,
    this.voucherUserId,
    this.voucherDate,
    this.voucherProject,
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
      activityPendingCount: json['ActivitiesPanding'] as int?,
      activityPriority: json['activities']['priority'] as String?,
      activityStartDate: json['activities']['start_date'] as String?,
      AcitvityEndDate: json['activities']['end_date'] as String?,
      estimateHours: json['activities']['estimate_hours'] as String?,
      activityStatus: json['activities']['status'] as String?,
      title: json['activities']['title'] as String?,
      project: json['activities']['project'] as String?,
      createdAt: json['activities']['created_at'] as String?,
      assignorName: json['activities']['assignor_name'] as String?,
      assignorImage: json['activities']['assignor_image'] as String?,
      projectName: json['activities']['project_name'] as String?,
      assignedUsers: (json['assigned_users'] as List?)
          ?.map((user) => AssignedUserModel.fromJson(user))
          .toList(),
      availableLeave: json['AvailableLeave'] as String?,
      usedLeave: json['UsedLeave'] as String?,
      attendanceId: json['attendance']['id'] as int?,
      leaveId: json['leave']['id'] as int?,
      leaveUserid: json['leave']['user_id'] as int?,
      leaveType: json['leave']['leave_type'] as String?,
      leaveStartDate: json['leave']['start_date'] as String?,
      leaveEndDate: json['leave']['end_date'] as String?,
      leaveStatus: json['leave']['status'] as String?,
      leaveCreatedAt: json['leave']['created_at'] as String?,
      leaveUpdatedAt: json['leave']['updated_at'] as String?,
      leaveDays: json['leave']['total_day'] as int?,
      leaveReason: json['leave']['reason'] as String?,
      leaveResponsiblePersonId: json['leave']['responsible_person_id'] as int?,
      leaveApproverId: json['leave']['approver_id'] as int?,
      userId: json['attendance']['user_id'] as int?,
      inTime: json['attendance']['in_time'] as String?,
      outTime: json['attendance']['out_time'] as String?,
      deviceIp: json['attendance']['device_ip'] as String?,
      attendanceProject: json['attendance']['project'] as String?,
      attendanceCreatedAt: json['attendance']['created_at'] as String?,
      attendanceUpdatedAt: json['attendance']['updated_at'] as String?,
      userName: json['attendance']['user_name'] as String?,
      voucherId: json['voucher']['id'] as int?,
      voucherUserId: json['voucher']['user_id'] as int?,
      voucherDate: json['voucher']['date'] as String?,
      voucherProject: json['voucher']['cost_center_name'] as String?,
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
      'end_date': AcitvityEndDate,
      'estimate_hours': estimateHours,
      'status': activityStatus,
      'title': title,
      'project': project,
      'created_at': createdAt,
      'assignor_name': assignorName,
      'assignor_image': assignorImage,
      'project_name': projectName,
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
      activityPendingCount: entity.activityPendingCount,
      activityPriority: entity.activityPriority,
      activityStartDate: entity.activityStartDate,
      AcitvityEndDate: entity.activityEndDate,
      estimateHours: entity.estimateHours,
      activityStatus: entity.activityStatus,
      title: entity.title,
      project: entity.project,
      createdAt: entity.createdAt,
      assignorName: entity.assignorName,
      assignorImage: entity.assignorImage,
      projectName: entity.projectName,
      assignedUsers: entity.assignedUsers
          ?.map((assignedUserEntity) =>
              AssignedUserModel.fromEntity(assignedUserEntity))
          .toList(),
      availableLeave: entity.availableLeave,
      usedLeave: entity.usedLeave,
      leaveId: entity.leaveId,
      leaveUserid: entity.leaveUserid,
      leaveType: entity.leaveType,
      leaveStartDate: entity.leaveStartDate,
      leaveEndDate: entity.leaveEndDate,
      leaveStatus: entity.leaveStatus,
      leaveCreatedAt: entity.leaveCreatedAt,
      leaveUpdatedAt: entity.leaveUpdatedAt,
      leaveDays: entity.leaveDays,
      leaveReason: entity.leaveReason,
      leaveResponsiblePersonId: entity.leaveResponsiblePersonId,
      leaveApproverId: entity.leaveApproverId,
      attendanceId: entity.attendanceId,
      userId: entity.userId,
      inTime: entity.inTime,
      outTime: entity.outTime,
      deviceIp: entity.deviceIp,
      attendanceProject: entity.attendanceProject,
      attendanceCreatedAt: entity.attendanceCreatedAt,
      attendanceUpdatedAt: entity.attendanceUpdatedAt,
      userName: entity.userName,
      voucherId: entity.voucherId,
      voucherDate: entity.voucherDate,
      voucherProject: entity.voucherProject,
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
      activityPendingCount: activityPendingCount,
      activityPriority: activityPriority,
      activityStartDate: activityStartDate,
      activityEndDate: AcitvityEndDate,
      estimateHours: estimateHours,
      activityStatus: activityStatus,
      title: title,
      project: project,
      createdAt: createdAt,
      assignorName: assignorName,
      assignorImage: assignorImage,
      projectName: projectName,
      assignedUsers: assignedUsers
          ?.map((assignedUser) => assignedUser.toEntity())
          .toList(),
      availableLeave: availableLeave,
      usedLeave: usedLeave,
      attendanceId: attendanceId,
      leaveId: leaveId,
      leaveUserid: leaveUserid,
      leaveType: leaveType,
      leaveStartDate: leaveStartDate,
      leaveEndDate: leaveEndDate,
      leaveStatus: leaveStatus,
      leaveCreatedAt: leaveCreatedAt,
      leaveUpdatedAt: leaveUpdatedAt,
      leaveDays: leaveDays,
      leaveReason: leaveReason,
      leaveResponsiblePersonId: leaveResponsiblePersonId,
      leaveApproverId: leaveApproverId,
      userId: userId,
      inTime: inTime,
      outTime: outTime,
      deviceIp: deviceIp,
      attendanceProject: attendanceProject,
      attendanceCreatedAt: attendanceCreatedAt,
      attendanceUpdatedAt: attendanceUpdatedAt,
      userName: userName,
      voucherId: voucherId,
      voucherUserId: voucherUserId,
      voucherDate: voucherDate,
      voucherProject: voucherProject,
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

class AssignedUserModel extends AssignedUserEntity {
  const AssignedUserModel({
    required int id,
    required String name,
    String? profilePhotoPath,
  }) : super(
          id: id,
          name: name,
          profilePhotoPath: profilePhotoPath,
        );

  // Convert Model to JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'profile_photo_path': profilePhotoPath,
    };
  }

  // Create Model from JSON
  factory AssignedUserModel.fromJson(Map<String, dynamic> json) {
    return AssignedUserModel(
      id: json['id'] as int,
      name: json['name'] as String,
      profilePhotoPath: json['profile_photo_path'] as String?,
    );
  }

  // Convert Model to Entity
  AssignedUserEntity toEntity() {
    return AssignedUserEntity(
      id: id,
      name: name,
      profilePhotoPath: profilePhotoPath,
    );
  }

  // Create Model from Entity
  factory AssignedUserModel.fromEntity(AssignedUserEntity entity) {
    return AssignedUserModel(
      id: entity.id,
      name: entity.name,
      profilePhotoPath: entity.profilePhotoPath,
    );
  }
}
