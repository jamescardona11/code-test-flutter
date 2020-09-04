import 'package:flutter/material.dart';
import 'package:typehead_flutter_app/widget/autocomplete_widget.dart';
import 'package:typehead_flutter_app/suggestions.dart';

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final selectedList = ValueNotifier<List<String>>([]);
  GlobalKey<AutoCompleteState> key = new GlobalKey();
  String currentText = '';

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: SafeArea(
        child: Column(
          children: [
            ListTile(
              title: AutoComplete(
                key: key,
                suggestions: suggestions,
                textChanged: (text) => currentText = text,
                textSubmitted: (text) {
                  if (text != '') {
                    selectedList.value = List<String>.from(selectedList.value)..add(text);
                  }
                },
              ),
            ),
            Container(
              width: size.width,
              height: size.height * 0.8,
              child: ValueListenableBuilder(
                valueListenable: selectedList,
                builder: (context, value, child) => ListView.builder(
                  itemCount: value.length,
                  itemBuilder: (context, index) {
                    return ListTile(title: Text(value[index]));
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
