import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lottie/lottie.dart';
import 'package:tarot_app/domain/entities/tarot_card.dart';
import 'package:tarot_app/presentation/ui/screens/daily_tarot/widgets/invisible_expanded_header.dart';
import 'package:tarot_app/presentation/ui/screens/daily_tarot/widgets/tarot_info_expandable.dart';
import 'package:tarot_app/presentation/ui/screens/daily_tarot/widgets/tarot_sub_info_block.dart';
import 'package:tarot_app/core/app_navigate/routes.dart';

class TarotCardInfoScreen extends StatelessWidget {
  final TarotCard tarotCard;

  const TarotCardInfoScreen({Key? key, required this.tarotCard}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              pinned: true,
              backgroundColor: Colors.white,
              expandedHeight: 500,
              leading: IconButton(
                icon: const Icon(Icons.close, color: Colors.black),
                onPressed: () {
                  //context.pop();
                },
              ),
              flexibleSpace: FlexibleSpaceBar(
                centerTitle: true,
                title: InvisibleExpandedHeader(
                  child: Text(tarotCard.name, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w900, color: Colors.black)),
                ),
                background: Container(
                  padding: const EdgeInsets.fromLTRB(0.0, 5.0, 0.0, 0.0),
                  child: CachedNetworkImage(
                    imageUrl: tarotCard.imgUrl,
                    imageBuilder: (context, imageProvider) {
                      return Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: imageProvider,
                            fit: BoxFit.contain,
                          ),
                        ),
                      );
                    },
                    placeholder: (context, url) =>
                        Lottie.asset("assets/images/loading-3.json"),
                    errorWidget: (context, url, error) => const Icon(Icons.error, color: Colors.red),
                  ),
                ),
              ),

            ),
            SliverList(
                delegate: SliverChildListDelegate([
                  Container(
                    alignment: Alignment.topLeft,
                    padding: const EdgeInsets.only(left: 10.0, top: 20.0),
                    child: const Icon(FontAwesomeIcons.quoteLeft, color: Colors.black26)
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                    child: Text(
                      tarotCard.cardDescription,
                      style: const TextStyle(
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.w500,
                          fontSize: 14,
                          color: Colors.black45
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Container(
                      alignment: Alignment.topRight,
                      padding: const EdgeInsets.only(right: 10.0, bottom: 20.0),
                      child: const Icon(FontAwesomeIcons.quoteRight, color: Colors.black26)
                  ),
                  TarotInfoExpandable(
                      icon: FontAwesomeIcons.bookOpen,
                      title: 'Card Meaning',
                      content: tarotCard.meaning
                  ),
                  TarotInfoExpandable(
                      icon: FontAwesomeIcons.briefcase,
                      title: 'Career Meaning',
                      content: tarotCard.careerMeaning
                  ),
                  TarotInfoExpandable(
                      icon: FontAwesomeIcons.chartLine,
                      title: 'Finances Meaning',
                      content: tarotCard.financesMeaning
                  ),
                  TarotInfoExpandable(
                      icon: FontAwesomeIcons.heartPulse,
                      title: 'Love Meaning',
                      content: tarotCard.loveMeaning
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(10.0, 40.0, 10.0, 0.0),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          TarotSubInfoBlock(
                              icon: FontAwesomeIcons.crown,
                              title: "Tarot set",
                              content: tarotCard.type
                          ),
                          const SizedBox(
                            width: 30,
                          ),
                          TarotSubInfoBlock(
                            icon: FontAwesomeIcons.meteor,
                            title: "Astrology",
                            content: tarotCard.astrology
                          ),
                          const SizedBox(
                            width: 40,
                          ),
                          TarotSubInfoBlock(
                              icon: FontAwesomeIcons.hamsa,
                              title: "Element",
                              content: tarotCard.element
                          ),
                          const SizedBox(
                            width: 40,
                          ),
                          TarotSubInfoBlock(
                              icon: FontAwesomeIcons.wolfPackBattalion,
                              title: "Zodiac",
                              content: tarotCard.zodiac
                          ),
                        ],
                      )
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                ]
              )
            )
          ],
        ),
      ),
    );
  }
}
