import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lottie/lottie.dart';
import 'package:tarot_app/data/repositories/tarot_repository.dart';
import 'package:tarot_app/data/source/firebase/firebase_datasource.dart';
import 'package:tarot_app/presentation/states/tarot/tarot_cubit.dart';
import 'package:tarot_app/presentation/states/tarot/tarot_state.dart';
import 'package:tarot_app/presentation/ui/widgets/error_screen.dart';
import 'package:tarot_app/presentation/ui/widgets/loading_screen.dart';
import '../../../../core/app_navigate/routes.dart';
import '../../widgets/tarot_card_carousel.dart';

class DailyTarotScreen extends StatefulWidget {
  const DailyTarotScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => DailyTarotScreenState();
}

class DailyTarotScreenState extends State<DailyTarotScreen>
    with TickerProviderStateMixin {
  late AnimationController _initCardsAnimController;
  late AnimationController _onChooseAnimController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _initCardsAnimController = AnimationController(vsync: this);
    _onChooseAnimController = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _initCardsAnimController.dispose();
    _onChooseAnimController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        body: SafeArea(
          child: BlocBuilder<TarotCubit, TarotState>(
            builder: (context, state) {
              TarotCubit tarotCubit = context.read<TarotCubit>();
              if (state is LoadingState) {
                return const LoadingScreen();
              } else if (state is LoadedTarotState ||
                  state is OnPickingTarotCardState) {
                return Stack(
                  children: [
                    Stack(
                      children: [
                        Container(
                          height: 300,
                          decoration: const BoxDecoration(
                              image: DecorationImage(
                                  fit: BoxFit.fill,
                                  image: AssetImage(
                                      "assets/images/daily_tarot_bg.png"))),
                        ),
                        Column(
                          children: [
                            const SizedBox(
                              height: 50,
                            ),
                            Container(
                              color: Colors.white,
                              height: 280,
                              width: 300,
                              child: Lottie.asset(
                                  "assets/images/meditation.json",
                                  fit: BoxFit.contain),
                            ),
                            const SizedBox(
                              height: 40,
                            ),
                            const Text("Daily tarot card",
                                style: TextStyle(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 20)),
                            const SizedBox(
                              height: 10,
                            ),
                            const Padding(
                                padding: EdgeInsets.fromLTRB(
                                    15.0, 0.0, 15.0, 0.0),
                                child: Text(
                                    "Choose 3 cards to see what guidance the universe has for you today.",
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontStyle: FontStyle.italic,
                                        color: Colors.black54),
                                    textAlign: TextAlign.center)),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                                "Picked: (${tarotCubit.pickedCards.length}/3)",
                                style: const TextStyle(
                                    fontSize: 14, color: Colors.black54)),
                            const SizedBox(
                              height: 40,
                            ),
                            TarotCardCarousel(
                                onChooseAnimController:
                                _onChooseAnimController)
                                .animate(
                                controller: _initCardsAnimController,
                                autoPlay: true)
                                .fadeIn(duration: 900.ms)
                                .shimmer(
                                blendMode: BlendMode.srcOver,
                                color: Colors.white12)
                                .move(
                                begin: const Offset(-30, 0),
                                curve: Curves.easeOutQuad)
                                .animate(
                                controller: _onChooseAnimController,
                                autoPlay: false)
                                .fadeOut(duration: 600.ms),
                            const SizedBox(
                              height: 20,
                            ),
                            const Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(FontAwesomeIcons.arrowLeft,
                                    color: Colors.black26),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                    "Swipe left and right to move, tap on card to select",
                                    style: TextStyle(
                                        fontSize: 12,
                                        color: Colors.black54)),
                                SizedBox(
                                  width: 10,
                                ),
                                Icon(FontAwesomeIcons.arrowRight,
                                    color: Colors.black26)
                              ],
                            )
                          ],
                        ),
                      ],
                    ),
                    if (state is OnPickingTarotCardState &&
                        state.onPickingCard)
                      Visibility(
                          visible: state.onPickingCard,
                          child: Positioned(
                            top: tarotCubit.chosenCardYPosition - 29,
                            right: (MediaQuery.of(context).size.width / 2) -
                                tarotCubit.chosenCardXPosition -
                                30,
                            child: Container(
                                width: MediaQuery.of(context).size.width,
                                padding: const EdgeInsets.fromLTRB(
                                    0.0, 10.0, 0.0, 10.0),
                                alignment: Alignment.center,
                                child: Image.asset(
                                    "assets/images/tarot-back.png",
                                    width: 60)
                                    .animate(delay: 1600.ms)
                                    .moveX(
                                    begin: 0,
                                    end: tarotCubit.chosenCardYPosition,
                                    duration: 1500.ms)
                                    .callback(callback: (_) {
                                  tarotCubit.pickOneCardCompleted();
                                  //reset all animation
                                  _initCardsAnimController.reset();
                                  _onChooseAnimController.reset();
                                  _initCardsAnimController.forward();

                                  if (tarotCubit.pickedCards.length == 3) {
                                    AppNavigator.go(context: context, route: Routes.dailyMessage);
                                  }
                                })),
                          )),
                  ],
                );
              } else {
                return const ErrorScreen();
              }
            },
          )
        )
    );
  }
}
