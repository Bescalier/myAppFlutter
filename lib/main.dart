import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class Persona {
  String name;
  String lastName;
  String cuenta;
  Persona(this.name, this.lastName, this.cuenta);
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<Persona> _personas = [
    Persona('Bethel', 'Itzel', '20217978'),
    Persona('Jose', 'Jurez', '20192016'),
    Persona('Maria', 'Morales', '20189062'),
  ];

  void _agregarPersona() {
    setState(() {
      _personas.add(Persona('Nombre', 'Apellido', 'Cuenta'));
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Material App Bar'),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.green,
          child: Icon(Icons.people_alt_outlined),
          onPressed: _agregarPersona,
        ),
        body: ListView.builder(
          itemCount: _personas.length,
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              title: Text(_personas[index].name + ' ' + _personas[index].lastName),
              subtitle: Text(_personas[index].cuenta),
              leading: CircleAvatar(
                child: Text(_personas[index].name.substring(0, 1)),
              ),
              trailing: Icon(Icons.arrow_forward_ios),
            );
          },
        ),
      ),
    );
  }
}