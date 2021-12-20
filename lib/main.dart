import 'package:flutter/material.dart';
import 'widgets/autocomplete.dart';
import 'widgets/medicamentos.dart'; 

//https://medium.com/flutter-community/implementing-auto-complete-search-list-a8dd192bd5f6
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Folios Almacen J16',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Folios Almacen J16 Demo'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _changeActivity(String actividad){
    setState((){
      switch(actividad){
        //codigo para cambiar de actividad
        case "PRINCIPAL":
          break;
        default: 
          break;
      }      
    });
  }


  Widget botonGuardar(){
    return const ElevatedButton(onPressed: null, child: const Text('BOTON GUARDAR DESDE FUNCION'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('SALIDA DE VALES DE ALMACEN JURISDICCIONAL'),
            Column(
              children: <Widget>[
                TextFormField(
                  decoration: const InputDecoration(
                    hintText: "DSDF"
                  ),
                ),
                ElevatedButton(
                  onPressed: () => { }, //metodo para cambiar a otra pagina
                  child: const Text('GENERAR VALE')
                  ),
                  botonGuardar()
              ]
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
