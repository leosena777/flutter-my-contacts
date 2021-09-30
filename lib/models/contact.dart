class Contact {
  final String name;
  final String phone;

  Contact({required this.name, required this.phone});

  @override
  String toString() {
    return 'Contact {name: $name, number: $phone}';
  }
}
