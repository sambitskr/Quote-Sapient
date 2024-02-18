import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quote_of_the_day/pages/home.dart';
import 'package:quote_of_the_day/utilities/hidden_drawer.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    double height = 40;
    double width = 40;
    return Scaffold(
      backgroundColor: Color.fromRGBO(97, 130, 100, 1),
      body: Container(
        margin: EdgeInsets.only(right: 20, left: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Spacer(),
            Image.asset(
              "assets/quote.png",
              color: Colors.white,
              height: height,
              width: width,
            ),
            SizedBox(
              height: 20,
            ),
            RichText(
              text: TextSpan(
                style: TextStyle(fontSize: 50, color: Colors.black),
                children: [
                  const TextSpan(
                    text: "Spark\n",
                    style: TextStyle(color: Colors.white),
                  ),
                  TextSpan(
                    text: "Your Imagination!",
                    style: GoogleFonts.lato(
                      textStyle: TextStyle(fontSize: 50, color: Colors.white),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 50,
            ),
            Container(
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(15)),
              height: 40,
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => HiddenDrawerPage(),
                    ),
                  );
                },
                child: Text("Let's Go"),
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStatePropertyAll<Color>(Colors.black),
                ),
              ),
            ),
            Spacer(),
          ],
        ),
      ),
    );
  }
}
