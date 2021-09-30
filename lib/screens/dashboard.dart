import 'package:flutter/material.dart';
import 'package:my_contacts/screens/contacts_list.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Meus contatos"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            'images/book.png',
            fit: BoxFit.fitWidth,
            width: 1200,
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(15, 0, 0, 30),
            child: Material(
              color: Colors.blueGrey[600],
              child: InkWell(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const ContatctsList()));
                },
                child: Container(
                  padding: const EdgeInsets.all(12.0),
                  width: 150,
                  height: 100,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Icon(Icons.people, color: Colors.white, size: 32),
                      Text("Contacts",
                          style: TextStyle(color: Colors.white, fontSize: 20)),
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
