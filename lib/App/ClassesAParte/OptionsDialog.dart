import 'package:commons/commons.dart';
import 'package:estudos_flutter/App/Destinos/Projeto.dart';
import 'package:flutter/material.dart';
import 'option_dialog.dart';

class OptionsDialog extends StatefulWidget {
  final String title;
  final List<Option> options;

  OptionsDialog({this.title, this.options});

  @override
  _OptionsDialogState createState() => _OptionsDialogState();
}

class _OptionsDialogState extends State<OptionsDialog> {
  _optionItem(BuildContext context, Option option) {
    return ListTile(
      onTap: () {
        pop(context);
        if (option.action != null) option.action();
      },
      leading: option.iconB,
      title: option.title,
    );
  }

  _options() {
    var listItems = List<Widget>();
    widget.options.forEach((item) {
      listItems.add(_optionItem(context, item));
    });
    return listItems;
  }

  _dialogContent(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(16),
          child: Text(
            widget.title,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
              color: Colors.blueAccent,
            ),
          ),
        ),
        Divider(
          color: Colors.blueAccent,
          height: 5,
        ),
        Flexible(
          fit: FlexFit.loose,
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                ..._options(),
              ],
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: _dialogContent(context),
      elevation: 3,
    );
  }
}

optionsDialog(
  BuildContext context,
  String title,
  List<Option> options, {
  autoClose = true,
}) {
  return showDialog(
    barrierDismissible: autoClose,
    context: context,
    builder: (c) => WillPopScope(
      onWillPop: () async => autoClose,
      child: OptionsDialog(
        title: title,
        options: options,
      ),
    ),
  );
}
