// Import Flutter
import 'package:business_layer/business_layer.dart';
import 'package:business_layer/states/app_state/app_state_events.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:model_layer/model_layer.dart';

import '../../fluro_router.dart';

class HomePage extends StatelessWidget {
  static const routeName = '/home';

  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Template Application"),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () =>  MyFluroRouter.router.navigateTo(context, '/settings'),
          ),
        ],
      ),
      body: Center(
        // child: BlocBuilder<AppStateBloc, AppStateModel>(
        //     builder: (BuildContext context, state) {
        //       return Column(
        //         mainAxisAlignment: MainAxisAlignment.center,
        //         children: <Widget>[
        //           const Text('Tap the button many times:'),
        //           Text('${state.counter}', style: Theme.of(context).textTheme.headlineMedium,
        //           ),
        //         ],
        //       );
        //     },
        // ),
      ),
      // floatingActionButton: Column(
      //   children: [
      //     FloatingActionButton(
      //       onPressed: () => context.read<AppStateBloc>().add(IncreaseCounter()),
      //       tooltip: 'Increment',
      //       child: const Icon(Icons.add),
      //     ),
      //     FloatingActionButton(
      //       onPressed: () => context.read<AppStateBloc>().add(DecreaseCounter()),
      //       tooltip: 'Decrement',
      //       child: const Icon(Icons.add),
      //     ),
      //   ],
      // ),
    );
  }
}
