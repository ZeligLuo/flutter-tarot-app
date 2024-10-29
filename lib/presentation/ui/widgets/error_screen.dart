import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class ErrorScreen extends StatelessWidget{
  const ErrorScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Lottie.asset("assets/images/error-cat.json", width: 200, height: 200),
            RichText(
              text: TextSpan(
                  children: [
                    const TextSpan(
                       text: "Error!",
                      style: TextStyle(color: Colors.red, fontWeight: FontWeight.w700)
                    ),
                    const TextSpan(
                        text: " Something went wrong. ",
                        style: TextStyle(color: Colors.black)
                    ),
                    WidgetSpan(
                        child: GestureDetector(
                          onTap: (){
                            //context.pop();
                          },
                          child: const Text("Tap to go back", style: TextStyle(
                            color: Colors.blueAccent
                          ),),
                        )
                    )
                  ]
              ),
            )
          ],
        ),
      ),
    );
  }
}