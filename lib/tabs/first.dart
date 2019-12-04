import 'package:flutter/material.dart';

class First extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.symmetric(vertical: 8.0),
      children: _buildContactsList(),
    );
  }

  List<Widget> _buildContactsList() {
    var _modal = [
      {"name": "tina", "age": 22},
      {"name": "john", "age": 22},
    ];
    return _modal
        .map((contact) => ListTile(title: Text(contact['name'])))
        .toList();
  }
}
