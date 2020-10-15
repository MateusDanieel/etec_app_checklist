import 'package:flutter/material.dart';

class Tarefas extends StatefulWidget {
  @override
  _TarefasState createState() => _TarefasState();
}

class _TarefasState extends State<Tarefas> {
  List _tarefa = [];

  final _tarefaController = TextEditingController();

  void addTarefa() {
    setState(() {
      Map<String, dynamic> novaTarefa = Map();
      novaTarefa["title"] = _tarefaController.text;
      novaTarefa["ok"] = false;

      _tarefaController.text = "";

      _tarefa.add(novaTarefa);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Lista de tarefas"),
        backgroundColor: Colors.blueAccent,
        centerTitle: true,
      ),
      body: Column(
        children: <Widget>[
          Container(
              padding: EdgeInsets.fromLTRB(17.0, 1.0, 7.0, 1.0),
              child: Row(children: <Widget>[
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                        labelText: "Nova tarefa",
                        labelStyle: TextStyle(color: Colors.blueAccent)),
                    controller: _tarefaController,
                  ),
                ),
                RaisedButton(
                  color: Colors.blueAccent,
                  child: Text("Inserir"),
                  textColor: Colors.white,
                  onPressed: addTarefa,
                ),
              ])),
          Expanded(
            child: ListView.builder(
                padding: EdgeInsets.only(top: 10.0),
                itemCount: _tarefa.length,
                itemBuilder: (context, index) {
                  return CheckboxListTile(
                    title: Text(_tarefa[index]['title']),
                    value: _tarefa[index]['ok'],
                    secondary: CircleAvatar(
                      child: Icon(
                          _tarefa[index]['ok'] ? Icons.check : Icons.error),
                    ),
                    onChanged: (c) {
                      setState(() {
                        _tarefa[index]['ok'] = c;
                      });
                    },
                  );
                }),
          )
        ],
      ),
    );
  }
}
