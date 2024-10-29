import 'package:flutter/material.dart';
import 'package:tarot_app/core/app_navigate/routes.dart';

class HomeMenuItem extends StatelessWidget{
  final String imageUrl;
  final String title;
  final Routes route;

  const HomeMenuItem({
    Key? key,
    required this.imageUrl,
    required this.title,
    required this.route,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ConstrainedBox(
      constraints: const BoxConstraints(
          maxWidth: 180,
          maxHeight: 250
      ),
      child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.0),
              image: DecorationImage(
                image: AssetImage(imageUrl),
                fit: BoxFit.fill
              )
          ),
          child: TextButton(
            child:
            Center(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5.0),
                  color: Colors.black,
                ),
                padding: const EdgeInsets.fromLTRB(5.0, 0.0, 5.0, 0.0),
                child: Text(title, style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 18, color: Colors.white)),
              ),
            ),
            onPressed: () {
              AppNavigator.push(context: context, route: route);
            },
          )
      ),
    );
  }
}