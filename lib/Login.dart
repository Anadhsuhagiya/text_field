import 'package:flutter/material.dart';
import 'package:text_field/forgot.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController Email = TextEditingController();
  TextEditingController Pass = TextEditingController();
  bool EmailError = false;
  bool PassError = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Login"),
      ),
      body: ListView(
        children: [
          Container(
            height: 200,
            width: 200,
            child: Image.asset("images/1.jpg"),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextField(
              onChanged: (value) {
                print(value);
                if (EmailError) {
                  if (value.isNotEmpty) {
                    setState(() {
                      EmailError = false;
                    });
                  }
                }
              },
              controller: Email,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Enter Email",
                  labelText: "Email",
                  errorText: EmailError ? "Please Enter Valid Email" : null,
                  prefixIcon: Icon(Icons.mail_outline)),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextField(
              onChanged: (value) {
                print(value);
                if (PassError) {
                  if (value.isNotEmpty) {
                    setState(() {
                      PassError = false;
                    });
                  }
                }
              },
              controller: Email,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Enter Password",
                  labelText: "Password",
                  errorText: PassError ? "Please Enter Valid Password" : null,
                  prefixIcon: Icon(Icons.key)),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: TextButton(onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return forgot();
              },));
            }, child: Text("Forgot Password ?")),
          ),
          Padding(
            padding: EdgeInsets.only(left: 15,right: 15),
            child: ElevatedButton(onPressed: () {}, child: Text("Login")),
          )
        ],
      ),
    );
  }
}
