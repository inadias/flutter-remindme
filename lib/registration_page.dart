import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:remind_me/animation_delay.dart';
import 'package:remind_me/registration_form.dart';
import 'package:remind_me/main.dart';


class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white.withOpacity(0),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black,
            size: 25,
          ),
          onPressed: (){
            Navigator.pop(context);

          },
        ),
      ),
      body: SingleChildScrollView(
          child: Column(
            children: [
              DelayedAnimation(delay: 500,
                  child: Container(
                    height: 250,
                    child: Image.asset('images/connexion_logo.png'),
                  )
              ),
              DelayedAnimation(delay: 1000,

                  child: Container(
                    margin: const EdgeInsets.symmetric(
                        horizontal: 125
                    ),
                    child: Column(
                      children: [
                        Text("Inscription",
                          style: GoogleFonts.poppins(
                              color: color_green,
                              fontSize: 20,
                              fontWeight: FontWeight.w600
                          ),


                        )
                      ],
                    ),
                  )
              ),

              RegisterForm(),
              SizedBox(height: 20),


            ],






          )

      ),

    );
  }
}
