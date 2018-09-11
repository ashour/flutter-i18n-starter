import 'package:flutter/material.dart';

import '../models/contact.dart';

class ContactListItem extends StatelessWidget {
  final Contact contact;

  ContactListItem({this.contact});

  String get _formattedDate {
    final date = contact.contactNextAt;

    return '${date.year}/${date.month}/${date.day}';
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      key: Key(contact.name),
      children: <Widget>[
        ListTile(
          title: Text(contact.name),
          subtitle: Text('Contact next $_formattedDate'),
        ),
        Divider(),
      ],
    );
  }
}
