import 'package:flutter/material.dart';
import 'package:flutter_livapp/screens/home_Screens.dart';
import 'package:flutter_livapp/screens/register_screens.dart';
import 'package:flutter_livapp/state/user_state.dart';
import 'package:provider/provider.dart';

class LoginScrrens extends StatefulWidget {
  static const routeName = '/login-screens';

  const LoginScrrens({Key? key}) : super(key: key);

  @override
  _LoginScrrensState createState() => _LoginScrrensState();
}

class _LoginScrrensState extends State<LoginScrrens> {
  String _username = '';
  String _password = '';
  final _form = GlobalKey<FormState>();

  void _loginNew() async {
    if (!_form.currentState!.validate()) {
      return;
    }
    _form.currentState!.save();
    bool istoken = await Provider.of<UserState>(
      context,
      listen: false,
    ).loginNow(_username, _password);
    if (istoken) {


      // Navigator.of(context).pushReplacementNamed(HomeScreens.routeName);

      Navigator.of(context).pushReplacementNamed(HomeScreens.routeName);


    } else {
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: const Text("Something is wrong.Try Again"),
              actions: [
                ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: const Text("OK"))
              ],
            );
          });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login Now"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: SingleChildScrollView(
          child: Form(
            key: _form,
            child: Column(
              children: [
                TextFormField(
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Enter Your Username';
                    }
                    return null;
                  },
                  decoration: const InputDecoration(
                    hintText: "Username",
                  ),
                  onSaved: (value) {
                    _username = value!;
                  },
                ),
                TextFormField(
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Enter Your password';
                    }
                    return null;
                  },
                  decoration: const InputDecoration(
                    hintText: "Password",
                  ),
                  onSaved: (value) {
                    _password = value!;
                  },
                  obscureText: true,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                        onPressed: _loginNew, child: const Text("Login")),
                    TextButton(
                        onPressed: () {
                          Navigator.of(context)
                              .pushReplacementNamed(RegisterScreens.routeName);
                        },
                        child: const Text(
                          "Register New",
                        )),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
