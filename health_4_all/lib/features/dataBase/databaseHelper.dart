import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:health_4_all/features/formElegibility/form_elegibility_model.dart';
import 'package:health_4_all/features/attachPage/attach_page_model.dart';

class DatabaseHelper {
  static final _databaseName = "health4all.db";
  static final _databaseVersion = 1;
  static final table = 'formData';
  static final columnId = 'id';
  static final columnNomeCompleto = 'nomeCompleto';
  static final columnNumeroCpf = 'numeroCpf';
  static final columnEmail = 'email';
  static final columnNomeRua = 'nomeRua';
  static final columnNumeroResidencial = 'numeroResidencial';
  static final columnCidade = 'cidade';
  static final columnEstado = 'estado';
  static final attachTable = 'attachFormData';
  static final attachColumnMobilityDifficulty = 'mobilityDifficulty';
  static final attachColumnSelectedCategories = 'selectedCategories';
  static final attachColumnLoadedDocumentName = 'loadedDocumentName';
  static final attachColumnAgreedToTerms = 'agreedToTerms';

  DatabaseHelper._privateConstructor();
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initDatabase();
    return _database!;
  }

  _initDatabase() async {
    String path = join(await getDatabasesPath(), _databaseName);
    return await openDatabase(path,
        version: _databaseVersion, onCreate: _onCreate);
  }

  Future _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE $table (
        $columnId INTEGER PRIMARY KEY,
        $columnNomeCompleto TEXT NOT NULL,
        $columnNumeroCpf TEXT NOT NULL,
        $columnEmail TEXT NOT NULL,
        $columnNomeRua TEXT NOT NULL,
        $columnNumeroResidencial TEXT NOT NULL,
        $columnCidade TEXT NOT NULL,
        $columnEstado TEXT NOT NULL
      )
    ''');

    await db.execute('''
      CREATE TABLE $attachTable (
        $attachColumnMobilityDifficulty TEXT PRIMARY KEY,
        $attachColumnSelectedCategories TEXT NOT NULL,
        $attachColumnLoadedDocumentName TEXT,
        $attachColumnAgreedToTerms INTEGER NOT NULL
      )
    ''');
  }

  Future<int> insertFormData(UserInfo formData) async {
    Database db = await instance.database;
    return await db.insert(table, formData.toMap());
  }
}
