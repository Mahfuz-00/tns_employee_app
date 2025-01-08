import '../../Domain/Entities/voucher_form_entities.dart';

class VoucherFormModel extends VoucherFormEntity {
  VoucherFormModel({
    required dynamic date,
    required dynamic costCenterId,
    required dynamic description,
    required dynamic paidStatus,
    required List<String> accountIds,
    required List<double> amounts,
    dynamic attachment,
  }) : super(
    date: date,
    costCenterId: costCenterId,
    description: description,
    accountIds: accountIds,
    paidStatus: paidStatus,
    amounts: amounts,
    attachment: attachment,
  );

  factory VoucherFormModel.fromJson(Map<String, dynamic> json) {
    return VoucherFormModel(
      date: DateTime.parse(json['date']),
      costCenterId: json['cost_center_id'],
      description: json['description'],
      paidStatus: json['paid_status'],
      accountIds: List<String>.from(json['account_ids']),
      amounts: List<double>.from(json['amounts']),
      attachment: json['attachment'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'date': date.toIso8601String(),
      'cost_center_id': costCenterId,
      'description': description,
      'paid_status': paidStatus,
      'account_ids': accountIds,
      'amounts': amounts,
      'attachment': attachment,
    };
  }

  VoucherFormEntity toEntity() {
    return VoucherFormEntity(
      date: date,
      costCenterId: costCenterId,
      description: description,
      paidStatus: paidStatus,
      accountIds: accountIds,
      amounts: amounts,
      attachment: attachment,
    );
  }

  static VoucherFormModel fromEntity(VoucherFormEntity entity) {
    return VoucherFormModel(
      date: entity.date,
      costCenterId: entity.costCenterId,
      description: entity.description,
      paidStatus: entity.paidStatus,
      accountIds: entity.accountIds,
      amounts: entity.amounts,
      attachment: entity.attachment,
    );
  }
}
