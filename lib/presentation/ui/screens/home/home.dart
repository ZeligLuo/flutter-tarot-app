import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tarot_app/presentation/ui/widgets/home_menu_item.dart';
import 'package:tarot_app/core/app_navigate/routes.dart';

class HomeScreen extends StatelessWidget{
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: ListView(
        children: [
          const Padding(
            padding: EdgeInsets.fromLTRB(0.0, 30.0, 0.0, 30.0),
            child: Center(
                child: Column(
                  children: [
                    Text("Tarot", style: TextStyle(fontSize: 26, fontWeight: FontWeight.w700)),
                    SizedBox(
                      height: 10,
                    ),
                    Text("Let go and trust the universe", style: TextStyle(fontSize: 16, fontStyle: FontStyle.italic, color: Colors.black54)),
                  ],
                )
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.fromLTRB(0.0, 0.0, 10.0, 0.0),
                child: Column(
                  children: [
                    HomeMenuItem(
                      imageUrl: "assets/images/menu_item_1.jpg",
                      title: "Daily Tarot",
                      route: Routes.dailyTarot
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    HomeMenuItem(
                      imageUrl: "assets/images/menu_item_2.jpg",
                      title: "Booking",
                      route: Routes.booking,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(5.0, 0.0, 0.0, 0.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ConstrainedBox(
                      constraints: const BoxConstraints(
                        maxWidth: 180
                      ),
                      child: Container(
                        padding: const EdgeInsets.fromLTRB(10.0, 15.0, 10.0, 15.0),
                        decoration: BoxDecoration(
                            border: Border.all(
                                color: Colors.black12
                            ),
                            borderRadius: BorderRadius.circular(15.0)
                        ),
                        child: const Text("Tap to choose one", style: TextStyle(fontSize: 20, fontStyle: FontStyle.italic, color: Colors.black38), textAlign: TextAlign.center, softWrap: true,),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const HomeMenuItem(
                      imageUrl: "assets/images/menu_item_3.jpg",
                      title: "Tea Leaf",
                      route: Routes.teaLeaf,
                    ),
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}