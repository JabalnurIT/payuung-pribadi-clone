import 'package:equatable/equatable.dart';

class Company extends Equatable {
  const Company({
    required this.id,
    required this.name,
    this.address,
    this.department,
    this.workDuration,
  });

  const Company.empty({String? id})
      : id = id ?? "1",
        name = 'PT. Maju Mundur',
        address = 'Jl. Kaliurang KM 5',
        department = 'IT',
        workDuration = '8 hours';

  final String id;
  final String name;
  final String? address;
  final String? department;
  final String? workDuration;

  @override
  List<Object?> get props => [
        id,
        name,
        address,
        department,
        workDuration,
      ];

  @override
  String toString() {
    return 'Item{id: $id, name: $name, address: $address, '
        'department: $department, workDuration: $workDuration}';
  }
}
