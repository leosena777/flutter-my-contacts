import 'package:flutter/material.dart';
import 'package:my_contacts/database/dao/contacts.dart';
import 'package:my_contacts/models/contact.dart';
import 'package:my_contacts/screens/contact_form.dart';

class ContatctsList extends StatefulWidget {
  const ContatctsList({Key? key}) : super(key: key);

  @override
  State<ContatctsList> createState() => _ContatctsListState();
}

class _ContatctsListState extends State<ContatctsList> {
  final ContactDao _contactDao = ContactDao();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Contatos"),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 20, left: 15, right: 15),
        child: FutureBuilder<List<Contact>>(
          future: _contactDao.findAll(),
          initialData: const [],
          builder: (context, snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.none:
                break;
              case ConnectionState.waiting:
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const CircularProgressIndicator(),
                      Text("Carregando...",
                          style: TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontSize: 24,
                          )),
                    ],
                  ),
                );
              case ConnectionState.active:
                break;
              case ConnectionState.done:
                final List<Contact> contacts = snapshot.data as List<Contact>;
                return ListView.builder(
                  itemBuilder: (context, index) {
                    final Contact contact = contacts[index];
                    return ContactItem(contact: contact);
                  },
                  itemCount: contacts.length,
                );
            }

            return const Text('Erro ao carregar a lista');
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context)
              .push(MaterialPageRoute(
                builder: (context) => const ContactForm(),
              ))
              .then((value) => {setState(() {})});
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

class ContactItem extends StatelessWidget {
  final Contact contact;

  const ContactItem({Key? key, required this.contact}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(
          contact.name,
          style: const TextStyle(fontSize: 24),
        ),
        subtitle: Text(
          contact.phone,
          style: const TextStyle(fontSize: 16),
        ),
      ),
    );
  }
}
