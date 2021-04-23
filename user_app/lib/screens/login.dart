import 'package:flutter/material.dart';
import 'package:user_app/auth/auth.dart';

class LoginScreen extends StatefulWidget {
  final Function toggleView;

  const LoginScreen({Key key, this.toggleView}) : super(key: key);
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  String email = '';
  String pass = '';
  final AuthService _auth = AuthService();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,

        body: Stack(
          children: [
            Container(
              color: Color(0xff262626),
            ),
            LoginColumn(widget: widget),
          ],
        ),
      ),
    );
  }
}

class LoginColumn extends StatefulWidget {
  const LoginColumn({
    Key key,
    @required this.widget,
  }) : super(key: key);

  final LoginScreen widget;

  @override
  _LoginColumnState createState() => _LoginColumnState();
}

class _LoginColumnState extends State<LoginColumn> {
  bool loading = false;

  String email = '';

  String pass = '';
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        height: MediaQuery.of(context).size.height / 1.111,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                padding: EdgeInsets.fromLTRB(10, 30, 20, 10),
                alignment: Alignment.centerLeft,
                child: Text(
                  'Log in to get started',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    color: Color(0xff707070),
                    fontSize: 20,
                  ),
                ),
              ),
              Container(
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.fromLTRB(10, 0, 20, 10),
                child: Text(
                  'Experience the all new App!',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    color: Color(0xff707070),
                    fontSize: 18,
                  ),
                ),
              ),
              TextField(
                onChanged: (val) {
                  setState(() {
                    email = val;
                  });
                },
                decoration: InputDecoration(
                  hintText: 'E-mail ID',
                  prefixIcon: Tab(
                    icon: Image.asset(
                      'assets/email-24px.png',
                      scale: 1,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              TextField(
                onChanged: (val) {
                  setState(() {
                    pass = val;
                  });
                },
                obscureText: true,
                decoration: InputDecoration(
                  hintText: 'Password',
                  suffixIcon: Tab(
                    icon: Image.asset(
                      'assets/Icon awesome-eye.png',
                      scale: 1,
                    ),
                  ),
                  prefixIcon: Tab(
                    icon: Image.asset(
                      'assets/Icon ionic-ios-lock.png',
                      scale: 1,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                alignment: Alignment.centerRight,
                child: Text(
                  'Use Mobile Number',
                  style: TextStyle(
                    color: Color(0xffF3AA4E),
                  ),
                ),
              ),
              Expanded(child: Container()),
              Container(
                child: ElevatedButton(
                  onPressed: () async{
                    dynamic result = await _auth.signInWithEmailAndPassword(
                        email, pass);
                    print(result.toString());
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Color(0xffF3AA4E),
                    elevation: 5,
                    padding: EdgeInsets.symmetric(
                      vertical: 10,
                    ),
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                  ),
                  child: Text(
                    'LOGIN',
                    style: TextStyle(
                      fontWeight: FontWeight.w300,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                child: Center(
                  child: GestureDetector(
                    onTap: widget.widget.toggleView,
                    child: Text(
                      'Register',
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
