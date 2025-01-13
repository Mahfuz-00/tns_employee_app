import '../../Domain/Entities/voucher_entites.dart';

class VoucherModel extends VoucherEntity {
  VoucherModel({
    required int id,
    required int userId,
    required dynamic date,
    required dynamic costCenterId,
    required dynamic payeeType,
    required dynamic payeeOthersName,
    dynamic customerId,
    dynamic supplierId,
    required dynamic paidById,
    required dynamic description,
    required dynamic totalAmount,
    dynamic purchaseId,
    dynamic attachment,
    dynamic saleId,
    dynamic approverId,
    required dynamic status,
    required dynamic createdAt,
    required dynamic updatedAt,
  }) : super(
    id: id,
    userId: userId,
    date: date,
    costCenterId: costCenterId,
    payeeType: payeeType,
    payeeOthersName: payeeOthersName,
    customerId: customerId,
    supplierId: supplierId,
    paidById: paidById,
    description: description,
    totalAmount: totalAmount,
    purchaseId: purchaseId,
    attachment: attachment,
    saleId: saleId,
    approverId: approverId,
    status: status,
    createdAt: createdAt,
    updatedAt: updatedAt,
  );

  factory VoucherModel.fromJson(Map<String, dynamic> json) {
    return VoucherModel(
      id: json['id'],
      userId: json['user_id'],
      date: json['date'],
      costCenterId: json['cost_center_id'],
      payeeType: json['payee_type'],
      payeeOthersName: json['payee_others_name'],
      customerId: json['customer_id'],
      supplierId: json['supplier_id'],
      paidById: json['paid_by_id'],
      description: json['description'],
      totalAmount: json['total_amount'],
      purchaseId: json['purchase_id'],
      attachment: json['attachment'],
      saleId: json['sale_id'],
      approverId: json['approver_id'],
      status: json['status'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'user_id': userId,
      'date': date,
      'cost_center_id': costCenterId,
      'payee_type': payeeType,
      'payee_others_name': payeeOthersName,
      'customer_id': customerId,
      'supplier_id': supplierId,
      'paid_by_id': paidById,
      'description': description,
      'total_amount': totalAmount,
      'purchase_id': purchaseId,
      'attachment': attachment,
      'sale_id': saleId,
      'approver_id': approverId,
      'status': status,
      'created_at': createdAt,
      'updated_at': updatedAt,
    };
  }
}

