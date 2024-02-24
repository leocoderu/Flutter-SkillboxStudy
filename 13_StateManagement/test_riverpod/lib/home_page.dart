import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test_riverpod/states/vertex_state.dart';
import 'package:test_riverpod/widget/draw_panel.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final vertexProvider = ref.watch(VertexState.stateVertexProvider.notifier);

    return Scaffold(
      body: SafeArea(
        child: DrawPanel(
          child: Column(
            children: [
              const Expanded(child: Center()),
              ElevatedButton(
                onPressed: vertexProvider.clear,
                child: const Text('Tap for clear'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
