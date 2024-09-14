import 'package:equatable/equatable.dart';

class Address extends Equatable {
  const Address({
    required this.id,
    required this.street,
    this.province,
    this.regency,
    this.district,
    this.village,
    this.postalCode,
  });

  const Address.empty({String? id})
      : id = id ?? "1",
        street = 'Jl. Kaliurang KM 5',
        province = 'DI Yogyakarta',
        regency = 'Sleman',
        district = 'Ngaglik',
        village = 'Sinduharjo',
        postalCode = '55581';

  final String id;
  final String street;
  final String? province;
  final String? regency;
  final String? district;
  final String? village;
  final String? postalCode;

  @override
  List<Object?> get props => [
        id,
        street,
        province,
        regency,
        district,
        village,
        postalCode,
      ];

  @override
  String toString() {
    return 'Item{id: $id, street: $street, province: $province, '
        'regency: $regency, district: $district, village: $village, '
        'postalCode: $postalCode}';
  }
}
