import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tarot_app/domain/entities/tarot_card.dart';
import 'package:tarot_app/domain/entities/tarot_message.dart';
import 'package:tarot_app/presentation/states/tarot/tarot_cubit.dart';
import 'package:tarot_app/presentation/states/tarot/tarot_state.dart';
import 'package:tarot_app/presentation/ui/widgets/error_screen.dart';
import 'package:tarot_app/presentation/ui/widgets/loading_screen.dart';

class DailyMessageScreen extends StatelessWidget{
  const DailyMessageScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: SafeArea(
        child: BlocProvider.value(
          value: context.read<TarotCubit>(),
          child: BlocBuilder<TarotCubit, TarotState>(
            builder: (context, state){
              TarotCubit cubit = context.read<TarotCubit>();

              if(state is LoadingState){
                return const LoadingScreen();
              }
              else if(state is GenerateMessageCompleted){
                return Column(
                  children: [
                    ConstrainedBox(
                        constraints: BoxConstraints(
                            maxHeight: MediaQuery.of(context).size.height
                        ),
                        child: Stack(
                          children: [
                            FractionallySizedBox(
                              widthFactor: 1.0,
                              heightFactor: 0.25,
                              child: Container(
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        fit: BoxFit.fill,
                                        image: ((){
                                          switch(state.type){
                                            case MessageType.Overall:
                                              return const AssetImage("assets/images/pastel_bg_4.jpg");
                                            case MessageType.Romance:
                                              return const AssetImage("assets/images/pastel_bg_3.jpg");
                                            case MessageType.Career:
                                              return const AssetImage("assets/images/pastel_bg_2.jpg");
                                            case MessageType.Health:
                                              return const AssetImage("assets/images/pastel_bg_1.jpg");
                                          }
                                        }())
                                    )
                                ),
                              ).animate().fadeIn(duration: 600.ms).move(begin: const Offset(-16, 0), curve: Curves.easeOutQuad)
                            ),
                            FractionallySizedBox(
                                widthFactor: 1.0,
                                heightFactor: 0.3,
                                child: Align(
                                  alignment: Alignment.bottomCenter,
                                  child: Image.asset(((){
                                    switch(state.type){
                                      case MessageType.Overall:
                                        return "assets/images/overall.png";
                                      case MessageType.Romance:
                                        return "assets/images/love.png";
                                      case MessageType.Career:
                                        return "assets/images/career.png";
                                      case MessageType.Health:
                                        return "assets/images/health.png";
                                    }
                                  }()),fit: BoxFit.contain, height: 180, width: 180,).animate().fadeIn(duration: 600.ms, delay: 200.ms).move(begin: const Offset(-16, 0), curve: Curves.easeOutQuad)
                                      .animate().fadeIn(duration: 600.ms, delay: 200.ms).move(begin: const Offset(-16, 0), curve: Curves.easeOutQuad),
                                )
                            ),
                          ],
                        )
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        TextButton(
                          onPressed: (){
                            cubit.onChangeMessageType("Left", state);
                          },
                          child: const Icon(Icons.arrow_back, size: 20,)
                        ),
                        Expanded(
                          child: Text(((){
                            switch(state.type){
                              case MessageType.Overall:
                                return "Overall";
                              case MessageType.Romance:
                                return "Romance";
                              case MessageType.Career:
                                return "Career";
                              case MessageType.Health:
                                return "Health";
                            }
                          }()), style: const TextStyle(fontWeight: FontWeight.w900, fontSize: 20, color: Color(0xFFd89084)), textAlign: TextAlign.center),
                        ),
                        TextButton(
                          onPressed: (){
                            cubit.onChangeMessageType("Right", state);
                          },
                          child: const Icon(Icons.arrow_forward, size: 20)
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Expanded(
                      child: CustomScrollView(
                        scrollDirection: Axis.vertical,
                          slivers: [
                            SliverToBoxAdapter(
                              child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const SizedBox(
                                      width: 30,
                                    ),
                                    Expanded(
                                      child: Text(((){
                                        switch(state.type){
                                          case MessageType.Overall:
                                            return cubit.tarotMessage.overallMessage;
                                          case MessageType.Romance:
                                            return cubit.tarotMessage.romanceMessage;
                                          case MessageType.Career:
                                            return cubit.tarotMessage.careerMessage;
                                          case MessageType.Health:
                                            return cubit.tarotMessage.healthMessage;
                                          default:
                                            return "";
                                        }
                                      }()), style: const TextStyle(fontSize: 15, color: Color(0xFF555555)))
                                    ),
                                    const SizedBox(
                                      width: 30,
                                    )
                                  ],
                              )
                            )
                          ],
                      )
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      padding: const EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 10.0),
                      color: const Color(0xFFedd3c2),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          FadeInImage(
                            width: 70,
                            height: 120,
                            placeholder: AssetImage(
                              "assets/images/tarot-back.png"
                            ),
                            image: NetworkImage(
                                cubit.pickedCards[0].imgUrl,
                            )
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          FadeInImage(
                              width: 70,
                              height: 120,
                              placeholder: AssetImage(
                                "assets/images/tarot-back.png",
                              ),
                              image: NetworkImage(
                                  cubit.pickedCards[1].imgUrl,
                              )
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          FadeInImage(
                              width: 70,
                              height: 120,
                              placeholder: AssetImage(
                                  "assets/images/tarot-back.png"
                              ),
                              image: NetworkImage(
                                  cubit.pickedCards[2].imgUrl,
                              )
                          ),
                        ],
                      ),
                    ).animate().fadeIn(duration: 1000.ms).move(begin: const Offset(-16, 0), curve: Curves.easeOutQuad),
                    const SizedBox(
                      height: 20,
                    )
                  ],
                );
              }
              else{
                return const ErrorScreen();
              }
            },
          ),
        )
      ),
    );
  }
}