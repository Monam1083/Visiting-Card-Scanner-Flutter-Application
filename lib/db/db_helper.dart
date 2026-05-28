import "package:path/path.dart" as p;
import "package:sqflite/sqflite.dart";
import "package:visting_card_scanner_application/model/contact_models.dart";

class DbHelper {
  final String _createTableContact =
      '''create Table $tableContact(
  $tblContactColId integer primary key autoincrement,
  $tblContactColName text,
  $tblContactColMobile text,
  $tblContactColEmail text,
  $tblContactColAddress text,
  $tblContactColCompany text,
  $tblContactColDesignation text,
  $tblContactColWebsite text,
  $tblContactColImage text,
  $tblContactColFavourite integer)''';

  Future<Database> _open() async {
    final root = await getDatabasesPath();
    final dbPath = p.join(root, "contact.db");
    return openDatabase(
      dbPath,
      version: 3,
      onCreate: (db, version) {
        db.execute(_createTableContact);
      },
      onUpgrade: (db, oldversion, newversion) async {
        await db.execute("drop table if exists $tableContact");
        await db.execute(_createTableContact);
      },
    );
  }

  Future<int> insertContact(ContactModels contactModel) async {
    final db = await _open();
    return db.insert(tableContact, contactModel.toMap());
  }

  Future<List<ContactModels>> getAllContacts() async {
    final db = await _open();
    final mapList = await db.query(tableContact);
    return List.generate(
      mapList.length,
      (index) => ContactModels.fromMap(mapList[index]),
    );
  }

  Future<ContactModels> getContactById(int id) async {
    final db = await _open();
    final mapList = await db.query(
      tableContact,
      where: "$tblContactColId=?",
      whereArgs: [id],
    );
    return ContactModels.fromMap(mapList.first);
  }

  Future<List<ContactModels>> getAllFavouriteContacts() async {
    final db = await _open();
    final mapList = await db.query(
      tableContact,
      where: "$tblContactColFavourite=?",
      whereArgs: [1],
    );
    return List.generate(
      mapList.length,
      (index) => ContactModels.fromMap(mapList[index]),
    );
  }

  Future<int> deleteContact(int id) async {
    final db = await _open();
    return db.delete(
      tableContact,
      where: "$tblContactColId=?",
      whereArgs: [id],
    );
  }

  Future<int> updateFavourite(int id, int value) async {
    final db = await _open();
    return db.update(
      tableContact,
      {tblContactColFavourite: value},
      where: "$tblContactColId=?",
      whereArgs: [id],
    );
  }
}
