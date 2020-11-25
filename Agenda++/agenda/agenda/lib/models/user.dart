import 'package:flutter/cupertino.dart';

class User {
  final String id;
  final String name;
  final String email;
  final String avatarUrl;
  final String endereco;
  final String cep;
  final String telefone;
  final String aniversario;

  const User({
    this.id,
    @required this.name,
    @required this.email,
    @required this.avatarUrl,
    @required this.cep,
    @required this.endereco,
    @required this.telefone,
    @required this.aniversario,
  });
}
