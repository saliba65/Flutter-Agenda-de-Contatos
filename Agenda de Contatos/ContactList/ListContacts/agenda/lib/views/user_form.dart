import 'package:agenda/models/user.dart';
import 'package:agenda/provider/users.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UserForm extends StatelessWidget {
  final _form = GlobalKey<FormState>();
  final Map<String, String> _formData = {};

  void _loadFormData(User user) {
    if (user != null) {
      _formData['id'] = user.id;
      _formData['name'] = user.name;
      _formData['email'] = user.email;
      _formData['telefone'] = user.telefone;
      _formData['cep'] = user.cep;
      _formData['endereco'] = user.endereco;
      _formData['avatarUrl'] = user.avatarUrl;
    }
  }

  @override
  Widget build(BuildContext context) {
    final User user = ModalRoute.of(context).settings.arguments;

    _loadFormData(user);

    return Scaffold(
        appBar: AppBar(
          title: Text('Formulario de Usuario'),
          actions: <Widget>[
            IconButton(
                icon: Icon(Icons.save),
                onPressed: () {
                  final isValid = _form.currentState.validate();
                  if (isValid) {
                    _form.currentState.save();
                    Provider.of<Users>(context, listen: false).put(
                      User(
                        id: _formData['id'],
                        name: _formData['name'],
                        email: _formData['email'],
                        telefone: _formData['telefone'],
                        cep: _formData['cep'],
                        endereco: _formData['endereco'],
                        avatarUrl: _formData['avatarUrl'],
                      ),
                    );
                    Navigator.of(context).pop();
                  }
                })
          ],
        ),
        body: Padding(
          padding: EdgeInsets.all(15),
          child: Form(
            key: _form,
            child: Column(
              children: <Widget>[
                TextFormField(
                  initialValue: _formData['name'],
                  decoration: InputDecoration(labelText: 'Nome'),
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Ocorreu um erro !';
                    }

                    if (value.trim().length < 3) {
                      return 'O nome deve possuir pelo menos 3 letras !';
                    }
                  },
                  onSaved: (value) => _formData['name'] = value,
                ),
                TextFormField(
                  initialValue: _formData['email'],
                  decoration: InputDecoration(labelText: 'Email'),
                  onSaved: (value) => _formData['email'] = value,
                ),
                TextFormField(
                  initialValue: _formData['avatarUrl'],
                  decoration: InputDecoration(labelText: 'Url de perfil'),
                  onSaved: (value) => _formData['avatarUrl'] = value,
                ),
                TextFormField(
                  initialValue: _formData['telefone'],
                  decoration: InputDecoration(labelText: 'Telefone'),
                  onSaved: (value) => _formData['telefone'] = value,
                ),
                TextFormField(
                  initialValue: _formData['cep'],
                  decoration: InputDecoration(labelText: 'CEP'),
                  onSaved: (value) => _formData['cep'] = value,
                ),
                TextFormField(
                  initialValue: _formData['endereco'],
                  decoration: InputDecoration(labelText: 'Endereço'),
                  onSaved: (value) => _formData['endereco'] = value,
                ),
              ],
            ),
          ),
        ));
  }
}
