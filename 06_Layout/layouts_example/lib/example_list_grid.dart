import 'package:flutter/material.dart';
import 'package:layouts_example/simple_card.dart';

class ListGridExample extends StatefulWidget{
  const ListGridExample({Key? key}) : super (key: key);
  @override
  State<ListGridExample> createState() => _ListGridExampleState();
}

class _ListGridExampleState extends State<ListGridExample>{
  List<Widget> data = List.generate(100, (index) => SimpleCard(index: index.toString()));

  ScrollController controller = ScrollController(initialScrollOffset: 0);

  @override
  void initState() {
    super.initState();
    controller.addListener(() {
      // ignore: avoid_print
      //print('MAX SCROLL EXTENT: ${controller.position.maxScrollExtent}');
      // ignore: avoid_print
      //print(controller.offset.floor());
    });
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ListView / GridView'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Row(
            children: [
              const SizedBox(width: 12),
              ElevatedButton(
                  onPressed: () {
                    controller.animateTo(
                        500,
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.easeInOut
                    );
                  },
                  child: const Text('animateTo'),
              ),
              const SizedBox(width: 12),
              ElevatedButton(
                  onPressed: () {
                    controller.jumpTo(2000);
                  },
                  child: const Text('jumpTo'),
              )
            ],
          ),

          // LIST VIEW
          Expanded(
              child: ListView(
                controller: controller,
                children: data.map((item) => item).toList(),
              ),
          ),

          // LISTVIEW HORIZONTAL
          // Container(
          //   height: 200,
          //   child: ListView(
          //     controller: controller,
          //     scrollDirection: Axis.horizontal,
          //     children: [
          //       ...data.map((item) => Container(
          //         width: 100,
          //         child: item,
          //       )).toList(),
          //     ],
          //   ),
          // ),

          // LISTVIEW BUILDER, ???????????????????????? ???????? ??????-???? ?????????????????? ?????????? ?????????????? (???? 1000 ?? ????????????)
          // Expanded(
          //     child: ListView.builder(
          //         controller: controller,
          //         itemCount: data.length,
          //         itemBuilder: (context, index) => data[index],
          //     ),
          // ),

          // LIST VIEW WHEEL
          // Expanded(
          //     child: ListWheelScrollView(
          //       controller: controller,
          //       diameterRatio: 2.0,
          //       itemExtent: 100,
          //       children: <Widget>[
          //         ...data.map((item) => item).toList(),
          //       ],
          //     ),
          // ),

          // LIST VIEW CUSTOM
          // Expanded(
          //     child: ListView.custom(
          //       controller: controller,
          //       childrenDelegate: SliverChildListDelegate(
          //         data.map((item) => item).toList(),
          //       ),
          //     ),
          // ),

          // GRID VIEW COUNT
          Expanded(
              //flex: 2,
              child: GridView.count(
                mainAxisSpacing: 10.0,  // ?????????????????? ?????????? ????????????????
                crossAxisSpacing: 10.0, // ???????????????????? ?????????? ????????????
                crossAxisCount: 2,      // ??????-???? ???????????? ?? ??????
                childAspectRatio: 2.5,  // ???????????? ????????????
                //scrollDirection: Axis.horizontal,
                //physics: const BouncingScrollPhysics(),
                physics: const ClampingScrollPhysics(),
                children: [
                  ...data.map((item) => item).toList(),
                ],
              ),
          ),

          // GRID VIEW BUILDER, ?????????????????????????? ?????? ???????????????? ?????????? ??????????????????
          // Expanded(
          //     child: GridView.builder(
          //         gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          //             crossAxisCount: 2,      // ??????-???? ?????????????????? ?? ????????
          //         ),
          //         itemCount: data.length,
          //         itemBuilder: (context, index) => data[index],
          //     )
          // ),

          // GRID VIEW BUILDER, ?????????????????????????? ?????? ???????????????? ?????????? ??????????????????
          // Expanded(
          //     child: GridView.builder(
          //       gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          //         maxCrossAxisExtent: 150,      // ???????????? ???????????? ?? ??????
          //       ),
          //       itemCount: data.length,
          //       itemBuilder: (context, index) => data[index],
          //     )
          // ),

          // Expanded(
          //     child: GridView.extent(
          //       maxCrossAxisExtent: 300,      // ???????????? ???????????? ?? ??????
          //       shrinkWrap: true,
          //       children: [
          //         ...data.map((item) => item).toList(),
          //       ],
          //     )
          // ),

          // Expanded(
          //     child: GridView.custom(
          //       gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          //         crossAxisCount: 2,
          //       ),
          //       childrenDelegate: SliverChildBuilderDelegate(
          //           (context, index) => data[index],
          //           childCount: data.length,
          //       ),
          //     ),
          // ),

        ],
      ),
    );
  }
}