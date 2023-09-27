
import 'package:flutter/material.dart';
import 'package:poke_app/const/poke_type_container.dart';
import 'package:poke_app/const/text_style.dart';

Widget portraitContainer(data) {

  return Column(
    mainAxisAlignment: MainAxisAlignment.end,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      headingText(color: Colors.white, size: 36, text: data['name']),
      Row(
        children: [
          typeContainer(
            color: Colors.white,
            size: 16,
            text: data['typeofpokemon'][0],
          ),
          const SizedBox(
            width: 6,
          ),
          typeContainer(
            color: Colors.white,
            size: 16,
            text: data['typeofpokemon'].length==2?
            data['typeofpokemon'][1]:"No type",
          ),
        ],
      ),
      const SizedBox(
        height: 50,
      ),
      Align(
        alignment: Alignment.center,
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Image.asset(
              "assets/pokeball.png",
              width: 200,
              color: Colors.white.withOpacity(0.5),
            ),
            Image.network(
             data['imageurl'],
              width: 180,
            ),
          ],
        ),
      ),
    ],
  );
}
