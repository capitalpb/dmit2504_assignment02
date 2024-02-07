// ignore_for_file: avoid_print, use_key_in_widget_constructors, file_names, todo, prefer_const_constructors, prefer_const_literals_to_create_immutables, unused_import

import 'package:flutter/material.dart';
import 'package:dmit2504_assignment02/widgets/mysnackbar.dart';

// Do not change the structure of this files code.
// Just add code at the TODO's.

final formKey = GlobalKey<FormState>();

// We must make the variable firstName nullable.
String? firstName;
final TextEditingController textEditingController = TextEditingController();

class MyFirstPage extends StatefulWidget {
  @override
  MyFirstPageState createState() => MyFirstPageState();
}

class MyFirstPageState extends State<MyFirstPage> {
  bool enabled = false;
  int timesClicked = 0;

  void switchOnChange(bool onChanged) {
    setState(() {
      enabled = !enabled;
    });
  }

  void leftButtonPress() {
    setState(() {
      timesClicked++;
    });
  }

  void rightButtonPress() {
    setState(() {
      timesClicked = 0;
    });
  }

  String? nameValidator(String? name) {
    if (name == null || name.isEmpty || name.length > 20) {
      return 'Name must be between 1 and 20 characters';
    }
    return null;
  }

  void nameSaved(String? name) {
    firstName = name;
  }

  void submitPressed() {
    if (!formKey.currentState!.validate()) {
      return;
    }

    formKey.currentState!.save();
    MySnackBar(text: 'Hey There, Your name is $firstName').show();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('A2 - User Input'),
      ),
      body: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              //TODO: Replace this Text Widget
              // and build the label and switch here
              // as children of the row.
              Text('Enable Buttons'),
              Switch(
                value: enabled,
                onChanged: switchOnChange,
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              //TODO: Build the two buttons here
              // as children of the row.
              // For each button use a
              // "Visibility Widget" and its child
              // will be an "ElevatedButton"
              Visibility(
                visible: enabled,
                maintainState: true,
                maintainAnimation: true,
                maintainSize: true,
                child: ElevatedButton(
                  onPressed: enabled ? leftButtonPress : null,
                  child: Text(
                      timesClicked == 0 ? 'Click Me' : 'Clicked $timesClicked'),
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Visibility(
                visible: enabled,
                maintainState: true,
                maintainAnimation: true,
                maintainSize: true,
                child: ElevatedButton(
                  onPressed: enabled ? rightButtonPress : null,
                  child: Text('Reset'),
                ),
              )
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Form(
            key: formKey,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  //TODO: Build the text form field
                  // here as the first
                  // child of the column.
                  // Include as the second child
                  // of the column
                  // a submit button that will show a
                  // snackbar with the "firstName"
                  // if validation is satisfied.
                  TextFormField(
                    controller: textEditingController,
                    maxLength: 20,
                    validator: nameValidator,
                    onSaved: nameSaved,
                    decoration: const InputDecoration(
                      hintText: 'first name',
                      icon: Icon(Icons.hourglass_top),
                      helperText: 'min 1, max 20',
                      suffixIcon: Icon(Icons.check_circle),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: ElevatedButton(
                        onPressed: submitPressed,
                        child: Text('Submit'),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
