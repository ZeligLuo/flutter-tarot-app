import 'dart:math';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:tarot_app/core/constant.dart';

class LoadingScreen extends StatelessWidget{
  const LoadingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String randomLoadingImage = loadingImageList[Random().nextInt(loadingImageList.length)];

    // TODO: implement build
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ConstrainedBox(
            constraints: const BoxConstraints(
              maxWidth: 300,
              maxHeight: 300
            ),
            child: Lottie.asset("assets/images/$randomLoadingImage", fit: BoxFit.contain)
          ),
          const Text("Gathering universe forces. Please wait ...", style: TextStyle(fontSize: 16, color: Colors.black45)),
        ],
      ),
    );
  }
}