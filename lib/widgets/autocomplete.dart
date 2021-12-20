import 'package:flutter/material.dart';
import 'package:autocomplete_textfield/autocomplete_textfield.dart';
import 'medicamentos.dart';

class AutoComplete extends StatefulWidget {
  @override
  State<AutoComplete> createState() => _AutoCompleteState();
}

class _AutoCompleteState extends State<AutoComplete> {
  _AutoCompleteState();
  AutoCompleteTextField? searchTextField;
  TextEditingController controller = TextEditingController();
  GlobalKey<AutoCompleteTextFieldState<Medicamentos>> key = GlobalKey();

  void _loadData() async {
    await MedicamentosViewModel.loadMedicamentos();
  }

  @override
  void initState() {
    _loadData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(children: <Widget>[
      Column(children: <Widget>[
        searchTextField = AutoCompleteTextField<Medicamentos>(
            itemBuilder: (context, item) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    item.autoCompleteTerm!,
                    style: TextStyle(fontSize: 16.0),
                  ),
                  Padding(
                    padding: EdgeInsets.all(15.0),
                  ),
                  Text(
                    item.keyword!,
                  )
                ],
              );
            },
            itemFilter: (item, query) {
              return item.autoCompleteTerm
                  .toLowerCase()
                  .startsWith(query.toLowerCase());
            },
            itemSorter: (a, b) {
              return a.autoCompleteTerm.compareTo(b.autoCompleteTerm);
            },
            key: key,
            itemSubmitted: (item) {
              setState(() => searchTextField!.textField.controller.text =
                  item.autoCompleteTerm!);
            },
            style: TextStyle(color: Color.black, fontSize: 16.0),
            suggestions: MedicamentosViewModel.medicamentos,
            decoration: InputDecoration(
                suffixIcon: Container(width: 85.0, height: 60.0),
                contentPadding: EdgeInserts.fromLTRB(10.0, 30.0, 10.0, 20.0),
                filled: true,
                hintText: 'Buscar insumo',
                hintStyle: TextStyle(color: Colors.black)))
      ])
    ]));
  }
}
