// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:flutter_application_1/utilities/routes.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: SingleChildScrollView(
        //if the widget is big it will help to scroll
        child: Column(
          children: [
            Image.asset(
                "Assets/images/login_image.png"), //adding image ton your app so for now i am adding this to my login page
            Text(
              "Welcome!",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height:
                  35.0, //space between the text like writing WELCOME 20px dowm(height) from the pic
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 16.0, horizontal: 35.0),
              child: Column(
                children: [
                  TextFormField(
                    //nothing but decorating your app or adding text as you can see below
                    decoration: InputDecoration(
                        hintText: "Enter Username", labelText: "Username"),
                  ),
                  SizedBox(
                    height: 10.0, //
                  ),
                  TextFormField(
                    obscureText: true, //nothing but hiding your password
                    decoration: InputDecoration(
                        hintText: "Enter Password", labelText: "Password"),
                  ),
                  SizedBox(
                    height: 15.0,
                  ),
                  ElevatedButton(
                    //adding button to your app
                    child: Text(
                      "Login",
                      textAlign: TextAlign.center,
                    ),
                    style: TextButton.styleFrom(minimumSize: Size(80, 43)),
                    onPressed: () {
                      Navigator.pushNamed(context, MyRoutes.homeRoute);
                    },
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
