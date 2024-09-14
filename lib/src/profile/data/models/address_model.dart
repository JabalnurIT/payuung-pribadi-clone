import '../../../../core/utils/typedef.dart';
import '../../domain/entities/address.dart';

class AddressModel extends Address {
  const AddressModel({
    required super.id,
    required super.street,
    super.province,
    super.regency,
    super.district,
    super.village,
    super.postalCode,
  });

  const AddressModel.empty({String? id})
      : this(
          id: id ?? '1',
          street: 'Jl. Kaliurang KM 5',
          province: 'DI Yogyakarta',
          regency: 'Sleman',
          district: 'Ngaglik',
          village: 'Sinduharjo',
          postalCode: '55581',
        );

  AddressModel copyWith({
    String? id,
    String? street,
    String? province,
    String? regency,
    String? district,
    String? village,
    String? postalCode,
  }) {
    return AddressModel(
      id: id ?? this.id,
      street: street ?? this.street,
      province: province ?? this.province,
      regency: regency ?? this.regency,
      district: district ?? this.district,
      village: village ?? this.village,
      postalCode: postalCode ?? this.postalCode,
    );
  }

  AddressModel.fromMap(DataMap map)
      : super(
          id: map['id'] as String,
          street: map['street'] as String,
          province: map['province'] as String?,
          regency: map['regency'] as String?,
          district: map['district'] as String?,
          village: map['village'] as String?,
          postalCode: map['postalCode'] as String?,
        );

  AddressModel.fromEntity(Address address)
      : super(
          id: address.id,
          street: address.street,
          province: address.province,
          regency: address.regency,
          district: address.district,
          village: address.village,
          postalCode: address.postalCode,
        );

  DataMap toMap() {
    return {
      'id': id,
      'street': street,
      'province': province,
      'regency': regency,
      'district': district,
      'village': village,
      'postalCode': postalCode,
    };
  }
}
