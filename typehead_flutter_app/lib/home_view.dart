import 'package:flutter/material.dart';
import 'package:typehead_flutter_app/widget/autocomplete_widget.dart';
import 'package:typehead_flutter_app/suggestions.dart';

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  List<String> added = [];
  String currentText = "";
  GlobalKey<AutoCompleteState> key = GlobalKey();
  _HomeViewState() {
    textField = AutoComplete(
      key: key,
      suggestions: suggestions,
      textChanged: (text) => currentText = text,
      textSubmitted: (text) => setState(() {
        if (text != "") {
          added.add(text);
        }
      }),
    );
  }

  AutoComplete textField;
  bool showWhichErrorText = false;

  @override
  Widget build(BuildContext context) {
    Column body = Column(
      children: [
        ListTile(
          title: textField,
        ),
      ],
    );

    body.children.addAll(added.map((item) {
      return ListTile(title: Text(item));
    }));

    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: SafeArea(
        child: body,
      ),
    );
  }
}
