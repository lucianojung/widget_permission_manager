library authentication_widget;

import 'package:authentication_widget/authorization.dart';
import 'package:authentication_widget/authorization_widget.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of the application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // title of the app
      title: 'Authorization Widget Demo',
      // home page of the app
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  // constructor
  MyHomePage();

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // set default role for the user
  String _role = 'Admin';
  // create an Authorization object
  Authorization _authorization = Authorization(0, 'Admin only', ['Admin']);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              // shows current role of the user
              'Your current role is $_role',
              style: Theme.of(context).textTheme.headline6,
            ),
            // uses Authorization Widget to evaluate shown information
            // set Duration if you want slower or faster switch, if role changed
            AuthorizationWidget(
              // give role
              // you usually get this from a user- or role-service
              role: _role,
              // give authorization to validate
              auth: _authorization,
              // set child shown if validation is approved
              child: Text(
                'Admin Information',
                style: Theme.of(context).textTheme.headline4,
                textAlign: TextAlign.center,
              ),
              // set alternativeChild shown if validation fails
              // if no alternateChild is set it is been replaced with a SizedBox()
              alternateChild: Text(
                'Guest Information',
                style: Theme.of(context).textTheme.headline4,
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
      // Button to switch roles
      floatingActionButton: ElevatedButton(
        // onPressed event
        onPressed: _switchRole,
        // tesxt of the button
        child: Text('Switch Role'),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  void _switchRole() {
    setState(() {
      // change between roles Admin and Guest
      _role = _role == 'Admin' ? 'Guest' : 'Admin';
    });
  }
}
