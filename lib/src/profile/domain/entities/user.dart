import 'package:equatable/equatable.dart';

import 'address.dart';
import 'company.dart';
import 'financial.dart';

class LocalUser extends Equatable {
  const LocalUser({
    required this.id,
    required this.name,
    required this.birthDate,
    required this.gender,
    required this.email,
    required this.phoneNumber,
    this.education,
    this.maritalStatus,
    this.registrationImage,
    this.registrationId,
    this.registrationAddress,
    this.domicileAddress,
    this.companyInformation,
    this.financialInformation,
    this.wishlist,
    this.cart,
  });

  LocalUser.empty({String? id})
      : id = id ?? "1",
        name = 'Budi',
        birthDate = '1990-01-01',
        gender = 'Laki-laki',
        email = 'example@gmail.com',
        phoneNumber = '081234567890',
        education = null,
        maritalStatus = null,
        registrationImage = null,
        registrationId = null,
        registrationAddress = const Address.empty(),
        domicileAddress = const Address.empty(),
        companyInformation = const Company.empty(),
        financialInformation = const Financial.empty(),
        wishlist = [],
        cart = [];

  final String id;
  final String name;
  final String birthDate;
  final String gender;
  final String email;
  final String phoneNumber;
  final String? education;
  final String? maritalStatus;
  final String? registrationImage;
  final String? registrationId;
  final Address? registrationAddress;
  final Address? domicileAddress;
  final Company? companyInformation;
  final Financial? financialInformation;
  final List<String>? wishlist;
  final List<String>? cart;

  @override
  List<Object?> get props => [
        id,
        name,
        birthDate,
        gender,
        email,
        phoneNumber,
        education,
        maritalStatus,
        registrationImage,
        registrationId,
        registrationAddress,
        domicileAddress,
        companyInformation,
        financialInformation,
        wishlist,
        cart,
      ];

  @override
  String toString() {
    return 'Item{id: $id, name: $name, birthDate: $birthDate, '
        'gender: $gender, email: $email, phoneNumber: $phoneNumber, '
        'education: $education, maritalStatus: $maritalStatus, '
        'registrationImage: $registrationImage, registrationId: $registrationId, '
        'registrationAddress: $registrationAddress, '
        'domicileAddress: $domicileAddress, companyInformation: $companyInformation, '
        'financialInformation: $financialInformation, wishlist: $wishlist, cart: $cart}';
  }
}
