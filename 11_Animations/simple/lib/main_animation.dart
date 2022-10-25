import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    //with SingleTickerProviderStateMixin{
    with TickerProviderStateMixin{
  late Animation<double> animation;
  late AnimationController controller;

  late Animation<Offset> animation1;
  late AnimationController controller1;

  bool isShow = true;
  bool toggle = true;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
        vsync: this,
        duration: const Duration(seconds: 2),
    );

    controller1 = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );

    // CurvedAnimation curved = CurvedAnimation(
    //     parent: controller,
    //     //curve: Curves.bounceOut
    //     //curve: Curves.easeInSine
    //     curve: Curves.bounceInOut
    // );
    //
    // Tween<double> tween = Tween<double>(begin: 0.0, end: 200.0);
    //
    // //animation = tween.animate(controller);
    // animation = tween.animate(curved);
    // animation.addListener(() {
    //   if (controller.isCompleted) {
    //     controller.reset();     // Сброс в первоначальную позицию
    //     //controller.reverse();     // Анимация в обратном порядке
    //     //controller.repeat();      // Повторение анимации
    //   }
    //
    //   setState(() {});
    // });

    animation = Tween<double>(begin: 0.0, end: 200.0).animate(
        CurvedAnimation(
            parent: controller,
            curve: Curves.bounceOut
        )..addListener(() {
          if (controller.isCompleted) {
            controller.reset();     // Сброс в первоначальную позицию
          }
          setState(() {});
        })
    );

    animation1 = Tween<Offset>(begin: const Offset(0.0, 0.0), end: const Offset(2.0, 3.0)).animate(
        CurvedAnimation(
            parent: controller1,
            curve: Curves.easeIn
        )..addListener(() {
          if (controller1.isCompleted) {
            controller1.reverse();     // Сброс в первоначальную позицию
          }
          setState(() {});
        })
    );


  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Simple Animation Studios'),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                    PageRouteBuilder(
                        pageBuilder: (context, animation, secondaryAnimation) => const DetailView(),
                        transitionDuration: const Duration(milliseconds: 800),
                        transitionsBuilder:  (context, animation, secondaryAnimation, child) {
                          Animation<Offset> anim = Tween<Offset>(
                            begin: const Offset(0.0, 1.0),
                            end: const Offset(0.0, 0.0)
                          ).animate(animation);

                          return SlideTransition(
                            position: anim,
                            child: child,
                          );
                          // return ScaleTransition(
                          //   scale: animation,
                          //   child: FadeTransition(
                          //     opacity: animation,
                          //     child: child,
                          //   )
                          // );
                        }
                    ),
                );
              },
              child: const Text('Go to Detail'),
          ),
          SizedBox(
            height: 200,
            width: 200,
            child: AnimatedSwitcher(
              duration: const Duration(seconds: 2),
              switchInCurve: Curves.bounceInOut,
              child: toggle ? Container(
                  key: const Key('container-1'),
                  width: 100,
                  height: 100,
                  color: Colors.purple
              )
              : Container(
                  key: const Key('container-2'),
                  width: 200,
                  height: 200,
                  color: Colors.green
              )
            ),
          ),
          AnimatedOpacity(
              opacity: isShow ? 1 : 0,
              duration: const Duration(seconds: 2),
              child: const Icon(Icons.accessibility, color: Colors.green, size: 80),
          ),
          SlideTransition(
            position: animation1,
            child: const Icon(Icons.directions_bike, color: Colors.red, size: 80),
          ),
          Expanded(
              child: Stack(
                children: [
                  Positioned(
                    left: animation.value,
                    child: const Icon(Icons.directions_bike, size: 80),
                  ),
                ],
              ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            isShow = false;
            toggle = !toggle;
          });
          // controller.forward();
          // controller1.forward();
        },
        //child: ,
      ),
    );
  }
}

class DetailView extends StatelessWidget {
  const DetailView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purpleAccent,
      appBar: AppBar(),
      body: Column(
        children: const [
          Text('tasdsdkjfvhdsflkvfhnsdlkufjhnsldkext'),
        ],
      ),
    );
  }
}
