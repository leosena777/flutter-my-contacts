import 'package:flutter/material.dart';
import 'package:my_contacts/database/dao/contacts.dart';
import 'package:my_contacts/models/contact.dart';

class ContactForm extends StatefulWidget {
  final Contact? contact;
  ContactForm({Key? key, this.contact}) : super(key: key);

  @override
  State<ContactForm> createState() => _ContactFormState();
}

class _ContactFormState extends State<ContactForm> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final ContactDao _contactDao = ContactDao();

  @override
  Widget build(BuildContext context) {
    final Contact? editContact = widget.contact;
    print("$editContact");

    if (editContact != null) {
      _nameController.text = editContact.name;
      _phoneController.text = editContact.phone;
    }

    return Scaffold(
      appBar: AppBar(
          title: Text(editContact == null ? "Novo Contato" : "Editar Contato")),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: Colors.white,
          ),
          padding: const EdgeInsets.all(24.0),
          height: 300,
          child: Column(
            children: [
              TextField(
                controller: _nameController,
                decoration: const InputDecoration(labelText: 'Nome'),
                style: const TextStyle(fontSize: 24),
              ),
              TextField(
                controller: _phoneController,
                decoration: const InputDecoration(labelText: 'Telefone'),
                style: const TextStyle(fontSize: 24),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 32),
                child: SizedBox(
                  height: 50,
                  width: 150,
                  child: ElevatedButton.icon(
                    onPressed: () {
                      final String name = _nameController.text;
                      final String phone = _phoneController.text;

                      if (name.isNotEmpty && phone.isNotEmpty) {
                        final Contact newContact =
                            Contact(name: name, phone: phone);

                        if (editContact != null) {
                          newContact.id = editContact.id;
                          _contactDao
                              .update(newContact)
                              .then((id) => Navigator.pop(context));
                        } else {
                          _contactDao
                              .save(newContact)
                              .then((id) => Navigator.pop(context));
                        }
                      }
                    },
                    label: const Text('Salvar', style: TextStyle(fontSize: 18)),
                    icon: const Icon(Icons.save),
                    style: const ButtonStyle(),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
