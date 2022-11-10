import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sqflite/sqflite.dart';
import 'package:text_field/Login.dart';
import 'package:text_field/Model.dart';

class form extends StatefulWidget {
  const form({Key? key}) : super(key: key);

  @override
  State<form> createState() => _formState();
}

class _formState extends State<form> {

  Database? db;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    initdatabase();

  }

  initdatabase()
  async {
   db = await Model().createDatabase();
  }

  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController contact = TextEditingController();
  TextEditingController Password = TextEditingController();
  TextEditingController conPassword = TextEditingController();
  TextEditingController Date = TextEditingController();
  bool nameerror = false;
  bool namevalid = false;
  bool emailerror = false;
  bool contacterror = false;
  bool passerror = false;
  bool conpasserror = false;
  bool DateError = false;
  bool hidepass = true;

  int textLength = 0;
  int maxLength = 10;

  String gender = "Male";
  String emailmsg = "";
  String passmsg = "";
  String contactmsg = "";

  bool music = false;
  bool play = false;
  bool reading = false;
  bool travelling = false;
  bool social = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Form",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
        ),
        body: ListView(
          children: [
            Container(
              alignment: Alignment.center,
              height: 40,
              width: double.infinity,
              child: Text("Regestration",style: GoogleFonts.poppins(
                textStyle: TextStyle(fontSize: 17,fontWeight: FontWeight.bold),
              ),),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextField(
                onChanged: (value) {
                  print(value);
                  if (nameerror) {
                    if (value.isNotEmpty) {
                      setState(() {
                        nameerror = false;
                      });
                    }
                  }
                },
                controller: name,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Enter Name",
                    labelText: "Name",
                    errorText: nameerror ? "Please Enter Valid Name" : null,
                    prefixIcon: Icon(Icons.person)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextField(
                onChanged: (value) {
                  if (emailerror) {
                    if (value.isNotEmpty) {
                      setState(() {
                        emailerror = false;
                      });
                    }
                  }
                },
                controller: email,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Enter Email Address",
                    labelText: "Email",
                    errorText:
                        emailerror ? emailmsg : null,
                    prefixIcon: Icon(Icons.email_outlined)),
              ),
            ),
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
                    errorText:
                        contacterror ? contactmsg : null,
                    prefixIcon: Icon(Icons.phone)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextField(
                onChanged: (value) {
                  if (passerror) {
                    if (value.isNotEmpty) {
                      setState(() {
                        passerror = false;
                      });
                    }
                  }
                },
                controller: Password,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Enter New Password",
                    labelText: "Password",
                    suffixIcon: IconButton(onPressed: () {
                        hidepass = !hidepass;
                        setState(() {

                        });
                    }, icon: hidepass?Icon(Icons.visibility):Icon(Icons.visibility_off)),
                    errorText:
                        passerror ? passmsg : null,
                    prefixIcon: Icon(Icons.lock)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextField(
                onChanged: (value) {
                  if (conpasserror) {
                    if (value.isNotEmpty) {
                      setState(() {
                        conpasserror = false;
                      });
                    }
                  }
                },
                controller: conPassword,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Enter Confirm Password",
                    labelText: "Confirm Password",
                    errorText:
                        conpasserror ? "Please Enter Your Valid Contact" : null,
                    prefixIcon: Icon(Icons.lock_outline)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextField(
                onChanged: (value) {
                  if (DateError) {
                    if (value.isNotEmpty) {
                      setState(() {
                        DateError = false;
                      });
                    }
                  }
                },
                controller: Date,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "DD / MM / YYYY",
                    labelText: "Birth Date",
                    errorText:
                        DateError ? "Please Enter Valid Date" : null,
                    prefixIcon: Icon(Icons.calendar_month_outlined)),
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 12),
              height: 40,
              alignment: Alignment.centerLeft,
              child: ListView(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                children: [
                  Container(alignment: Alignment.center,child: Text("Gender :   ")),
                      Radio(
                        value: "Male",
                        groupValue: gender,
                        onChanged: (value) {
                          gender = value.toString();
                          setState(() {});
                        },
                      ),
                  Container(alignment: Alignment.center,child: Text("Male     ")),
                      Radio(
                        value: "Female",
                        groupValue: gender,
                        onChanged: (value) {
                          gender = value.toString();
                          setState(() {});
                        },
                      ),
                  Container(alignment: Alignment.center,child: Text("Female     ")),
                      Radio(
                        value: "Other",
                        groupValue: gender,
                        onChanged: (value) {
                          gender = value.toString();
                          setState(() {});
                        },
                      ),
                  Container(alignment: Alignment.center,child: Text("Other     ")),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(margin: EdgeInsets.only(left: 15),alignment: Alignment.center,child: Text("Hobby :    ")),
                Expanded(child: Container(
                  margin: EdgeInsets.only(left: 10),
                  height: 40,
                  alignment: Alignment.center,
                  child: ListView(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    children: [
                      Checkbox(value: music, onChanged: (value) {
                        if (value != null) {
                          music = value;
                          setState(() {});
                        }
                      },),
                      Container(alignment: Alignment.center,child: Text("Music     ")),
                      Checkbox(value: play, onChanged: (value) {
                        if (value != null) {
                          play = value;
                          setState(() {});
                        }
                      },),
                      Container(alignment: Alignment.center,child: Text("Playing     ")),
                      Checkbox(value: reading, onChanged: (value) {
                        if (value != null) {
                          reading = value;
                          setState(() {});
                        }
                      },),
                      Container(alignment: Alignment.center,child: Text("Reading     ")),
                      Checkbox(value: travelling, onChanged: (value) {
                        if (value != null) {
                          travelling = value;
                          setState(() {});
                        }
                      },),
                      Container(alignment: Alignment.center,child: Text("Travelling     ")),
                      Checkbox(value: social, onChanged: (value) {
                        if (value != null) {
                          social = value;
                          setState(() {});
                        }
                      },),
                      Container(alignment: Alignment.center,child: Text("Social Media     ")),
                    ],
                  ),
                ),)
              ],
            ),
            ElevatedButton(
                onPressed: () async{
                  String Name = name.text;
                  String Email = email.text;
                  String Phone = contact.text;
                  String pass = Password.text;
                  String Conpass = conPassword.text;
                  String date = Date.text;
                  bool emailValid = RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(Email);
                  bool passValid = RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$').hasMatch(pass);


                  if (Name.isEmpty) {
                    setState(() {
                      nameerror = true;
                    });
                  }

                  else if (Email.isEmpty) {
                    setState(() {
                      emailerror = true;
                      emailmsg = "Enter Email Address";
                    });
                  }
                  else if(!emailValid)
                    {
                      setState(() {
                        emailerror = true;
                        emailmsg = "Please Enter Valid Email Address";
                      });
                    }
                  else if (Phone.isEmpty) {
                    setState(() {
                      contacterror = true;
                      contactmsg = "Enter your Contact";
                    });
                  }
                  else if (Phone.length < 10) {
                    setState(() {
                      contacterror = true;
                      contactmsg = "Please Enter 10 digit Contact";
                    });
                  }
                  else if (pass.isEmpty) {
                    setState(() {
                      passerror = true;
                      passmsg = "Enter your password";
                    });
                  }
                  else if (!passValid) {
                    setState(() {
                      passerror = true;
                      passmsg = "Please Enter Valid Formatted password";
                    });
                  }
                  else if (Conpass.isEmpty || pass != Conpass) {
                    setState(() {
                      conpasserror = true;
                    });
                  }
                  else if (date.isEmpty) {
                    setState(() {
                      DateError = true;
                    });
                  }
                  else
                    {
                      // Query of Insert Data
                      // "insert into contactbook (column1_name,column2_name) values ('$value1','$value2')"

                      String qry = "insert into register (name,email,contact,Password,conf_Pass,Date) values ('$Name','$Email','$Phone','$pass','$Conpass','$date')";
                      int a = await db!.rawInsert(qry);
                      print("ID : $a");
                      Navigator.push(context, MaterialPageRoute(builder: (context) {
                        return Login();
                      },));
                    }


                },
                child: Text("Submit")),
            TextButton(onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return Login();
              },));
            }, child: Text("Skip"))
          ],
        ));
  }
}
