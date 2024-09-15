import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:payung_pribadi_clone/core/utils/typedef.dart';
import 'package:sqlite3/sqlite3.dart';
import 'package:path/path.dart' as p;

abstract class DatabaseHelper {
  Future<Database> get database;

  // Future<void> initTable();

  Future<bool> checkTable({required String table});

  Future<void> clear({required String table});

  Future<void> insert({required String table, required DataMap data});

  Future<void> update({required String table, required DataMap data});

  Future<void> delete({required String table, required DataMap data});

  Future<DataMap> get({required String table, required String id});

  Future<List<DataMap>> getAll({required String table});
}

class DatabaseHelperImpl implements DatabaseHelper {
  // Buat instance dari DatabaseHelperImpl
  DatabaseHelperImpl.instance();

  static Database? _database;

  @override
  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDb();
    return _database!;
  }

  // Inisialisasi database menggunakan sqlite3
  static Future<Database> _initDb({
    String path = 'payung_pribadi.db',
  }) async {
    Directory appDocDir = await getApplicationDocumentsDirectory();
    String databasePath = p.join(appDocDir.path, path);

    var db = sqlite3.open(databasePath);
    // await deleteAllTable(db);
    await initTable(db);
    return db;
  }

  static void _insertAddress(Database db) {
    db.execute('''
      INSERT INTO address (id, street, province, regency, district, village, postalCode)
      VALUES
        ('0', 'Jl. Raya Bogor KM 28', 'Jawa Barat', 'Bogor', 'Cileungsi', 'Cileungsi', '16820'),
        ('1', 'Jl. Raya Bogor KM 28', 'Jawa Barat', 'Bogor', 'Cileungsi', 'Cileungsi', '16820')
    ''');
  }

  static void _insertCompany(Database db) {
    db.execute('''
      INSERT INTO company (id, name, address, department, workDuration)
      VALUES
        ('0', 'PT. Payung Pribadi', 'Jl. Raya Bogor KM 28', 'Staf', '> 2 Tahun')
    ''');
  }

  static void _insertFinancial(Database db) {
    db.execute('''
      INSERT INTO financial (id, incomeResourch, annualIncome, bankName, bankBranch, accountNumber, accountName)
      VALUES
        ('0', 'Gaji', '> 1 Milyar', 'BCA', 'Bogor', '1234567890', 'Payung Pribadi')
    ''');
  }

  static void _insertUser(Database db) {
    db.execute('''
      INSERT INTO user (
        id, name, birthDate, gender, email, phoneNumber, education, maritalStatus, registrationImage, registrationId, registrationAddressId, domicileAddressId, companyInformationId, financialInformationId, wishlist, cart)
      VALUES
        ('0', 'John Doe', '1990-01-01', 'Laki-laki', 'example@gmail.com', '081234567890', 'S1', 'Belum Kawin', '', '', '0', '1', '0', '0', '', '')
    ''');
  }

// make different insert for wellness
  static void _insertWellness(Database db) {
    db.execute('''
      INSERT INTO wellness (
        id, title, category, price, discount, stock, minimumPurchase, maximumPurchase, description, termAndCondition, outlet)
      VALUES
        ('0', 'Paket Hemat', 'Paket', 100000, 0, 10, 1, 5, 'Paket hemat untuk 5 kali perawatan', 'Tidak bisa diuangkan', 'Bogor'),
        ('1', 'Pulsa 10K', 'Pulsa', 10000, 0, 100, 1, 10, 'Pulsa 10K', 'Tidak bisa diuangkan', 'Bogor'),
        ('2', 'Voucher Belanja', 'Voucher', 50000, 0, 50, 1, 5, 'Voucher belanja 50K', 'Tidak bisa diuangkan', 'Bogor'),
        ('3', 'Paket Hemat', 'Paket', 100000, 0, 10, 1, 5, 'Paket hemat untuk 5 kali perawatan', 'Tidak bisa diuangkan', 'Bogor'),
        ('4', 'Pulsa 10K', 'Pulsa', 10000, 0, 100, 1, 10, 'Pulsa 10K', 'Tidak bisa diuangkan', 'Bogor'),
        ('5', 'Voucher Belanja', 'Voucher', 50000, 0, 50, 1, 5, 'Voucher belanja 50K', 'Tidak bisa diuangkan', 'Bogor'),
        ('6', 'Paket Hemat', 'Paket', 100000, 0, 10, 1, 5, 'Paket hemat untuk 5 kali perawatan', 'Tidak bisa diuangkan', 'Bogor'),
        ('7', 'Pulsa 10K', 'Pulsa', 10000, 0, 100, 1, 10, 'Pulsa 10K', 'Tidak bisa diuangkan', 'Bogor'),
        ('8', 'Voucher Belanja', 'Voucher', 50000, 0, 50, 1, 5, 'Voucher belanja 50K', 'Tidak bisa diuangkan', 'Bogor'),
        ('9', 'Paket Hemat', 'Paket', 100000, 0, 10, 1, 5, 'Paket hemat untuk 5 kali perawatan', 'Tidak bisa diuangkan', 'Bogor'),
        ('10', 'Pulsa 10K', 'Pulsa', 10000, 0, 100, 1, 10, 'Pulsa 10K', 'Tidak bisa diuangkan', 'Bogor'),
        ('11', 'Voucher Belanja', 'Voucher', 50000, 0, 50, 1, 5, 'Voucher belanja 50K', 'Tidak bisa diuangkan', 'Bogor')
    ''');
  }

  static Future<void> deleteAllTable(Database db) async {
    db.execute('DELETE FROM address');
    db.execute('DELETE FROM company');
    db.execute('DELETE FROM financial');
    db.execute('DELETE FROM user');
    db.execute('DELETE FROM wellness');

    db.execute('DROP TABLE IF EXISTS address');
    db.execute('DROP TABLE IF EXISTS company');
    db.execute('DROP TABLE IF EXISTS financial');
    db.execute('DROP TABLE IF EXISTS user');
    db.execute('DROP TABLE IF EXISTS wellness');
  }

  static Future<void> initTable(
    Database db,
  ) async {
    db.execute('''
      CREATE TABLE IF NOT EXISTS address(
        id TEXT PRIMARY KEY NOT NULL,
        street TEXT NOT NULL,
        province TEXT,
        regency TEXT,
        district TEXT,
        village TEXT,
        postalCode TEXT
      )
    ''');

    db.execute('''
      CREATE TABLE IF NOT EXISTS company(
        id TEXT PRIMARY KEY NOT NULL,
        name TEXT NOT NULL,
        address TEXT,
        department TEXT,
        workDuration TEXT
      )
    ''');

    db.execute('''
      CREATE TABLE IF NOT EXISTS financial(
        id TEXT PRIMARY KEY NOT NULL,
        incomeResourch TEXT NOT NULL,
        annualIncome TEXT,
        bankName TEXT,
        bankBranch TEXT,
        accountNumber TEXT,
        accountName TEXT
      )
    ''');

    db.execute('''
      CREATE TABLE IF NOT EXISTS user(
        id TEXT PRIMARY KEY NOT NULL,
        name TEXT NOT NULL,
        birthDate TEXT NOT NULL,
        gender TEXT NOT NULL,
        email TEXT NOT NULL,
        phoneNumber TEXT NOT NULL,
        education TEXT,
        maritalStatus TEXT,
        registrationImage TEXT,
        registrationId TEXT,
        registrationAddressId TEXT,
        domicileAddressId TEXT,
        companyInformationId TEXT,
        financialInformationId TEXT,
        wishlist TEXT,
        cart TEXT
      )
    ''');

    db.execute('''
      CREATE TABLE IF NOT EXISTS wellness(
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

    // check if address table is empty
    final result = db.select('SELECT * FROM address');
    if (result.isEmpty) {
      _insertAddress(db);
      // print('address table is empty');
    }

    // check if company table is empty
    final companyResult = db.select('SELECT * FROM company');
    if (companyResult.isEmpty) {
      _insertCompany(db);
      // print('company table is empty');
    }
    // check if financial table is empty
    final financialResult = db.select('SELECT * FROM financial');
    if (financialResult.isEmpty) {
      _insertFinancial(db);
      // print('financial table is empty');
    }
    // check if user table is empty
    final userResult = db.select('SELECT * FROM user');
    if (userResult.isEmpty) {
      _insertUser(db);
      // print('user table is empty');
    }

    // check if wellness table is empty
    final wellnessResult = db.select('SELECT * FROM wellness');
    if (wellnessResult.isEmpty) {
      _insertWellness(db);
      // print('wellness table is empty');
    }
  }

  @override
  Future<bool> checkTable({required String table}) async {
    final db = await database;
    final result = db.select(
      "SELECT name FROM sqlite_master WHERE type='table' AND name = ?;",
      [table],
    );

    return result.isNotEmpty;
  }

  @override
  Future<void> clear({required String table}) async {
    final db = await database;
    db.execute('DELETE FROM $table');
  }

  @override
  Future<void> insert({required String table, required DataMap data}) async {
    final db = await database;

    var columns = data.keys.join(', ');
    var values = List.generate(data.length, (_) => '?').join(', ');
    var args = data.values.toList();

    db.execute('INSERT INTO $table ($columns) VALUES ($values)', args);
  }

  @override
  Future<void> update({required String table, required DataMap data}) async {
    final db = await database;

    var updates = data.keys.map((key) => '$key = ?').join(', ');
    var args = data.values.toList();
    var id = data['id'];

    db.execute('UPDATE $table SET $updates WHERE id = ?', [...args, id]);
  }

  @override
  Future<void> delete({required String table, required DataMap data}) async {
    final db = await database;
    var id = data['id'];
    db.execute('DELETE FROM $table WHERE id = ?', [id]);
  }

  @override
  Future<DataMap> get({required String table, required String id}) async {
    final db = await database;
    final result = db.select('SELECT * FROM $table WHERE id = ?', [id]);

    return result.first.toDataMap();
  }

  @override
  Future<List<DataMap>> getAll({required String table}) async {
    final db = await database;
    final result = db.select('SELECT * FROM $table');

    return result.map((row) => row.toDataMap()).toList();
  }
}

// Helper extension untuk mengonversi hasil query ke DataMap
extension ResultRowMapper on Row {
  DataMap toDataMap() {
    final row = this;
    final map = <String, dynamic>{};
    for (var i = 0; i < row.length; i++) {
      map[row.keys[i]] = row.values[i];
    }
    return map;
  }
}
