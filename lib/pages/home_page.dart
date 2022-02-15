import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          width: double.maxFinite,
          height: double.maxFinite,
          decoration: const BoxDecoration(
            image: DecorationImage(image: AssetImage("assets/images/bgimage.png"), fit: BoxFit.cover)
          ),
          padding: const EdgeInsets.symmetric(vertical: 30.0, horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Your Software Solution",
                  style: GoogleFonts.akronim(
                      textStyle: const TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.w500))
                  ),
              const SizedBox(height: 8.0),
              const Text(
                  "We provide quality web and application designing services through our experienced developers.",
                  style: TextStyle(
                      color: Colors.white, fontSize: 14, height: 1.5)),
              const SizedBox(height: 40.0),
              ElevatedButton(
                onPressed: (){_onPressed(context);},
                child: const Text("Log In", style: TextStyle(
                  color: Colors.blue
                ),),
                style: _buttonStyle(bgColor: Colors.white),
              ),
              const SizedBox(height: 8.0),
              OutlinedButton(
                onPressed: (){_onPressed(context);},
                child: const Text("Sign up", style: TextStyle(
                  color: Colors.white
                ),),
                style: _buttonStyle(),
              )
            ],
          ),
        ));
  }

  void _onPressed(BuildContext context) {
    Navigator.pushNamed(context, "slidable");
  }

  ButtonStyle _buttonStyle({Color bgColor = Colors.amber}) {
    return ButtonStyle(
      minimumSize: MaterialStateProperty.all(const Size(double.maxFinite, 50)),
      backgroundColor: MaterialStateProperty.all(bgColor)
    );
  }
}
