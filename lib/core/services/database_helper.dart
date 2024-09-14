import 'package:payung_pribadi_clone/core/utils/typedef.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

class DatabaseHelper {
  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDb();
    return _database!;
  }

  Future<Database> _initDb({
    String path = 'payung_pribadi.db',
    String databaseRules = '',
  }) async {
    final database = await databaseFactoryFfi.openDatabase(path);
    await database.execute(databaseRules);
    return database;
  }

  Future<void> initTable() async {
    final db = await database;
    await db.execute('''
      CREATE TABLE address(
        id TEXT PRIMARY KEY NOT NULL,
        street TEXT NOT NULL,
        province TEXT,
        regency TEXT,
        district TEXT,
        village TEXT,
        postalCode TEXT
      )
    ''');

    await db.execute('''
      CREATE TABLE company(
        id TEXT PRIMARY KEY NOT NULL,
        name TEXT NOT NULL,
        address TEXT,
        department TEXT,
        workDuration TEXT
      )
    ''');

    await db.execute('''
      CREATE TABLE financial(
        id TEXT PRIMARY KEY NOT NULL,
        incomeResourch TEXT NOT NULL,
        annualIncome REAL,
        bankName TEXT,
        bankBranch TEXT,
        accountNumber TEXT,
        accountName TEXT
      )
    ''');

    await db.execute('''
      CREATE TABLE user(
        id TEXT PRIMARY KEY NOT NULL,
        name TEXT NOT NULL,
        birthDate TEXT NOT NULL,
        gender TEXT NOT NULL,
        email TEXT NOT NULL,
        phoneNumber TEXT NOT NULL,
        education TEXT,
        maritalStatus TEXT,
        registrationImage TEXT,
        registrationAddressId TEXT,
        domicileAddressId TEXT,
        companyInformationId TEXT,
        financialInformationId TEXT,
        wishlist TEXT,
        cart TEXT
      )
    ''');

    await db.execute('''
      CREATE TABLE wellness(
        id TEXT PRIMARY KEY NOT NULL,
        title TEXT NOT NULL,
        category TEXT NOT NULL,
        price REAL NOT NULL,
        discount REAL,
        stock INTEGER NOT NULL,
        minimumPurchase INTEGER NOT NULL,
        maximumPurchase INTEGER NOT NULL,
        description TEXT NOT NULL,
        termAndCondition TEXT,
        outlet TEXT
      )
    ''');
  }

  Future<void> close() async {
    final db = await database;
    await db.close();
  }

  Future<bool> checkTable({
    required String table,
  }) async {
    final db = await database;
    final result =
        await db.query('sqlite_master', where: 'name = ?', whereArgs: [table]);

    return result.isNotEmpty;
  }

  Future<void> clear({required String table}) async {
    final db = await database;
    await db.delete(table);
  }

  Future<void> insert({required String table, required DataMap data}) async {
    final db = await database;
    await db.insert(table, data);
  }

  Future<void> update({required String table, required DataMap data}) async {
    final db = await database;
    await db.update(table, data, where: 'id = ?', whereArgs: [data['id']]);
  }

  Future<void> delete({required String table, required DataMap data}) async {
    final db = await database;
    await db.delete(table, where: 'id = ?', whereArgs: [data['id']]);
  }

  Future<DataMap> get({required String table, required String id}) async {
    final db = await database;
    final result = await db.query(
      table,
      where: 'id = ?',
      whereArgs: [id],
    );

    return result.first;
  }

  Future<List<DataMap>> getAll({required String table}) async {
    final db = await database;
    final result = await db.query(table);

    return result;
  }
}
