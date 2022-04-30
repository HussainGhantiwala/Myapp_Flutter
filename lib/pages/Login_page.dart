// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:flutter_application_1/utilities/routes.dart';

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool changeButton =
      false; //we put a value Changebutton but for now its false nut later we will chnage it to true
  String name = '';
  final _formKey = GlobalKey<FormState>();
  moveToHome(BuildContext context) async {
    //using async so that we can use await.
    //when you click the login button you will be directed to home page
    if (_formKey.currentState!.validate()) {
      setState(() {
        changeButton = true;
      });
      await Future.delayed(Duration(
          seconds:
              1)); //await is a function when you want your particular part of code to work at a particular duration.
      await Navigator.pushNamed(context, MyRoutes.homeRoute);
      setState(() {
        changeButton = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: SingleChildScrollView(
        //if the widget is big it will help to scroll
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Image.asset(
                  "Assets/images/Hi.png"), //adding image ton your app so for now i am adding this to my login page
              Text(
                "Welcome $name", //Whwn the user enters his/her name on the  username title his/her name will be written beside 'Welcome' thts why the stringe is empty above and to declare something we use '$'
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height:
                    35.0, //space between the text like writing WELCOME 20px dowm(height) from the pic
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: 16.0, horizontal: 35.0),
                child: Column(
                  children: [
                    TextFormField(
                      //nothing but decorating your app or adding text as you can see below
                      decoration: InputDecoration(
                          hintText: "Enter Username", labelText: "Username"),
                      validator: (value) {
                        //The validator method returns a string containing the error message when the user input is invalid or null if the user input is valid
                        if (value!.isEmpty) {
                          //when the value is empty it will return "Please enter user name"
                          return "Please enter Username";
                        } else if (value.length < 6) {
                          //we use lenght here to see if the user has atleast entered 6 characters.
                          return "Username must contain 6 characters";
                        }
                        return null; //if he did then it will return null meaning no error.
                      },
                      onChanged: (value) {
                        name = value;
                        setState(() {});
                      },
                    ),
                    SizedBox(
                      height: 10.0, //
                    ),
                    TextFormField(
                      obscureText: true, //nothing but hiding your password
                      decoration: InputDecoration(
                          hintText: "Enter Password", labelText: "Password"),
                      validator: (String? value) {
                        if (value!.isEmpty) {
                          return "Enter the Password";
                        } else if (value.length < 8) {
                          return "Password must contain 8 characters";
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: 40.0,
                    ),
                    InkWell(
                      //inkwell id best or more likr good for animation
                      onTap: () => moveToHome(
                          context), //if tap the log in  button it will move to home screen.
                      child: AnimatedContainer(
                        duration: Duration(
                            seconds:
                                1), //animated container requires Duration its like  must , it returns the animation at the exact duration written here.
                        width: changeButton
                            ? 50
                            : 150, //we are designing a button here by giving width,
                        //but were kept "ChangeButton?50:150" because if the change button value is true the width will be 50 if false 150. and '?' means true ':' false when a boolian is giving
                        height: 50,
                        alignment: Alignment.center,
                        child: changeButton
                            ? Icon(Icons.done,
                                color: Colors
                                    .white) //the icon will turn into tick mark when the Login button is clicked.
                            : Text(
                                "Login", //from here we are designing the button like adding text colour of the text and all
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold),
                              ),
                        decoration: BoxDecoration(
                          //from here we are adding decoration to box like the colour of the box and all
                          color: Colors.deepPurple,
                          borderRadius: BorderRadius.circular(changeButton
                              ? 50
                              : 8), //same like width if the ChangeButton is true the corner will be 50 if flase then 8
                        ),
                      ),
                    )
                    //ElevatedButton(
                    //adding button to your app
                    //child: Text(
                    //"Login",
                    //textAlign: TextAlign.center,
                    //),
                    //style: TextButton.styleFrom(minimumSize: Size(80, 43)),
                    //onPressed: () {
                    //Navigator.pushNamed(context, MyRoutes.homeRoute);
                    //},
                    //)
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
