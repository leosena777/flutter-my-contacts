import 'package:flutter/material.dart';
import 'package:my_contacts/screens/contact_form.dart';

class ContatctsList extends StatelessWidget {
  const ContatctsList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Contatos"),
      ),
      body: ListView(
        children: const [
          Card(
            child: ListTile(
              title: Text("Leandro", style: TextStyle(fontSize: 24)),
              subtitle:
                  Text("+55 (11) 99999-9999", style: TextStyle(fontSize: 16)),
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context)
              .push(MaterialPageRoute(
                builder: (context) => ContactForm(),
              ))
              .then((value) => print(value.toString()));
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
