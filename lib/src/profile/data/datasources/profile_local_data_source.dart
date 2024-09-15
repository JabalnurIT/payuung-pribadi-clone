import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:payung_pribadi_clone/core/utils/typedef.dart';

import '../../../../core/errors/exceptions.dart';
import '../../../../core/services/database_helper.dart';
import '../models/address_model.dart';
import '../models/company_modal.dart';
import '../models/financial_model.dart';
import '../models/user_model.dart';

abstract class ProfileLocalDataSource {
  const ProfileLocalDataSource();

  Future<LocalUserModel> addRegistrationImage({
    required ImageSource imageSource,
  });

  Future<LocalUserModel> getProfile();

  Future<LocalUserModel> updateProfile({
    required LocalUserModel user,
  });
}

const dbName = "payung_pribadi.db";

class ProfileLocalDataSourceImpl implements ProfileLocalDataSource {
  const ProfileLocalDataSourceImpl({
    required ImagePicker imagePicker,
    required DatabaseHelper databaseHelper,
  })  : _imagePicker = imagePicker,
        _databaseHelper = databaseHelper;

  final ImagePicker _imagePicker;
  final DatabaseHelper _databaseHelper;

  @override
  Future<LocalUserModel> addRegistrationImage({
    required ImageSource imageSource,
  }) async {
    try {
      // await DatabaseHelper.open(name: dbName);
      final result = await _imagePicker.pickImage(
        source: imageSource,
      );

      if (result == null) {
        throw ServerException(
            message: "$imageSource can't be accessed", statusCode: 400);
      }

      final file = File(result.path);
      final bytes = await file.readAsBytes();
      final base64 = base64Encode(bytes);

      // check if user already exists
      DataMap user = await _databaseHelper.get(table: "user", id: "0");

      await _databaseHelper.update(
        table: "user",
        data: {"registrationImage": base64},
      );

      user = await _databaseHelper.get(table: "user", id: "0");

      if (user.isEmpty) {
        throw const ServerException(message: "User not found", statusCode: 404);
      }

      return LocalUserModel.fromMap(user);
    } on ServerException {
      rethrow;
    } catch (e, s) {
      debugPrintStack(stackTrace: s);
      throw ServerException(message: e.toString(), statusCode: 505);
    }
  }

  @override
  Future<LocalUserModel> getProfile() async {
    try {
      DataMap user = await _databaseHelper.get(table: "user", id: "0");
      final registrationAddress = await _databaseHelper.get(
          table: "address", id: user["registrationAddressId"]);
      final domicileAddress = await _databaseHelper.get(
          table: "address", id: user["domicileAddressId"]);
      final companyInformation = await _databaseHelper.get(
          table: "company", id: user["companyInformationId"]);
      final financialInformation = await _databaseHelper.get(
          table: "financial", id: user["financialInformationId"]);

      user = {
        ...user,
        "registrationAddress": registrationAddress,
        "domicileAddress": domicileAddress,
        "companyInformation": companyInformation,
        "financialInformation": financialInformation,
      };

      if (user.isEmpty) {
        throw const ServerException(message: "User not found", statusCode: 404);
      }

      return LocalUserModel.fromMap(user);
    } on ServerException {
      rethrow;
    } catch (e, s) {
      debugPrintStack(stackTrace: s);
      throw ServerException(message: e.toString(), statusCode: 505);
    }
  }

  @override
  Future<LocalUserModel> updateProfile({required LocalUserModel user}) async {
    try {
      DataMap registrationAddressDatamap =
          AddressModel.fromEntity(user.registrationAddress!).toMap();
      DataMap domicileAddressDatamap =
          AddressModel.fromEntity(user.domicileAddress!).toMap();
      DataMap companyInformationDatamap =
          CompanyModel.fromEntity(user.companyInformation!).toMap();
      DataMap financialInformationDatamap =
          FinancialModel.fromEntity(user.financialInformation!).toMap();

      DataMap userDatamap = {
        ...user.toMap(),
        "registrationAddressId": user.registrationAddress?.id ?? '',
        "domicileAddressId": user.domicileAddress?.id ?? '',
        "companyInformationId": user.companyInformation?.id ?? '',
        "financialInformationId": user.financialInformation?.id ?? '',
      };
      userDatamap.remove("registrationAddress");
      userDatamap.remove("domicileAddress");
      userDatamap.remove("companyInformation");
      userDatamap.remove("financialInformation");

      await _databaseHelper.update(
        table: "user",
        data: userDatamap,
      );

      await _databaseHelper.update(
        table: "address",
        data: registrationAddressDatamap,
      );

      await _databaseHelper.update(
        table: "address",
        data: domicileAddressDatamap,
      );

      await _databaseHelper.update(
        table: "company",
        data: companyInformationDatamap,
      );

      await _databaseHelper.update(
        table: "financial",
        data: financialInformationDatamap,
      );

      return user;
    } on ServerException {
      rethrow;
    } catch (e, s) {
      debugPrintStack(stackTrace: s);
      throw ServerException(message: e.toString(), statusCode: 505);
    }
  }
}
