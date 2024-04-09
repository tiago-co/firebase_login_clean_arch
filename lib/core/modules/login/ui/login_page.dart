import 'package:clean_test/core/modules/login/domain/errors/errors.dart';
import 'package:clean_test/core/modules/login/presenter/controllers/login_with_email_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_triple/flutter_triple.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController(
    text: 'tiago433@hotmail.com',
  );

  final TextEditingController _passwordController = TextEditingController(
    text: '123456',
  );

  late final LoginWithEmailStore store;
  @override
  void initState() {
    store = Modular.get<LoginWithEmailStore>();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login Firebase'),
      ),
      body: Column(
        children: [
          TextFormField(
            controller: _emailController,
            onChanged: (value) {
              store.state.email = value;
              store.update(store.state);
            },
          ),
          TextFormField(
            controller: _passwordController,
            onChanged: (value) {
              store.state.password = value;
              store.update(store.state);
            },
          ),
          TextButton(
            onPressed: () async {
              store.state.email = _emailController.text;

              store.state.password = _passwordController.text;
              store.update(store.state);

              await store.loginWithEmailAndPassword().catchError(
                (onError) {
                  final snackBar = SnackBar(
                    content: const Text('Yay! A SnackBar!'),
                    action: SnackBarAction(
                      label: 'Undo',
                      onPressed: () {
                        // Some code to undo the change.
                      },
                    ),
                  );
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                },
              );
            },
            child: const Text('Entrar'),
          ),
        ],
      ),
    );
  }
}
