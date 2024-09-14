import 'package:equatable/equatable.dart';

class Financial extends Equatable {
  const Financial({
    required this.id,
    required this.incomeResourch,
    this.annualIncome,
    this.bankName,
    this.bankBranch,
    this.accountNumber,
    this.accountName,
  });

  const Financial.empty({String? id})
      : id = id ?? "1",
        incomeResourch = 'Gaji',
        annualIncome = 10000000,
        bankName = 'BCA',
        bankBranch = 'Yogyakarta',
        accountNumber = '1234567890123456',
        accountName = 'Budi';

  final String id;
  final String incomeResourch;
  final double? annualIncome;
  final String? bankName;
  final String? bankBranch;
  final String? accountNumber;
  final String? accountName;

  @override
  List<Object?> get props => [
        id,
        incomeResourch,
        annualIncome,
        bankName,
        bankBranch,
        accountNumber,
        accountName,
      ];

  @override
  String toString() {
    return 'Item{id: $id, incomeResourch: $incomeResourch, annualIncome: $annualIncome, '
        'bankName: $bankName, bankBranch: $bankBranch, accountNumber: $accountNumber, '
        'accountName: $accountName}';
  }
}
