import 'package:flutter/material.dart';
import 'package:flutter_state_management/user_repository.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  TextEditingController _mail, _pass;

  @override
  void initState() {
    super.initState();
    _mail = TextEditingController(text: "");
    _pass = TextEditingController(text: "");
  }

  @override
  Widget build(BuildContext context) {
    final userRepo = Provider.of<UserRepository>(context);
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text("Login Page"),
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: _mail,
                validator: (value) {
                  if (value.length <= 0) {
                    return "E-posta alanı boş geçilemez";
                  }
                },
                decoration: InputDecoration(
                  labelText: "E-Posta",
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: _pass,
                validator: (value) {
                  if (value.length <= 0) {
                    return "Şifre alanı boş geçilemez";
                  }
                },
                decoration: InputDecoration(
                  labelText: "Şifre",
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            userRepo.userStatus == UserStatus.LoggingIn
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: RaisedButton(
                      onPressed: () async {
                        if (_formKey.currentState.validate()) {
                          if (!await userRepo.signIn(_mail.text, _pass.text)) {
                            _scaffoldKey.currentState.showSnackBar(SnackBar(
                              content: Text("E-Posta veya şifre hatalı"),
                              duration: Duration(seconds: 2),
                            ));

                          }
                        }
                      },
                      color: Colors.amber,
                      child: Text("Giriş yap"),
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
