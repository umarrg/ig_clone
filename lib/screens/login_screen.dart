import 'package:flutter/material.dart';
import 'package:instagram/services/auth_service.dart';
import 'signup_screen.dart';

class LoginScreen extends StatefulWidget {
  static final String id = 'login_screen';

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formkey = GlobalKey<FormState>();

  String _email, _password;

  _submit () {
   if (_formkey.currentState.validate()) {
     _formkey.currentState.save();
    AuthService.login(_email, _password);
   }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
              child: Container(
          height: MediaQuery.of(context).size.height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Instagram',
                style: TextStyle(fontSize: 50.0, fontFamily: 'billabong'),
              ),
              Form(
                key: _formkey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 30.0, vertical: 10.0),
                      child: TextFormField(
                          decoration: InputDecoration(
                            labelText: 'Email',
                          ),
                          validator: (input) => !input.contains('@')
                              ? 'please enter a valid email'
                              : null,
                          onSaved: (input) => _email = input),
                    ),
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 30.0, vertical: 10.0),
                      child: TextFormField(
                        decoration: InputDecoration(
                          labelText: 'Password',
                        ),
                        validator: (input) => input.length <6
                            ? 'Must be 6 characters'
                            : null,
                        onSaved: (input) => _password = input,
                        obscureText: true,
                      ),
                    ),
                    SizedBox(height: 20.0),
                    Container(
                      width: 250.0,
                      child: FlatButton(
                        onPressed: _submit,
                       color: Colors.blue,
                       padding: EdgeInsets.all(10.0),
                       child: Text('Login', style: TextStyle(fontSize: 18.0, color: Colors.white),)
                      ),
                    ),
                     SizedBox(height: 20.0),
                    Container(
                      width: 250.0,
                      child: FlatButton(
                        onPressed: () {
                         Navigator.pushNamed(context, SignupScreen.id);
                        },
                       color: Colors.blue,
                       padding: EdgeInsets.all(10.0),
                       child: Text('Go to SignUp Page', style: TextStyle(fontSize: 18.0, color: Colors.white),)
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
