import 'package:flutter/material.dart';

class AutoComplete extends StatefulWidget {
  final List<String> suggestions;
  final Function(String) textChanged, textSubmitted;
  final GlobalKey<AutoCompleteState> key;

  AutoComplete({
    @required this.key,
    @required this.suggestions,
    @required this.textSubmitted,
    this.textChanged,
  }) : super(key: key);

  @override
  AutoCompleteState createState() => AutoCompleteState();
}

class AutoCompleteState extends State<AutoComplete> {
  LayerLink _layerLink;
  OverlayEntry listSuggestionsEntry;
  List<String> filteredSuggestions;
  String currentText = '';

  FocusNode focusNode;
  TextEditingController controller;

  @override
  void initState() {
    super.initState();
    focusNode = FocusNode();
    controller = TextEditingController();
    _layerLink = LayerLink();

    focusNode.addListener(() {
      if (!focusNode.hasFocus) {
        filteredSuggestions = [];
        updateOverlay();
      } else if (!(currentText == '' || currentText == null)) {
        updateOverlay(currentText);
      }
    });
  }

  @override
  void dispose() {
    focusNode?.dispose();
    controller?.dispose();
    listSuggestionsEntry?.remove();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CompositedTransformTarget(
      link: _layerLink,
      child: TextField(
        textCapitalization: TextCapitalization.sentences,
        decoration: const InputDecoration(),
        keyboardType: TextInputType.text,
        focusNode: focusNode,
        controller: controller,
        textInputAction: TextInputAction.done,
        onChanged: (text) {
          currentText = text;
          updateOverlay(text);

          if (widget.textChanged != null) {
            widget.textChanged(text);
          }
        },
        onTap: () {
          updateOverlay(currentText);
        },
        onSubmitted: (submittedText) => triggerSubmitted(submittedText: submittedText),
      ),
    );
  }

  void triggerSubmitted({submittedText}) {
    submittedText == null ? widget.textSubmitted(currentText) : widget.textSubmitted(submittedText);
    clear();
  }

  void clear() {
    controller?.clear();
    currentText = '';
    updateOverlay();
  }

  void updateOverlay([String query]) {
    if (listSuggestionsEntry == null) {
      final Size textFieldSize = (context.findRenderObject() as RenderBox).size;
      final width = textFieldSize.width;
      final height = textFieldSize.height;
      listSuggestionsEntry = OverlayEntry(
        builder: (context) {
          return Positioned(
            width: width,
            child: CompositedTransformFollower(
              link: _layerLink,
              showWhenUnlinked: false,
              offset: Offset(0.0, height),
              child: SizedBox(
                width: width,
                child: Card(
                  child: Column(
                    children: filteredSuggestions.map(
                      (suggestion) {
                        return Row(
                          children: [
                            Expanded(
                              child: InkWell(
                                child: Padding(padding: EdgeInsets.all(8.0), child: Text(suggestion)),
                                onTap: () {
                                  String text = suggestion.toString();
                                  controller.text = text;
                                  //focusNode.unfocus();
                                  widget.textSubmitted(suggestion);
                                  clear();
                                },
                              ),
                            ),
                          ],
                        );
                      },
                    ).toList(),
                  ),
                ),
              ),
            ),
          );
        },
      );
      Overlay.of(context).insert(listSuggestionsEntry);
    }

    filteredSuggestions = getSuggestions(widget.suggestions, query);
    listSuggestionsEntry.markNeedsBuild();
  }

  List<String> getSuggestions(List<String> suggestions, String query) {
    if (null == query || query.length < 1) {
      return [];
    }

    suggestions = suggestions.where((item) => filterFunction(item, query)).toList();
    suggestions.sort(sortFunction);
    if (suggestions.length > 5) {
      suggestions = suggestions.sublist(0, 5);
    }
    return suggestions;
  }

  int sortFunction(a, b) => a.compareTo(b);

  bool filterFunction(String item, String query) => item.toLowerCase().startsWith(query.toLowerCase());
}
