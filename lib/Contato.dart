class Contato {
  final String nome;
  final String email;
  final String senha;

  Contato({
    required this.nome,
    required this.email,
    required this.senha,
  });

  Map<String, dynamic> toJson() {
    return {
      'nome': nome,
      'email': email,
      'senha': senha,
    };
  }
}
