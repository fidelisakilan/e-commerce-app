import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:user_app/screens/login.dart';

import 'auth/auth.dart';
import 'screens/switch_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: StreamProvider<MyUser>.value(
        initialData: null,
        value: AuthService().user,
        child: FirstScreen(),
      ),
    );
  }
}

class FirstScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<MyUser>(context);
    if (user != null) {
      return ProductPage();
    } else {
      return Authenticate();
    }
  }
}

class ProductPage extends StatefulWidget {
  @override
  _ProductPageState createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  String name = 'Eyevy';

  String desc = '''Full Rim Round, Cat-eyed Anti Glare Frame (48
mm)''';

  int discount = 78;

  int price = 999;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,

      body: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height / 1.5,
            child: Image.asset(
              'assets/Rectangle 23.png',
              fit: BoxFit.fitWidth,
            ),
          ),
          Container(
            padding: EdgeInsets.all(10),
            alignment: Alignment.centerLeft,
            child: Text(
              '$name',
              style: TextStyle(
                color: Color(0xff707070),
                fontSize: 18,
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.all(10),
            alignment: Alignment.centerLeft,
            child: Text(
              '$desc',
              style: TextStyle(
                color: Color(0xff707070),
                fontSize: 18,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              children: [
                Container(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    ' ₹${(price - (discount / 100) * price).round()}',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 30,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    ' ₹$price',
                    style: TextStyle(
                      decoration: TextDecoration.lineThrough,
                      color: Colors.black,
                      fontSize: 26,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    ' $discount% off',
                    style: TextStyle(
                      color: Colors.green,
                      fontSize: 26,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(child: Container()),
          AddButton()
        ],
      ),
    );
  }
}

class AddButton extends StatelessWidget {
  const AddButton({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              padding: EdgeInsets.symmetric(
                vertical: 25,
              ),
              elevation: 5,
              primary: Colors.white,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(0)),
              ),
            ),
            onPressed: () {},
            child: Text('ADD TO CART',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w300,
                )),
          ),
        ),
        Expanded(
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              padding: EdgeInsets.symmetric(
                vertical: 25,
              ),
              elevation: 5,
              primary: Color(0xffF3AA4E),
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(0)),
              ),
            ),
            onPressed: () {},
            child: Text('BUY NOW',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w300,
                )),
          ),
        ),
      ],
    );
  }
}
