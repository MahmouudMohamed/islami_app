import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RadioTab extends StatelessWidget {
  const RadioTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          height: 150,
        ),
        Image.asset(
          "assets/image/radio.png",
          height: 222,
        ),
        SizedBox(
          height: 35,
        ),
        Text(
          "إذاعة القرأن الكريم",
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        SizedBox(
          height: 35,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.skip_previous,
                )),
            IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.play_arrow,
                )),
            IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.skip_next,
                )),
          ],
        )
      ],
    );
  }
}
