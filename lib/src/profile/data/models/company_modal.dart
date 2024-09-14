import '../../../../core/utils/typedef.dart';
import '../../domain/entities/company.dart';

class CompanyModel extends Company {
  const CompanyModel({
    required super.id,
    required super.name,
    super.address,
    super.department,
    super.workDuration,
  });

  const CompanyModel.empty({String? id})
      : this(
          id: id ?? '1',
          name: 'PT. Maju Mundur',
          address: 'Jl. Kaliurang KM 5',
          department: 'IT',
          workDuration: '8 hours',
        );

  CompanyModel copyWith({
    String? id,
    String? name,
    String? address,
    String? department,
    String? workDuration,
  }) {
    return CompanyModel(
      id: id ?? this.id,
      name: name ?? this.name,
      address: address ?? this.address,
      department: department ?? this.department,
      workDuration: workDuration ?? this.workDuration,
    );
  }

  CompanyModel.fromMap(DataMap map)
      : super(
          id: map['id'] as String,
          name: map['name'] as String,
          address: map['address'] as String?,
          department: map['department'] as String?,
          workDuration: map['workDuration'] as String?,
        );

  CompanyModel.fromEntity(Company company)
      : super(
          id: company.id,
          name: company.name,
          address: company.address,
          department: company.department,
          workDuration: company.workDuration,
        );

  DataMap toMap() {
    return {
      'id': id,
      'name': name,
      'address': address,
      'department': department,
      'workDuration': workDuration,
    };
  }
}
