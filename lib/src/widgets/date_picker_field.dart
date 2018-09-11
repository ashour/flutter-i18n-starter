import 'package:flutter/material.dart';

class DatePickerField extends StatefulWidget {
  final String title;
  final void Function(DateTime) onDateSelected;

  DatePickerField({this.title, this.onDateSelected});

  @override
  _DatePickerFieldState createState() {
    return _DatePickerFieldState();
  }
}

class _DatePickerFieldState extends State<DatePickerField> {
  DateTime _selectedDateTime;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              widget.title,
              style: TextStyle(
                fontSize: 16.0,
                color: Colors.grey[600],
                fontWeight: FontWeight.w400,
              ),
            ),
            IconButton(
              icon: Icon(Icons.calendar_today),
              color: Colors.grey[600],
              onPressed: _showDatePicker,
            ),
          ],
        ),
        Text(_selectedDateTime != null ? _selectedDateTime.toString() : ''),
      ],
    );
  }

  _showDatePicker() {
    final now = DateTime.now();

    showDatePicker(
      context: context,
      initialDate: now,
      firstDate: now,
      // set maximum date, somewhat arbitrarily,
      // at ~5 years from today
      lastDate: now.add(Duration(days: 365 * 5)),
    ).then((selected) {
      setState(() {
        _selectedDateTime = selected;
      });

      widget.onDateSelected(selected);
    });
  }
}