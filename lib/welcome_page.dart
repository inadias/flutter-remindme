import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:remind_me/animation_delay.dart';
import 'package:remind_me/login_page.dart';
import 'package:remind_me/main.dart';
import 'package:remind_me/todo_list.dart';


class WelcomePage extends StatefulWidget {

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFFFFF),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.symmetric(
            vertical: 60,
            horizontal: 30
          ),
          child: Column(
            children: [
              DelayedAnimation(
                  delay: 1500,
                  child:
                      Container(
                        height: 170,
                        width: 250,
                        child: Image.asset('images/logo_01.png'),

                    )
              ),


              DelayedAnimation(
                  delay: 2500,
                  child:
                  Container(
                    height: 330,
                    child: Image.asset('images/image-man-thinking.png'),

                  ),

              ),

              DelayedAnimation(
                delay: 3500,
                child:
                Container(

                  margin: EdgeInsets.only(
                    bottom: 50
                  ),
                  child: Text(
                    "STAY ALERT AND DON'T MISS ANYTHING ",textAlign:TextAlign.center,
                    style: GoogleFonts.poppins(
                    color: Colors.grey,
                      fontSize: 16,
                      fontWeight: FontWeight.w500

                  ),
                  ),

                ),

              ),
              DelayedAnimation(
                delay: 2500,
                child:
                Container(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      
                      shape: StadiumBorder(),
                      padding: EdgeInsets.all(13)
                      
                    ),
                    child: Text('Commencer'),
                    onPressed: (){
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context)=>LoginPage()),);

                    },
                  ),

                ),

              ),


            ],
          ),
        ),
      ),
      drawer: TodoList(),
    );
  }
}
