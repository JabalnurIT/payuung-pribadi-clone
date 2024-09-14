import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';

import '../../../../core/errors/exceptions.dart';
import '../models/wellness_model.dart';

abstract class HomeLocalDataSource {
  const HomeLocalDataSource();

  Future<List<WellnessModel>> getAllWellness();
}

const dbName = "payung_pribadi.db";

class HomeLocalDataSourceImpl implements HomeLocalDataSource {
  const HomeLocalDataSourceImpl();

  @override
  Future<List<WellnessModel>> getAllWellness() async {
    try {
      final db = await openDatabase(dbName);

      final result = await db.query(
        "wellness",
      );

      if (result.isEmpty) {
        throw const ServerException(
            message: "Wellness not found", statusCode: 404);
      }

      await db.close();

      return result.map((e) => WellnessModel.fromMap(e)).toList();
    } on ServerException {
      rethrow;
    } catch (e, s) {
      debugPrintStack(stackTrace: s);
      throw ServerException(message: e.toString(), statusCode: 505);
    }
  }
}
