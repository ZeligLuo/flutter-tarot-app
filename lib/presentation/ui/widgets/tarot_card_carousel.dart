import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infinite_carousel/infinite_carousel.dart';
import 'package:tarot_app/presentation/states/tarot/tarot_cubit.dart';
import 'package:tarot_app/presentation/states/tarot/tarot_state.dart';

class TarotCardCarousel extends StatefulWidget {
  AnimationController onChooseAnimController;

  TarotCardCarousel({Key? key, required this.onChooseAnimController}) : super(key: key);

  @override
  State<StatefulWidget> createState() => TarotCardCarouselState();
}

class TarotCardCarouselState extends State<TarotCardCarousel>
    with TickerProviderStateMixin {
  int middleCard = 0;
  int visibleCard = 0;

  late AnimationController _tapOnCardController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _tapOnCardController = AnimationController(vsync: this, duration: 100.ms);

    calculateCardsVisible();
  }

  void calculateCardsVisible() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      int cardWidth = 60;
      var deviceWidth = MediaQuery.of(context).size.width;
      visibleCard = (deviceWidth / cardWidth).round();
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    var tarotCubit = context.read<TarotCubit>();
    TarotState state = tarotCubit.state;

    return SizedBox(
            height: 120,
            child: InfiniteCarousel.builder(
              center: true,
              itemCount: 16,
              itemExtent: 60,
              itemBuilder: (context, itemIndex, realIndex) {
                GlobalKey cardKey = GlobalKey();
                return GestureDetector(
                    onTap: () {
                      RenderBox box = cardKey.currentContext!.findRenderObject() as RenderBox;
                      Offset position = box.localToGlobal(Offset.zero);
                      tarotCubit.chosenCardYPosition = position.dy;
                      tarotCubit.chosenCardXPosition = position.dx;

                      if(state is OnPickingTarotCardState && state.onPickingCard == false && state.totalCardPicked < 3){
                        _tapOnCardController.forward();
                        tarotCubit.pickDailyTarot();
                        widget.onChooseAnimController.forward();
                        //widget.catPawAnimController.forward();
                      }
                    },
                    child: Image.asset(key: cardKey, "assets/images/tarot-back.png", width: 60)
                );
              },
            )
    );
  }
}
