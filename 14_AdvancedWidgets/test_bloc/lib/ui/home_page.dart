import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:test_bloc/business/some_bloc.dart';
import 'package:test_bloc/business/some_bloc_actions.dart';
import 'package:test_bloc/model/some_data.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Demo flutter_bloc'), centerTitle: true,),
      body: Center(
        child: BlocBuilder<SomeBloc, SomeData>(                                   // Add BlocBuilder for data access
        builder: (context, state) {
          return Column(
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('${state.first.toInt()}'),                               // Get Data from state
                    Text(state.text),                                             // Get Data from state
                    Text('${state.count}'),                                       // Get Data from state
                  ],
                ),
              ),
              SizedBox(
                height: 170,
                child: Column(
                  children: [
                    Slider(
                      max: 100.0,
                      value: state.first,                                         // Get state for value of Slider
                      onChanged: (value) {context.read<SomeBloc>().add(ChangeFirst(value: value));},  // Call Action for change
                    ),
                    const Divider(),
                    TextField(
                      decoration: const InputDecoration(hintText: 'Поле для сохранения текста в state',),
                      onSubmitted: (value) {context.read<SomeBloc>().add(ChangeText(value: value));}, // Call Action for change
                    ),
                    Slider(
                      max: 100.0,
                      value: state.count.toDouble(),                              // Get state for value of Slider
                      onChanged: (value) {context.read<SomeBloc>().add(ChangeCount(value: value.toInt()));},// Call Action for change
                    ),
                  ],
                )
              ),
            ],
          );
        }),
      ),
    );
  }
}