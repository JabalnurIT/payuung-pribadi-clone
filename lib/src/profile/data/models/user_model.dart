import '../../../../core/utils/typedef.dart';
import '../../domain/entities/user.dart';
import 'address_model.dart';
import 'company_modal.dart';
import 'financial_model.dart';

class LocalUserModel extends LocalUser {
  const LocalUserModel({
    required super.id,
    required super.name,
    required super.birthDate,
    required super.gender,
    required super.email,
    required super.phoneNumber,
    super.education,
    super.maritalStatus,
    super.registrationImage,
    super.registrationAddress,
    super.domicileAddress,
    super.companyInformation,
    super.financialInformation,
    super.wishlist,
    super.cart,
  });

  LocalUserModel.empty({String? id})
      : this(
          id: id ?? '1',
          name: 'Budi',
          birthDate: '1990-01-01',
          gender: 'Laki-laki',
          email: 'example@gmail.com',
          phoneNumber: '081234567890',
          education: null,
          maritalStatus: null,
          registrationImage: null,
          registrationAddress: const AddressModel.empty(),
          domicileAddress: const AddressModel.empty(),
          companyInformation: const CompanyModel.empty(),
          financialInformation: const FinancialModel.empty(),
          wishlist: [],
          cart: [],
        );

  LocalUserModel copyWith({
    String? id,
    String? name,
    String? birthDate,
    String? gender,
    String? email,
    String? phoneNumber,
    String? education,
    String? maritalStatus,
    String? registrationImage,
    AddressModel? registrationAddress,
    AddressModel? domicileAddress,
    CompanyModel? companyInformation,
    FinancialModel? financialInformation,
    List<String>? wishlist,
    List<String>? cart,
  }) {
    return LocalUserModel(
      id: id ?? this.id,
      name: name ?? this.name,
      birthDate: birthDate ?? this.birthDate,
      gender: gender ?? this.gender,
      email: email ?? this.email,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      education: education ?? this.education,
      maritalStatus: maritalStatus ?? this.maritalStatus,
      registrationImage: registrationImage ?? this.registrationImage,
      registrationAddress: registrationAddress ?? this.registrationAddress,
      domicileAddress: domicileAddress ?? this.domicileAddress,
      companyInformation: companyInformation ?? this.companyInformation,
      financialInformation: financialInformation ?? this.financialInformation,
      wishlist: wishlist ?? this.wishlist,
      cart: cart ?? this.cart,
    );
  }

  LocalUserModel.fromMap(DataMap map)
      : super(
          id: map['id'] as String,
          name: map['name'] as String,
          birthDate: map['birthDate'] as String,
          gender: map['gender'] as String,
          email: map['email'] as String,
          phoneNumber: map['phoneNumber'] as String,
          education: map['education'] as String?,
          maritalStatus: map['maritalStatus'] as String?,
          registrationImage: map['registrationImage'] as String?,
          registrationAddress:
              AddressModel.fromMap(map['registrationAddress'] as DataMap),
          domicileAddress:
              AddressModel.fromMap(map['domicileAddress'] as DataMap),
          companyInformation:
              CompanyModel.fromMap(map['companyInformation'] as DataMap),
          financialInformation:
              FinancialModel.fromMap(map['financialInformation'] as DataMap),
          wishlist: (map['wishlist'] as List?) == null
              ? null
              : (map['wishlist'] as List).map((e) => e as String).toList(),
          cart: (map['cart'] as List?) == null
              ? null
              : (map['cart'] as List).map((e) => e as String).toList(),
        );

  LocalUserModel.fromEntity(LocalUser user)
      : super(
          id: user.id,
          name: user.name,
          birthDate: user.birthDate,
          gender: user.gender,
          email: user.email,
          phoneNumber: user.phoneNumber,
          education: user.education,
          maritalStatus: user.maritalStatus,
          registrationImage: user.registrationImage,
          registrationAddress: user.registrationAddress != null
              ? AddressModel.fromEntity(user.registrationAddress!)
              : null,
          domicileAddress: user.domicileAddress != null
              ? AddressModel.fromEntity(user.domicileAddress!)
              : null,
          companyInformation: user.companyInformation != null
              ? CompanyModel.fromEntity(user.companyInformation!)
              : null,
          financialInformation: user.financialInformation != null
              ? FinancialModel.fromEntity(user.financialInformation!)
              : null,
          wishlist: user.wishlist,
          cart: user.cart,
        );

  DataMap toMap() {
    return {
      'id': id,
      'name': name,
      'birthDate': birthDate,
      'gender': gender,
      'email': email,
      'phoneNumber': phoneNumber,
      'education': education,
      'maritalStatus': maritalStatus,
      'registrationImage': registrationImage,
      'registrationAddress':
          AddressModel.fromEntity(registrationAddress!).toMap(),
      'domicileAddress': AddressModel.fromEntity(domicileAddress!).toMap(),
      'companyInformation':
          CompanyModel.fromEntity(companyInformation!).toMap(),
      'financialInformation':
          FinancialModel.fromEntity(financialInformation!).toMap(),
      'wishlist': wishlist,
      'cart': cart,
    };
  }
}
