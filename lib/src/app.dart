import 'package:flutter/material.dart';

import 'screens/add_contact_screen.dart';
import 'screens/home_screen.dart';
import 'shared_state/contacts_provider.dart';

class App extends StatelessWidget {
  static const String title = 'Stay in Touch (i18n Demo)';

  @override
  Widget build(BuildContext context) {
    return ContactsProvider(
      child: MaterialApp(
        title: title,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        onGenerateRoute: _getCurrentRoute,
      ),
    );
  }

  MaterialPageRoute _getCurrentRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/add':
        return MaterialPageRoute(
          builder: (context) =>
              AddContactScreen(contacts: ContactsProvider.of(context)),
        );

      default:
        return MaterialPageRoute(
          builder: (context) => HomeScreen(
                title: title,
                contacts: ContactsProvider.of(context),
              ),
        );
    }
  }
}
