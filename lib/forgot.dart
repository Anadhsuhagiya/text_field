import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';

class forgot extends StatefulWidget {
  const forgot({Key? key}) : super(key: key);

  @override
  State<forgot> createState() => _forgotState();
}

class _forgotState extends State<forgot> {

  int textLength = 0;
  int maxLength = 10;
  bool contacterror = false;
  TextEditingController contact = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Forgot Password"),
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextField(
              onChanged: (value) {
                setState(() {
                  textLength = value.length;
                });
                if (contacterror) {
                  if (value.isNotEmpty) {
                    setState(() {
                      contacterror = false;
                    });
                  }
                }
              },
              controller: contact,
              keyboardType: TextInputType.phone,
              maxLength: 10,
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  counter: Offstage(),
                  suffixText:
                  '${textLength.toString()}/${maxLength.toString()}',
                  hintText: "Enter Your Contact",
                  labelText: "Contact",
                  prefixIcon: Icon(Icons.phone)),
            ),
          ),
          TextButton(onPressed: () {
            String number = contact.text;

          }, child: Text("Send OTP")),

        ],
      ),
    );
  }
}
