import 'package:flutter/material.dart';
import 'package:autocomplete_textfield/autocomplete_textfield.dart';

class AutoComplete extends StatefulWidget {
  
  @override  
  State<AutoComplete> createState() => _AutoCompleteState();
}

class _AutoCompleteState extends State<AutoComplete> {
  _AutoCompleteState();
  AutoCompleteTextField? searchTextField;
  TextEditingController controller = TextEditingController();


  @override
  Widget build(BuildContext context){
    return Center(
      child: Column(
        children: <Widget>[
          Column(
            children: <Widget>[
              searchTextField = AutoCompleteTextField<Medicamentos>(
                style: TextStyle(
                  color: Color.black,
                  fontSize: 16.0
                ),
                decoration: InputDecoration(
                  suffixIcon: Container(
                    width: 85.0,
                    height: 60.0
                  ),
                  contentPadding: EdgeInserts.fromLTRB(10.0, 30.0, 10.0, 20.0),
                  filled: true,
                  hintText: 'Buscar insumo',
                  hintStyle: TextStyle(color: Colors.black)),
                )
              )//19/12/2021
            ]
          )
        ]
      )
    );
  }
}