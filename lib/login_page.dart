import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:remind_me/animation_delay.dart';
import 'package:remind_me/login_form.dart';
import 'package:remind_me/main.dart';
import 'package:remind_me/registration_page.dart';



class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
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
                       Text("Il est temps de Se",
                       textAlign: TextAlign.center,
                       style: GoogleFonts.poppins(
                         color: color_green,
                         fontSize: 18,
                           fontWeight: FontWeight.w600
                       ),
                       ),
                       SizedBox(height: 10,),
                       Text("Connecter",
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
            SizedBox(height: 20),
            LoginForm(),
            SizedBox(height: 25),

            DelayedAnimation(
              delay: 1500,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: StadiumBorder(),
                  primary: color_red,
                  padding: EdgeInsets.symmetric(
                    horizontal: 125,
                    vertical: 10,
                  ),
                ),
                child: Text(
                  'Inscription',
                  style: GoogleFonts.poppins(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => RegisterPage(),
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 30),
            Align(
              alignment: Alignment.centerRight,
              child: Padding(
                padding: EdgeInsets.only(right: 35),
                child: TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: DelayedAnimation(
                    delay: 2800,
                    child: Text(
                      "SKIP",
                      style: GoogleFonts.poppins(
                        color: color_green,
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],






        )

      ),

    );
  }
}
