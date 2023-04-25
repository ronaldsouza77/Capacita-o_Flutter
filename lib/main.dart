import 'dart:convert';

import 'package:flutter/material.dart';

import 'Contato.dart';

import 'package:http/http.dart' as http;

import 'Listagem_contatos.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final TextEditingController _nomeController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _senhaController = TextEditingController();

  String errorMessage = '';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Emakers Jr',
      home: Scaffold(
        backgroundColor: Colors.white, // definir cor de fundo branca
        appBar: AppBar(
          title: const Text(
            'Emakers Jr',
            style: TextStyle(
              color: Colors.purple, // definir cor roxa para o título
              fontSize: 28, // definir tamanho do título
            ),
          ),
          centerTitle: true, // centralizar o título
          backgroundColor: Colors.white, // definir cor de fundo da AppBar
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(height: 16),
                const Text(
                  'Cadastro', // subtítulo
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black, // cor do subtítulo
                  ),
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: _nomeController,
                  decoration: const InputDecoration(
                    labelText: 'Nome',
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: Colors
                              .purple), // cor da borda quando não está selecionado
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: Colors
                              .purple), // cor da borda quando está selecionado
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.purple),
                    ),
                  ),
                  validator: (value) {
                    if (value?.isEmpty ?? true) {
                      // validação do campo de texto
                      return 'Campo obrigatório';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: _emailController,
                  decoration: const InputDecoration(
                    labelText: 'E-mail',
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: Colors
                              .purple), // cor da borda quando não está selecionado
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: Colors
                              .purple), // cor da borda quando está selecionado
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.purple),
                    ),
                  ),
                  validator: (value) {
                    if (value?.isEmpty ?? true) {
                      return 'Campo obrigatório';
                    } else if (value!.contains('@')) {
                      // validação do formato do e-mail
                      return 'E-mail inválido';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: _senhaController,
                  decoration: const InputDecoration(
                    labelText: 'Senha',
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: Colors
                              .purple), // cor da borda quando não está selecionado
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: Colors
                              .purple), // cor da borda quando está selecionado
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.purple),
                    ),
                  ),
                  obscureText: true, // esconde o texto digitado
                  validator: (value) {
                    if (value?.isEmpty ?? true) {
                      return 'Campo obrigatório';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: TextEditingController(),
                  decoration: const InputDecoration(
                    labelText: 'Confirmar senha',
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: Colors
                              .purple), // cor da borda quando não está selecionado
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: Colors
                              .purple), // cor da borda quando está selecionado
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.purple),
                    ),
                  ),
                  obscureText: true,
                  validator: (value) {
                    if (value?.isEmpty ?? true) {
                      return 'Campo obrigatório';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () async {
                    //if (Form.of(context).validate()) {
                    // Cria um objeto Contato com os dados do formulário
                    Contato contato = Contato(
                      nome: _nomeController.text,
                      email: _emailController.text,
                      senha: _senhaController.text,
                    );

                    // Faz a requisição POST para a API
                    final response = await http.post(
                      Uri.parse('http://localhost:8080/addcontato'),
                      headers: {'Content-Type': 'application/json'},
                      body: jsonEncode(contato.toJson()),
                    );
                    Navigator.of(context).push(
                        // ignore: use_build_context_synchronously
                        MaterialPageRoute(
                            builder: (BuildContext context) => ContatoList()));

                    // Verifica se a requisição foi bem-sucedida
                    if (response.statusCode == 200) {
                      // Ação a ser realizada quando a requisição é bem-sucedida

                      print('Contato adicionado com sucesso!');
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Contato adicionado com sucesso!'),
                        ),
                      );
                    } else {
                      // Ação a ser realizada quando a requisição falha
                      errorMessage =
                          'Erro ao adicionar contato'; // atualiza a mensagem de erro
                    }
                    // exibe a mensagem de erro
                    if (errorMessage.isNotEmpty) {
                      showDialog(
                        context: context,
                        builder: (_) => AlertDialog(
                          title: Text('Erro'),
                          content: Text(errorMessage),
                          actions: [
                            ElevatedButton(
                              onPressed: () => Navigator.pop(context),
                              child: Text('OK'),
                            ),
                          ],
                        ),
                      );
                    }
                  },
                  //}

                  style: ElevatedButton.styleFrom(
                    primary: Colors.orange, // cor do botão
                  ),
                  child: const Text('Enviar'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
