class Contact {
  final int? id;
  final String name;
  final String phone;

  Contact({required this.name, required this.phone, this.id});

  @override
  String toString() {
    return 'Contact {name: $name, number: $phone}';
  }
}
