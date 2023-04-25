import 'package:flutter/material.dart';
import 'Contato.dart';

class ContatoList extends StatefulWidget {
  @override
  _ContatoListState createState() => _ContatoListState();
}

class _ContatoListState extends State<ContatoList> {
  List<Contato> _contatos = [
    Contato(nome: 'João', email: 'joao@exemplo.com', senha: '123456'),
    Contato(nome: 'Maria', email: 'maria@exemplo.com', senha: '654321'),
    Contato(nome: 'Pedro', email: 'pedro@exemplo.com', senha: 'abcdef'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Usuários'),
      ),
      body: ListView.builder(
        itemCount: _contatos.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(_contatos[index].nome),
            subtitle: Text(_contatos[index].email),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: Icon(Icons.edit),
                  onPressed: () {
                    // Implemente a lógica de edição do usuário aqui
                  },
                ),
                IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: () {
                    // Implemente a lógica de exclusão do usuário aqui
                  },
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
