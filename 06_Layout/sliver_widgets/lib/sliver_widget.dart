import 'package:flutter/material.dart';

class SliverWidget extends StatefulWidget {
  const SliverWidget({Key? key}) : super(key: key);

  @override
  State<SliverWidget> createState() => _SliverWidgetState();
}

class _SliverWidgetState extends State<SliverWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
              backgroundColor: Colors.blue,
              expandedHeight: 200.0,
              toolbarHeight: 51.0,
              floating: false,
              pinned: true,                   // Collapsing Toolbar зафиксируется после скролла
              flexibleSpace: FlexibleSpaceBar(
                centerTitle: false,
                title: const Text('Page title',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16.0,
                    )),
                background: Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: const NetworkImage('https://klike.net/uploads/posts/2020-01/1580370299_9.jpg'),
                      fit: BoxFit.cover,
                      colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.5), BlendMode.darken),
                    ),
                  )
                )
              ),
          ),
          const SliverToBoxAdapter(
            child: Text('The Great Pyramid of Giza[a] is the largest Egyptian pyramid and the tomb of Fourth Dynasty pharaoh Khufu. Built in the early 26th century BC during a period of around 27 years,[3] the pyramid is the oldest of the Seven Wonders of the Ancient World, and the only one to remain largely intact. As part of the Giza pyramid complex, it borders present-day Giza in Greater Cairo, Egypt. Initially standing at 146.6 metres (481 feet), the Great Pyramid was the tallest man-made structure in the world for more than 3,800 years. Over time, most of the smooth white limestone casing was removed, which lowered the pyramids height to the present 138.5 metres (454.4 ft). What is seen today is the underlying core structure. The base was measured to be about 230.3 metres (755.6 ft) square, giving a volume of roughly 2.6 million cubic metres (92 million cubic feet), which includes an internal hillock.[4] The dimensions of the pyramid were 280 royal cubits (146.7 m; 481.4 ft) high, a base length of 440 cubits (230.6 m; 756.4 ft), with a seked of 5 + 1 / 2 palms (a slope of 51°50 The Great Pyramid was built by quarrying an estimated 2.3 million large blocks weighing 6 million tonnes in total. The majority of stones are not uniform in size or shape and are only roughly dressed.[5] The outside layers were bound together by mortar. Primarily local limestone from the Giza Plateau was used. Other blocks were imported by boat down the Nile: White limestone from Tura for the casing, and granite blocks from Aswan, weighing up to 80 tonnes, for the Kings Chamber structure.[6] There are three known chambers inside the Great Pyramid. The lowest was cut into the bedrock, upon which the pyramid was built, but remained unfinished. The so-called[7] Queens Chamber and Kings Chamber, that contains a granite sarcophagus, are higher up, within the pyramid structure. Khufus vizier, Hemiunu (also called Hemon), is believed by some to be the architect of the Great Pyramid.[8] Many varying scientific and alternative hypotheses attempt to explain the exact construction techniques. The funerary complex around the pyramid consisted of two mortuary temples connected by a causeway (one close to the pyramid and one near the Nile), tombs for the immediate family and court of Khufu, including three smaller pyramids for Khufus wives, an even smaller satellite pyramid and five buried solar barges.'),
          ),
        ],
      ),
      drawer: const Drawer(
        child: Text('Drawer'),
      ),
    );
  }
}
