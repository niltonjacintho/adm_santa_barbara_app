import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:material_dropdown_formfield/material_dropdown_formfield.dart';
import 'package:smart_select/smart_select.dart';
import 'artigo_edit_controller.dart';

class ArtigoEditPage extends StatefulWidget {
  final String title;
  const ArtigoEditPage({Key key, this.title = "ArtigoEdit"}) : super(key: key);

  @override
  _ArtigoEditPageState createState() => _ArtigoEditPageState();
}

class _ArtigoEditPageState
    extends ModularState<ArtigoEditPage, ArtigoEditController> {
  //use 'controller' variable to access controller
  String _myActivity;
  String _myActivityResult;
  final formKey = new GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _myActivity = '';
    _myActivityResult = '';
  }
  // String value = 'flutter';
// List<S2Choice<String>> options = [
//   S2Choice<String>(value: 'ion', title: 'Ionic'),
//   S2Choice<String>(value: 'flu', title: 'Flutter'),
//   S2Choice<String>(value: 'rea', title: 'React Native'),
// ];

  List<int> value = [2];
  int v = 0;
  List<S2Choice<int>> options = [
    S2Choice<int>(value: 1, title: 'Ionic'),
    S2Choice<int>(value: 2, title: 'Flutter'),
    S2Choice<int>(value: 3, title: 'React Native'),
  ];

  _saveForm() {
    var form = formKey.currentState;
    if (form.validate()) {
      form.save();
      setState(() {
        _myActivityResult = _myActivity;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              SmartSelect<int>.single(
                title: 'Frameworks',
                value: v,
                modalType: S2ModalType.popupDialog,
                choiceItems: options,
                onChange: (state) => setState(() => v = state.value),
              ),
              DropdownSearch<String>(
                  mode: Mode.DIALOG,
                  showSelectedItem: true,
                  items: ["Brazil", "Italia (Disabled)", "Tunisia", 'Canada'],
                  label: "Menu mode",
                  hint: "country in menu mode",
                  popupItemDisabled: (String s) => s.startsWith('I'),
                  onChanged: print,
                  selectedItem: "Brazil"),
              Container(
                padding: EdgeInsets.all(8),
                child: RaisedButton(
                  child: Text('Save'),
                  onPressed: _saveForm,
                ),
              ),
              Container(
                padding: EdgeInsets.all(16),
                child: Text(_myActivityResult),
              )
            ],
          ),
        ),
      ),
    );
  }
}
