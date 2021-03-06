import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool _secureText = true;

  TextEditingController _passwordController = TextEditingController();
  String _passwordError;

  var _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Yoga Aldian Putra_181011450488"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              TextField(
                decoration: InputDecoration(
                    hintText: "Your Name",
                    labelText: "Nama",
                    labelStyle: TextStyle(fontSize: 24, color: Colors.black),
                    border: InputBorder.none,
                    fillColor: Colors.black12,
                    filled: true),
                obscureText: false,
                maxLength: 20,
              ),
              SizedBox(
                height: 16,
              ),
              TextField(
                decoration: InputDecoration(
                    hintText: "Detailed Description",
                    labelText: "Description",
                    labelStyle: TextStyle(fontSize: 24, color: Colors.black),
                    border: UnderlineInputBorder()),
                obscureText: false,
                maxLines: 3,
              ),
              SizedBox(
                height: 16,
              ),
              TextField(
                controller: _passwordController,
                decoration: InputDecoration(
                    hintText: "Password",
                    labelText: "Password",
                    errorText: _passwordError,
                    labelStyle: TextStyle(fontSize: 24, color: Colors.black),
                    border: OutlineInputBorder(),
                    suffixIcon: IconButton(
                      icon: Icon(
                          _secureText ? Icons.remove_red_eye : Icons.security),
                      onPressed: () {
                        setState(() {
                          _secureText = !_secureText;
                        });
                      },
                    )),
                obscureText: _secureText,
              ),
              SizedBox(
                height: 16,
              ),
              Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      TextFormField(
                        validator: (String value){
                          if(value.length < 10)
                            return "Enter at least 10 char";
                          else
                            return null;
                        },
                        decoration: InputDecoration(
                            hintText: "Name",
                            labelText: "Nama",
                            labelStyle: TextStyle(fontSize: 24, color: Colors.black),
                            border: OutlineInputBorder()),
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      TextFormField(
                        validator: (String value){
                          if(value.length < 3)
                            return "Enter at least 3 char";
                          else
                            return null;
                        },
                        decoration: InputDecoration(
                            hintText: "Password",
                            labelText: "Password",
                            labelStyle: TextStyle(fontSize: 24, color: Colors.black),
                            border: OutlineInputBorder()),
                        obscureText: true,
                      ),
                    ],
                  )),
              SizedBox(
                height: 16,
              ),
              RaisedButton(onPressed: () {
                print("Password : " + _passwordController.text);
                setState(() {
                  print("Form Validation : " + _formKey.currentState.validate().toString());
                  if(_passwordController.text.length < 3)
                    _passwordError = "Masukkan Minimal 3 Karakter";
                  else
                    _passwordError = null;

                });
              })
            ],
          ),
        ),
      ),
    );
  }
}
