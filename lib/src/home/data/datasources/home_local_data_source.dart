import 'package:flutter/material.dart';

import '../../../../core/errors/exceptions.dart';
import '../../../../core/services/database_helper.dart';
import '../models/wellness_model.dart';

abstract class HomeLocalDataSource {
  const HomeLocalDataSource();

  Future<List<WellnessModel>> getAllWellness();
}

const dbName = "payung_pribadi.db";

class HomeLocalDataSourceImpl implements HomeLocalDataSource {
  const HomeLocalDataSourceImpl({
    required DatabaseHelper databaseHelper,
  }) : _databaseHelper = databaseHelper;

  final DatabaseHelper _databaseHelper;

  @override
  Future<List<WellnessModel>> getAllWellness() async {
    try {
      final wellnesses = await _databaseHelper.getAll(table: "wellness");

      if (wellnesses.isEmpty) {
        throw const ServerException(
            message: "Wellness not found", statusCode: 404);
      }

      return wellnesses.map((e) => WellnessModel.fromMap(e)).toList();
    } on ServerException {
      rethrow;
    } catch (e, s) {
      debugPrintStack(stackTrace: s);
      throw ServerException(message: e.toString(), statusCode: 505);
    }
  }
}
