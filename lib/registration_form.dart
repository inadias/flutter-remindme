import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:remind_me/animation_delay.dart';


class RegisterForm extends StatefulWidget {
  @override
  _RegisterFormState createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  var _obscureText = true;
  final GlobalKey<FormState> _formKey= GlobalKey<FormState>();
  final color_green = const Color(0xFF427577);
  var _username="";
   var _email="";


   TextEditingController _password = TextEditingController();
   TextEditingController _confirmPassword = TextEditingController();

  _checkRegistrationValue(){
    if(_formKey.currentState!.validate()){
      return;
    }else{
      return 'Merci de remplir le formumaire de connexion ';
    }
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: 30,
      ),
      child: Form(
        key:_formKey,
      child: Column(
        children: [
          DelayedAnimation(
            delay: 2000,
            child: TextFormField(

              decoration: InputDecoration(
                labelText: 'Username',
                labelStyle: TextStyle(
                  color: Colors.grey[400],
                ),
              ),
              validator: (value) {
                if(value!.isEmpty){
                  return "Le champs Username est vide";
                }
                if(value!.length <4 ){
                return " La valeur entrée est trop courte";
                }
                if(value!.length >10 ){
                  return " La valeur entrée est trop courte";
                }


                return null;
              },
              onSaved: (value) {
                _username=value!;
              },
            ),
          ),

          SizedBox(height: 10),
          DelayedAnimation(
            delay: 2000,
            child: TextFormField(
              decoration: InputDecoration(
                labelText: 'Email',
                labelStyle: TextStyle(
                  color: Colors.grey[400],
                ),
              ),
              validator: (value) {
                if(value!.isEmpty){
                  return "Le champs Email est vide";
                }
                if(!RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                    .hasMatch(value)){
                   return "Format de l'email est incorrecte ";
                }
                return null;
              },
              onSaved: (value) {
                _email=value!;
              },
            ),
          ),
          SizedBox(height: 10),
          DelayedAnimation(
            delay: 2500,
            child: TextFormField(
              controller: _password,
              obscureText: _obscureText,
              decoration: InputDecoration(
                labelStyle: TextStyle(
                  color: Colors.grey[400],
                ),
                labelText: 'Mot de passe',
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
              validator: (value) {
                if(value!.isEmpty){
                  return "Le champs Mot de passe est vide";
                }

                return null;
              },

            ),
          ),
          DelayedAnimation(
            delay: 2500,
            child: TextFormField(
              controller: _confirmPassword,
              obscureText: _obscureText,
              decoration: InputDecoration(
                labelStyle: TextStyle(
                  color: Colors.grey[400],
                ),
                labelText: 'Confirmer mot de passe',
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
              validator: (value) {
                if(value!.isEmpty){
                  return "Le champs Username est vide";
                }
             if( _password.text != _confirmPassword){
               return "Ces mots de passe ne correspondent pas. Veuillez réessayer";
             }

                return null;
              },

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
                  vertical: 13,
                ),
              ),
              child: Text(
                'Envoyer',
                style: GoogleFonts.poppins(
                  color: Colors.white,
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                ),
              ),
              onPressed: _checkRegistrationValue,
            ),
          ),
        ],
      ),
      ),
    );
  }
}