import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:test_bloc/business/some_bloc.dart';
import 'package:test_bloc/business/some_bloc_events.dart';
import 'package:test_bloc/model/some_data.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Demo flutter_bloc'), centerTitle: true,),
      body: Center(
        child: BlocBuilder<SomeBloc, SomeData>(                                   // <- Add BlocBuilder for data access
        builder: (context, state) {
          return Column(
            children: [
              Expanded(
                flex: 4,
                child: Container(
                  color: const Color.fromARGB(125, 200, 200, 255),
                  child: state.posts.isEmpty
                  ? const Center(
                      child:SizedBox(width: double.infinity,
                        child: Text('List is Empty.\n\n Press "Add String to List State" button bellow', textAlign: TextAlign.center,),
                      )
                  )
                  : ListView.separated(
                    itemCount: state.posts.length,
                    separatorBuilder: (context, _) => const Divider(),
                    itemBuilder: (_, idx) => Text(state.posts[idx], textAlign: TextAlign.center,),  // Get Data from state                    ,
                  ),
                )
              ),
              Expanded(
                flex: 1,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Double value state:\t${state.first.toInt()}'),       // Get Data from state
                    Text('String value state:\t${state.text}'),                // Get Data from state
                    Text('Integer value state:\t${state.count}'),              // Get Data from state
                  ],
                )
              ),
              Container(
                height: 210,
                color: const Color.fromARGB(50, 255, 0, 0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                          onPressed: () {context.read<SomeBloc>().add(AddToList(value: 'Some string'));}, // Add Event for change
                          child: const Text('Add String to List State'),
                        ),
                        const SizedBox(width: 20.0,),
                        ElevatedButton(
                          onPressed: () {context.read<SomeBloc>().add(ClearList());}, // Add Event for change
                          child: const Text('Clear List State'),
                        ),
                      ],
                    ),
                    Slider(
                      max: 100.0,
                      value: state.first,                                         // Get state for value of Slider
                      onChanged: (value) {context.read<SomeBloc>().add(ChangeFirst(value: value));},  // Add Event for change
                    ),
                    const Divider(),
                    TextField(
                      decoration: const InputDecoration(hintText: 'Field for saving String to State',),
                      onSubmitted: (value) {context.read<SomeBloc>().add(ChangeText(value: value));}, // Add Event for change
                    ),
                    Slider(
                      max: 100.0,
                      value: state.count.toDouble(),                              // Get state for value of Slider
                      onChanged: (value) {context.read<SomeBloc>().add(ChangeCount(value: value.toInt()));},// Add Event for change
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