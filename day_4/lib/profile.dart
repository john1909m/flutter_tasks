import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff190050),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 150,
              height: 150,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                gradient: LinearGradient(
                  colors: [
                    Color(0xFF0D47A1),
                    Color(0xFF004D40),
                  ],
                ),
              ),
              child: const Padding(
                padding: EdgeInsets.all(5),
                child: CircleAvatar(
                  backgroundImage: AssetImage("assets/IMG_7859ddrr.webp",),
                ),
              ),
            ),
            SizedBox(height: 10,),
            Text("John Emil",style: GoogleFonts.archivoBlack(fontSize: 30,color: Colors.white),),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Card(
                    color: Color(0xff3400ad),

                  child: Padding(
                    padding: EdgeInsets.all(5),
                    child: Text("Full Stack Developer",style:TextStyle(fontSize: 12,fontWeight: FontWeight.bold, color: Color(0xffffffff))),

                  ),

                ),
                Card(
                    color: Color(0xff3400ad),

                  child: Padding(
                    padding: EdgeInsets.all(5),
                    child: Text("Graphic Designer",style:TextStyle(fontSize: 12,fontWeight: FontWeight.bold, color: Color(0xffffffff))),

                  ),

                ),
              ],
            ),
            Divider(
              color: Colors.white,
              thickness: 2,
              indent: 30,
              endIndent: 30,
            ),
            SizedBox(height: 10,),
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
                side: const BorderSide(
                  color: Color(0xff3400ad),
                  width: 2,
                ),
              ),
              color: Colors.white10,

              child: Padding(
                padding:EdgeInsets.all(12),
                child: Row(
                  children: [
                    Icon(Icons.phone,size: 25,color: Colors.white,),
                    SizedBox(width: 20,),
                    Text("01200158852",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,color: Colors.white),),
                  ],
                ),
              ),
            ),
            SizedBox(height: 10,),
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
                side: const BorderSide(
                  color: Color(0xff3400ad),
                  width: 2,
                ),
              ),
              color: Colors.white10,
              child: Padding(
                padding:EdgeInsets.all(12),
                child: Row(
                  children: [
                    Icon(Icons.email,size: 25,color: Colors.white,),
                    SizedBox(width: 20,),
                    Text("johnemil21@yahoo.com",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,color: Colors.white),),
                  ],
                ),
              ),
            ),
            SizedBox(height: 10,),
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
                side: const BorderSide(
                  color: Color(0xff3400ad),
                  width: 2,
                ),
              ),
              color: Colors.white10,
              child: Padding(
                padding:EdgeInsets.all(12),
                child: Row(
                  children: [
                    Icon(Icons.location_city_sharp,size: 25,color: Colors.white,),
                    SizedBox(width: 20,),
                    Text("Giza - October",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,color: Colors.white),),
                  ],
                ),
              ),
            ),


          ],
        ),
      ),
    );
  }
}
