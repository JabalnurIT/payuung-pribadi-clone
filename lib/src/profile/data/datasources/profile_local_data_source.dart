import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:payung_pribadi_clone/core/services/database_helper.dart';
import 'package:payung_pribadi_clone/core/utils/typedef.dart';

import '../../../../core/errors/exceptions.dart';
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
      // await _databaseHelper.open(name: dbName);
      final result = await _imagePicker.pickImage(
        source: imageSource,
        imageQuality: 100,
        maxWidth: 1024,
      );

      if (result == null) {
        throw ServerException(
            message: "$imageSource can't be accessed", statusCode: 400);
      }

      final file = File(result.path);
      final bytes = await file.readAsBytes();
      final base64 = base64Encode(bytes);

      if (!await _databaseHelper.checkTable(table: "user")) {
        await _databaseHelper.initTable();
        if (!await _databaseHelper.checkTable(table: "user")) {
          throw const ServerException(
              message: "User table not found", statusCode: 404);
        }
      }

      // check if user already exists
      DataMap user = await _databaseHelper.get(table: "user", id: "0");

      if (user.isEmpty) {
        await _databaseHelper.insert(
          table: "user",
          data: LocalUserModel.empty().toMap(),
        );
        if ((await _databaseHelper.get(table: "user", id: "0")).isEmpty) {
          throw const ServerException(
              message: "User not found", statusCode: 404);
        }
      }

      await _databaseHelper.update(
        table: "user",
        data: {"registrationImage": base64},
      );

      user = await _databaseHelper.get(table: "user", id: "0");

      if (user.isEmpty) {
        throw const ServerException(message: "User not found", statusCode: 404);
      }

      await _databaseHelper.close();

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
      if (!await _databaseHelper.checkTable(table: "user")) {
        await _databaseHelper.initTable();
        if (!await _databaseHelper.checkTable(table: "user")) {
          throw const ServerException(
              message: "User table not found", statusCode: 404);
        }
      }

      final user = await _databaseHelper.get(table: "user", id: "0");

      if (user.isEmpty) {
        throw const ServerException(message: "User not found", statusCode: 404);
      }
      await _databaseHelper.close();

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
      if (!await _databaseHelper.checkTable(table: "user")) {
        await _databaseHelper.initTable();
        if (!await _databaseHelper.checkTable(table: "user")) {
          throw const ServerException(
              message: "User table not found", statusCode: 404);
        }
      }

      await _databaseHelper.update(
        table: "user",
        data: user.toMap(),
      );

      await _databaseHelper.close();
      return user;
    } on ServerException {
      rethrow;
    } catch (e, s) {
      debugPrintStack(stackTrace: s);
      throw ServerException(message: e.toString(), statusCode: 505);
    }
  }
}
