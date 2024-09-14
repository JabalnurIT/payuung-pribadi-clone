import '../../../../core/utils/typedef.dart';
import '../../domain/entities/financial.dart';

class FinancialModel extends Financial {
  const FinancialModel({
    required super.id,
    required super.incomeResourch,
    super.annualIncome,
    super.bankName,
    super.bankBranch,
    super.accountNumber,
    super.accountName,
  });

  const FinancialModel.empty({String? id})
      : this(
          id: id ?? '1',
          incomeResourch: 'Gaji',
          annualIncome: 10000000,
          bankName: 'BCA',
          bankBranch: 'Yogyakarta',
          accountNumber: '1234567890123456',
          accountName: 'Budi',
        );

  FinancialModel copyWith({
    String? id,
    String? incomeResourch,
    double? annualIncome,
    String? bankName,
    String? bankBranch,
    String? accountNumber,
    String? accountName,
  }) {
    return FinancialModel(
      id: id ?? this.id,
      incomeResourch: incomeResourch ?? this.incomeResourch,
      annualIncome: annualIncome ?? this.annualIncome,
      bankName: bankName ?? this.bankName,
      bankBranch: bankBranch ?? this.bankBranch,
      accountNumber: accountNumber ?? this.accountNumber,
      accountName: accountName ?? this.accountName,
    );
  }

  FinancialModel.fromMap(DataMap map)
      : super(
          id: map['id'] as String,
          incomeResourch: map['incomeResourch'] as String,
          annualIncome: map['annualIncome'].runtimeType == double
              ? map['annualIncome'] as double?
              : map['annualIncome'].toDouble() as double,
          bankName: map['bankName'] as String?,
          bankBranch: map['bankBranch'] as String?,
          accountNumber: map['accountNumber'] as String?,
          accountName: map['accountName'] as String?,
        );

  FinancialModel.fromEntity(Financial financial)
      : super(
          id: financial.id,
          incomeResourch: financial.incomeResourch,
          annualIncome: financial.annualIncome,
          bankName: financial.bankName,
          bankBranch: financial.bankBranch,
          accountNumber: financial.accountNumber,
          accountName: financial.accountName,
        );

  DataMap toMap() {
    return {
      'id': id,
      'incomeResourch': incomeResourch,
      'annualIncome': annualIncome,
      'bankName': bankName,
      'bankBranch': bankBranch,
      'accountNumber': accountNumber,
      'accountName': accountName,
    };
  }
}
