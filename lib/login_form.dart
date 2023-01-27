import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:remind_me/animation_delay.dart';


class LoginForm extends StatefulWidget {
  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  var _obscureText = true;
  var _username="";

  _checkLoginValue(){
    if(_formKey.currentState!.validate()){
      return;
    }else{
      return 'Merci de remplir le formumaire de connexion ';
    }
  }
 var color_green = const Color(0xFF427577);
  final GlobalKey<FormState> _formKey= GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: 30,
      ),
  child: Form(
    key: _formKey,
      child: Column(
        children: [
          DelayedAnimation(
            delay: 2000,
            child: TextFormField(
              decoration: InputDecoration(
                labelText: 'Your Email',
                labelStyle: TextStyle(
                  color: Colors.grey[400],
                ),
              ),
              validator: (value) {
                if(value!.isEmpty){
                  return "Entrez une pseudo";
                }
                return null;
              },
              onSaved: (value) {
                _username=value!;
              },

            ),
          ),
          SizedBox(height: 20),
          DelayedAnimation(
            delay: 2500,
            child: TextField(
              obscureText: _obscureText,
              decoration: InputDecoration(
                labelStyle: TextStyle(
                  color: Colors.grey[400],
                ),
                labelText: 'Password',
                suffixIcon: IconButton(
                  icon: Icon(
                    Icons.visibility,
                    color: Colors.black,
                  ),
                  onPressed: () {
                    setState(() {
                      _obscureText = !_obscureText;
                    });
                  },
                ),
              ),
            ),
          ),
          DelayedAnimation(
            delay: 1500,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: StadiumBorder(),
                primary: color_green,
                padding: EdgeInsets.symmetric(
                  horizontal: 125,
                  vertical: 10,
                ),
              ),
              child: Text(
                'Connexion',
                style: GoogleFonts.poppins(
                  color: Colors.white,
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                ),
              ),
              onPressed: _checkLoginValue,
            ),
          ),
        ],
      ),
  ),
    );
  }
}