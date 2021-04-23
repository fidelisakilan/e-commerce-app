import 'package:flutter/material.dart';
import 'package:flutter_app/services/auth.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  bool loading = false;
  String email = '';
  String pass = '';
  String error = '';
  final AuthService _auth = AuthService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 20,
          horizontal: 40,
        ),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                alignment: Alignment.center,
                child: Text(
                  'LOGIN',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black45,
                    fontSize: 24,
                  ),
                ),
              ),
              SizedBox(
                height: 40,
              ),
              TextFormField(
                onChanged: (val) {
                  setState(() => email = val);
                },
                validator: (val) => val.isEmpty ? 'Enter an email' : null,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.fromLTRB(40, 20, 20, 20),
                  fillColor: Color(0xffEFEFEF),
                  filled: true,
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(100.0),
                    borderSide: BorderSide(
                      color: Color(0xffEFEFEF),
                    ),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Color(0xffEFEFEF), width: 19.0),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Color(0xffEFEFEF), width: 19.0),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Color(0xffEFEFEF), width: 19.0),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  hintText: 'Email ID',
                  labelStyle: TextStyle(color: Colors.black38),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                onChanged: (val) {
                  setState(() => pass = val);
                },
                validator: (val) => val.isEmpty ? 'Enter your password' : null,
                obscureText: true,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.fromLTRB(50, 20, 20, 20),
                  fillColor: Color(0xffEFEFEF),
                  filled: true,
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25.0),
                    borderSide: BorderSide(
                      color: Color(0xffEFEFEF),
                    ),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Color(0xffEFEFEF), width: 19.0),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Color(0xffEFEFEF), width: 19.0),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Color(0xffEFEFEF), width: 19.0),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  hintText: 'Password',
                  labelStyle: TextStyle(color: Colors.black38),
                ),
              ),
              SizedBox(
                height: 40,
              ),
              ElevatedButton(
                onPressed: () async {
                  if (_formKey.currentState.validate()) {
                    setState(() => loading = true);

                    dynamic result =
                        await _auth.signInWithEmailAndPassword(email, pass);
                    print(result.toString());

                    if (result == null) {
                      setState(() {
                        error = 'Invalid Credentials';
                        loading = false;
                      });
                    }
                  }
                },
                style: ElevatedButton.styleFrom(
                  primary: Color(0xff0FAAE2),
                  elevation: 0,
                  padding: EdgeInsets.symmetric(
                    vertical: 18,
                  ),
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(100)),
                  ),
                ),
                child: Text(
                  'Login',
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
              ),
              SizedBox(
                height: 50,
              ),
              Container(
                alignment: Alignment.center,
                child: Text(
                  "Don't have a account?",
                  style: TextStyle(
                      color: Colors.black54, fontWeight: FontWeight.w400),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                alignment: Alignment.center,
                child: Text(
                  'Create Account',
                  style: TextStyle(
                    decoration: TextDecoration.underline,
                    fontWeight: FontWeight.w600,
                    color: Color(0xff0FAAE2),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
