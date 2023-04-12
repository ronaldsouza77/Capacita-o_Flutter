import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Emakers jr',
      home: Scaffold(
        backgroundColor: Colors.white, // definir cor de fundo branca
        appBar: AppBar(
          title: Text(
            'Emakers jr',
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
                SizedBox(height: 16),
                Text(
                  'Cadastro', // subtítulo
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black, // cor do subtítulo
                  ),
                ),
                SizedBox(height: 16),
                TextFormField(
                  controller:
                      TextEditingController(), // controlador do campo de texto
                  decoration: InputDecoration(
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
                SizedBox(height: 16),
                TextFormField(
                  controller: TextEditingController(),
                  decoration: InputDecoration(
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
                SizedBox(height: 16),
                TextFormField(
                  controller: TextEditingController(),
                  decoration: InputDecoration(
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
                SizedBox(height: 16),
                TextFormField(
                  controller: TextEditingController(),
                  decoration: InputDecoration(
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
                SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {
                    if (Form.of(context)!.validate()) {
                      // validação do formulário
                      // Ação a ser realizada quando o formulário é válido
                      print('Formulário válido');
                    }
                  },
                  child: Text('Enviar'),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.orange, // cor do botão
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
