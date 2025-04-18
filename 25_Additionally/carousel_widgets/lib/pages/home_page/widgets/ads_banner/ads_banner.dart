import 'package:carousel_widgets/pages/home_page/widgets/ads_banner/ads_widgets/page_indicator.dart';
import 'package:flutter/material.dart';

import 'package:carousel_widgets/pages/home_page/widgets/ads_banner/ads_widgets/one_banner.dart';

class AdsBanner extends StatefulWidget {
  const AdsBanner({super.key});

  @override
  State<AdsBanner> createState() => _AdsBannerState();
}

class _AdsBannerState extends State<AdsBanner> {

  int position = 0;

  @override
  Widget build(BuildContext context) {

    return SizedBox(
      height: 360,
      child: Stack(
        children: [
          PageView(
            pageSnapping: true,
            scrollDirection: Axis.horizontal,
            onPageChanged: (id) => setState(() => position= id),
            //physics: const BouncingScrollPhysics(),
            children: [
              OneBanner(
                imagePath: 'assets/images/backgrounds/image515.png',
                label: 'Скидка -15%',
                text: 'Сыворотка',
                description: 'HA EYE & NECK SERUM',
                onPressed: () {},
              ),
              OneBanner(
                imagePath: 'assets/images/backgrounds/image513.png',
                label: 'Скидка -20%',
                text: 'Мус',
                description: 'BEAUTY MASK',
                onPressed: () {},
              ),
              OneBanner(
                imagePath: 'assets/images/backgrounds/image515.png',
                label: 'Скидка -15%',
                text: 'Сыворотка',
                description: 'HA EYE & NECK SERUM',
                onPressed: () {},
              ),
            ],
          ),
          PageIndicator(position: position, length: 3),
        ]
      ),
    );
  }
}
