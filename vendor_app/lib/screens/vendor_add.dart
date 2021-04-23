import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class VendorAddScreen extends StatefulWidget {
  @override
  _VendorAddScreenState createState() => _VendorAddScreenState();
}

class _VendorAddScreenState extends State<VendorAddScreen> {
  String name = 'cat eyes anti glare frame';
  String category = 'glasses';
  String offer = '78';
  String price = '999';
  int tabIndex = 0;
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(
                  height: 40,
                ),
                Container(
                  alignment: Alignment.center,
                  child: Text(
                    'Welcome Vendor',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black45,
                      fontSize: 28,
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.2),
                              spreadRadius: 4,
                              blurRadius: 7,
                              offset: Offset(0, 10),
                            ),
                          ],
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(
                            width: 2.0,
                            color: Color(0xffACACAD),
                          )),
                      child: Text(
                        'All Items',
                        style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.w600,
                          color: Color(0xffACACAD),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.2),
                            spreadRadius: 4,
                            blurRadius: 7,
                            offset: Offset(0, 10),
                          ),
                        ],
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(
                          width: 2.0,
                          color: Colors.blue,
                        ),
                      ),
                      child: Text(
                        'Out of stock',
                        style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  alignment: Alignment.center,
                  child: Text(
                    'Add New',
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.w400),
                  ),
                ),
                ImageRow(),
                SizedBox(
                  height: 10,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    VendorField(
                      tag: 'Category',
                    ),
                    VendorField(
                      tag: 'Product Name',
                    ),
                    VendorField(
                      tag: 'Price Amount',
                    ),
                    VendorField(
                      tag: 'GST Amount',
                    ),
                    VendorField(
                      tag: 'Delivery Charge',
                    ),
                    VendorField(
                      tag: 'Offer(%)',
                    ),
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 50),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Color(0xff0FAAE2),
                      elevation: 2,
                      padding: EdgeInsets.symmetric(
                        vertical: 15,
                      ),
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(100)),
                      ),
                    ),
                    onPressed: () async {
                      if (_formKey.currentState.validate()) {
                        FirebaseFirestore firestore =
                            FirebaseFirestore.instance;
                        CollectionReference products =
                            firestore.collection('products');
                        products
                            .add({
                              'name': name,
                              'category': category,
                              'offer': offer,
                            })
                            .then((value) => print("User Added"))
                            .catchError((error) {
                              print("Failed to add user: $error");
                            });
                        final snackBar = SnackBar(
                            content: Text('Product Added to database'));
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      }
                    },
                    child: Text(
                      'Upload',
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        elevation: 10,
        currentIndex: tabIndex,
        selectedItemColor: Colors.black,
        showUnselectedLabels: true,
        type: BottomNavigationBarType.fixed,
        unselectedItemColor: Color(0xff989898),
        unselectedFontSize: 18,
        selectedFontSize: 18,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Text(''), label: 'Menu'),
          BottomNavigationBarItem(icon: Text(''), label: 'Order'),
          BottomNavigationBarItem(icon: Text(''), label: 'Pay-In'),
          BottomNavigationBarItem(icon: Text(''), label: 'Profile'),
        ],
        onTap: (newIndex) => setState(() {
          tabIndex = newIndex;
        }),
      ),
    );
  }
}

class VendorField extends StatelessWidget {
  const VendorField({
    Key key,
    this.tag,
  }) : super(key: key);
  final String tag;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Expanded(
            flex: 1,
            child: Container(
              alignment: Alignment.centerRight,
              child: Text(
                '$tag',
                style: TextStyle(color: Color(0xff2AB4E5)),
              ),
            ),
          ),
          SizedBox(
            width: 10,
          ),
          Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.only(left: 20),
              child: TextFormField(
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.fromLTRB(20, 20, 20, 20),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(0),
                    borderSide:
                        BorderSide(color: Color(0xff707070), width: 2.0),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(0),
                    borderSide: BorderSide(color: Colors.red, width: 2.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(0),
                    borderSide:
                        BorderSide(color: Color(0xff707070), width: 2.0),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ImageRow extends StatelessWidget {
  const ImageRow({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        GestureDetector(
          onTap: () {},
          child: Container(
            width: MediaQuery.of(context).size.width / 4,
            height: 100,
            margin: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Color(0xffF1F1F1),
              border: Border.all(width: 2.0, color: Color(0xff707070)),
            ),
            alignment: Alignment.bottomCenter,
            padding: EdgeInsets.fromLTRB(10, 0, 10, 5),
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              decoration: BoxDecoration(
                color: Color(0xffF1F1F1),
                border: Border.all(width: 2.0, color: Color(0xff707070)),
              ),
              child: Text(
                'Upload',
                style: TextStyle(fontSize: 10),
              ),
            ),
          ),
        ),
        GestureDetector(
          onTap: () {},
          child: Container(
            width: MediaQuery.of(context).size.width / 4,
            height: 100,
            margin: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Color(0xffF1F1F1),
              border: Border.all(width: 2.0, color: Color(0xff707070)),
            ),
            alignment: Alignment.bottomCenter,
            padding: EdgeInsets.fromLTRB(10, 0, 10, 5),
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              decoration: BoxDecoration(
                color: Color(0xffF1F1F1),
                border: Border.all(width: 2.0, color: Color(0xff707070)),
              ),
              child: Text(
                'Upload',
                style: TextStyle(fontSize: 10),
              ),
            ),
          ),
        ),
        GestureDetector(
          onTap: () {},
          child: Container(
            width: MediaQuery.of(context).size.width / 4,
            height: 100,
            margin: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Color(0xffF1F1F1),
              border: Border.all(width: 2.0, color: Color(0xff707070)),
            ),
            alignment: Alignment.bottomCenter,
            padding: EdgeInsets.fromLTRB(10, 0, 10, 5),
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              decoration: BoxDecoration(
                color: Color(0xffF1F1F1),
                border: Border.all(width: 2.0, color: Color(0xff707070)),
              ),
              child: Text(
                'Upload',
                style: TextStyle(fontSize: 10),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
