import 'package:flutter/material.dart';

import '../models/contact.dart';
import '../widgets/date_picker_field.dart';
import '../widgets/word_form_field.dart';

class AddContactScreen extends StatefulWidget {
  final List<Contact> contacts;

  AddContactScreen({this.contacts});

  @override
  _AddContactScreenState createState() => _AddContactScreenState();
}

class _AddContactScreenState extends State<AddContactScreen> {
  final formKey = GlobalKey<FormState>();

  String _name = '';
  DateTime _contactNextAt;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Contact'),
        elevation: 0.0,
        actions: <Widget>[
          _buildSaveButton(context),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 24.0),
        child: Form(
          key: formKey,
          child: Column(
            children: <Widget>[
              WordFormField(
                labelText: 'Name',
                onSaved: (val) => _name = val,
              ),
              Container(margin: EdgeInsets.only(bottom: 16.0)),
              DatePickerField(
                title: 'Contact next at',
                onDateSelected: (selected) => _contactNextAt = selected,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSaveButton(BuildContext context) {
    return FlatButton(
      child: Text('Save'),
      textColor: Colors.white,
      onPressed: () {
        formKey.currentState.save();

        widget.contacts.add(Contact(
          name: _name,
          contactNextAt: _contactNextAt,
        ));

        Navigator.pop(context);
      },
    );
  }
}
