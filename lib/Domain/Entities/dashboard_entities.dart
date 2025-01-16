class DashboardEntity {
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
  final  int? voucherUserId;
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

  DashboardEntity({
    required this.activityId,
    required this.endDate,
    required this.estimateHours,
    required this.status,
    required this.title,
    required this.project,
    required this.createdAt,
    this.assignorName,
    this.assignorImage,
    required this.projectId,
    required this.projectName,
    required this.projectSlug,
    this.projectDescription,
    required this.projectStatus,
    required this.projectCreatedAt,
    required this.projectUpdatedAt,
    required this.availableLeave,
    required this.usedLeave,
    required this.attendanceId,
    required this.userId,
    required this.inTime,
    required this.outTime,
    required this.deviceIp,
    this.attendanceProject,
    required this.attendanceCreatedAt,
    required this.attendanceUpdatedAt,
    required this.userName,
    required this.userEmail,
    required this.userPhone,
    required this.userDepartment,
    required this.userDesignation,
    required this.userEmployeeId,
    required this.userBalance,
    required this.userOpeningBalance,
    required this.userOpeningBalanceDate,
    this.userProfilePhotoUrl,
    required this.voucherId,
    required this.voucherUserId,
    required this.voucherDate,
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
      voucherPurchaseId: voucherPurchaseId,
      voucherSaleId: voucherSaleId,
      voucherApproverId: voucherApproverId,
      voucherCreatedAt: voucherCreatedAt,
      voucherUpdatedAt: voucherUpdatedAt,
      voucherDate: voucherDate,
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
