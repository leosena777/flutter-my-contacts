import 'package:my_contacts/database/config.dart';
import 'package:my_contacts/models/contact.dart';
import 'package:sqflite/sqflite.dart';

class ContactDao {
  static const String tableName = 'contacts';
  static const tableSql =
      'CREATE TABLE $tableName (id INTEGER PRIMARY KEY, name TEXT, phone TEXT)';
  static const _id = 'id';
  static const _name = 'name';
  static const _phone = 'phone';

  Future<int> save(Contact contact) async {
    final Database db = await createDatabase();
    Map<String, dynamic> contactMap = _toMap(contact);

    return db.insert(tableName, contactMap);
  }

  Map<String, dynamic> _toMap(Contact contact) {
    final Map<String, dynamic> contactMap = <String, dynamic>{};
    contactMap[_id] = contact.id;
    contactMap[_name] = contact.name;
    contactMap[_phone] = contact.phone;
    return contactMap;
  }

  Future<List<Contact>> findAll() async {
    final Database db = await createDatabase();
    final List<Map<String, Object?>> result =
        await db.query(tableName, orderBy: _name);
    List<Contact> contacts = _toList(result);

    return contacts;
  }

  List<Contact> _toList(List<Map<String, Object?>> result) {
    final List<Contact> contacts = [];

    for (Map<String, dynamic> row in result) {
      final Contact contact = Contact(
        id: row[_id],
        name: row[_name],
        phone: row[_phone],
      );
      contacts.add(contact);
    }
    return contacts;
  }
}
