import 'package:flutter/material.dart';

class HomePage2 extends StatelessWidget {
  const HomePage2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      width: double.maxFinite,
      height: double.maxFinite,
      decoration: const BoxDecoration(
          image:
              DecorationImage(image: AssetImage("assets/images/bgimage.png"), fit: BoxFit.cover)),
      child: Stack(
        children: [
          const Positioned(
            top: 48,
            left: 24,
            right: 24,
            child: Text("Vyper India", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),),
          ),
          Positioned(
            bottom: 30,
            left: 24,
            right: 24,
            child: SizedBox(
              width: double.maxFinite,
              height: 250,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("Software Solution",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.bold)),
                  const SizedBox(height: 8.0),
                  const Text(
                      "We provide quality web and application designing services through our experienced developers.",
                      style: TextStyle(
                          color: Colors.white, fontSize: 14, height: 1.5)),
                  const SizedBox(height: 40.0),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, "slidable");
                    },
                    child: const Text(
                      "Log In",
                      style: TextStyle(color: Colors.blue),
                    ),
                    style: _buttonStyle(bgColor: Colors.white),
                  ),
                  const SizedBox(height: 8.0),
                  OutlinedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, "slidable");
                    },
                    child: const Text(
                      "Sign up",
                      style: TextStyle(color: Colors.white),
                    ),
                    style: _buttonStyle(),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    ));
  }

  ButtonStyle _buttonStyle({Color bgColor = Colors.amber}) {
    return ButtonStyle(
        minimumSize:
            MaterialStateProperty.all(const Size(double.maxFinite, 50)),
        backgroundColor: MaterialStateProperty.all(bgColor));
  }
}
