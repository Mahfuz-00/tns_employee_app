class DashboardEntity {
  final int? activityId;
  final int? activityPendingCount;
  final String? activityPriority;
  final String? activityStartDate;
  final String? activityEndDate;
  final String? estimateHours;
  final String? activityStatus;
  final String? title;
  final String? project;
  final String? createdAt;
  final String? assignorName;
  final String? assignorImage;
  final String? projectName;
  final List<AssignedUserEntity>? assignedUsers;
  final String? availableLeave;
  final String? usedLeave;
  final int? attendanceId;
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

  DashboardEntity({
    required this.activityId,
    required this.activityPendingCount,
    required this.activityPriority,
    required this.activityStartDate,
    required this.activityEndDate,
    required this.estimateHours,
    required this.activityStatus,
    required this.title,
    required this.project,
    required this.createdAt,
    this.assignorName,
    this.assignorImage,
    required this.projectName,
    required this.assignedUsers,
    required this.availableLeave,
    required this.usedLeave,
    required this.leaveId,
    required this.leaveUserid,
    required this.leaveType,
    required this.leaveStartDate,
    required this.leaveEndDate,
    required this.leaveStatus,
    required this.leaveCreatedAt,
    required this.leaveUpdatedAt,
    required this.leaveDays,
    required this.leaveReason,
    required this.leaveResponsiblePersonId,
    required this.leaveApproverId,
    required this.attendanceId,
    required this.userId,
    required this.inTime,
    required this.outTime,
    required this.deviceIp,
    this.attendanceProject,
    required this.attendanceCreatedAt,
    required this.attendanceUpdatedAt,
    required this.userName,
    required this.voucherId,
    required this.voucherUserId,
    required this.voucherDate,
    required this.voucherProject,
    required this.costCenterId,
    required this.payeeType,
    required this.payeeOthersName,
    required this.voucherCustomerId,
    required this.voucherSupplierId,
    required this.voucherPaidbyId,
    this.voucherDescription,
    required this.totalAmount,
    required this.voucherPurchaseId,
    required this.voucherSaleId,
    required this.voucherApproverId,
    required this.voucherCreatedAt,
    required this.voucherUpdatedAt,
    this.costCenterName,
    this.voucherCustomerName,
    this.voucherSupplierName,
    this.voucherPaidByName,
    this.voucherApproverName,
    required this.voucherStatus,
  });

  /// Converts `DashboardModel` to domain entities
  DashboardEntity toEntity() {
    return DashboardEntity(
      activityId: activityId,
      activityPendingCount: activityPendingCount,
      activityPriority: activityPriority,
      activityStartDate: activityStartDate,
      activityEndDate: activityEndDate,
      estimateHours: estimateHours,
      activityStatus: activityStatus,
      title: title,
      project: project,
      createdAt: createdAt,
      assignorName: assignorName,
      assignorImage: assignorImage,
      projectName: projectName,
      assignedUsers: assignedUsers?.map((user) => AssignedUserEntity(id: 0, name: '')).toList(),
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
      voucherPurchaseId: voucherPurchaseId,
      voucherSaleId: voucherSaleId,
      voucherApproverId: voucherApproverId,
      voucherCreatedAt: voucherCreatedAt,
      voucherUpdatedAt: voucherUpdatedAt,
      voucherDate: voucherDate,
      voucherProject: voucherProject,
      costCenterId: costCenterId,
      voucherCustomerId: voucherCustomerId,
      voucherSupplierId: voucherSupplierId,
      voucherPaidbyId: voucherPaidbyId,
      payeeType: payeeType,
      payeeOthersName: payeeOthersName,
      voucherDescription: voucherDescription,
      totalAmount: totalAmount,
      costCenterName: costCenterName,
      voucherStatus: voucherStatus,
    );
  }

  @override
  String toString() {
    return 'DashboardEntity(Available Leave: $availableLeave, Used Leave: $usedLeave)';
  }
}

class AssignedUserEntity {
  final int id;
  final String name;
  final String? profilePhotoPath;

  const AssignedUserEntity({
    required this.id,
    required this.name,
    this.profilePhotoPath,
  });
}
