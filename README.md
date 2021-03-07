# widget_permission_manager
A Widget to control the child widget based on the accessing role using the app.

<img src="assets/authorization_widget_example.gif" height="600">

## Getting Started

#### Use this package as a library
1. Depend on it
Add this to your package's pubspec.yaml file:
```
dependencies:
  widget_permission_manager: ^0.1.1
```

2. Install it
You can install packages from the command line:

```
$ pub get
or
$ flutter pub get
```

3. Import it
Now in your Dart code, you can use:
```
import 'package:widget_permission_manager/widget_permission_manager.dart';
```

## Example
<div>
  <img src="assets/authorization_widget_example_admin_panel.png" height="600">
  <img src="assets/authorization_widget_example_guest_panel.png" height="600">
</div>

```
import 'package:flutter/material.dart';
import 'package:tuple/tuple.dart';
import 'package:widget_permission_manager/authorization.dart';
import 'package:widget_permission_manager/authorization_widget.dart';

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
  Authorization _authorizationAdmin = Authorization(0, 'Admin only', ['Admin']);
  Authorization _authorizationAll = Authorization(0, 'Guest', ['Admin', 'Guest']);

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
              // set children shown if validation is approved
              children: [
                Tuple2(
                  _authorizationAdmin,
                  Text(
                    'Admin Information',
                    style: Theme.of(context).textTheme.headline4,
                    textAlign: TextAlign.center,
                  ),
                ),
                Tuple2(
                  _authorizationAll,
                  Text(
                    'Guest Information',
                    style: Theme.of(context).textTheme.headline4,
                    textAlign: TextAlign.center,
                  ),
                )
              ],
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
      ),
    );
  }

  void _switchRole() {
    setState(() {
      // change between roles Admin and Guest
      _role = _role == 'Admin' ? 'Dev' : 'Admin';
    });
  }
}
```

## Copyright

```
Copyright 2020 lucianojung.de

Redistribution and use in source and binary forms, with or without modification, are permitted provided that the following conditions are met:

1. Redistributions of source code must retain the above copyright notice, this list of conditions and the following disclaimer.

2. Redistributions in binary form must reproduce the above copyright notice, this list of conditions and the following disclaimer in the documentation and/or other materials provided with the distribution.

3. Neither the name of the copyright holder nor the names of its contributors may be used to endorse or promote products derived from this software without specific prior written permission.

THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
```
