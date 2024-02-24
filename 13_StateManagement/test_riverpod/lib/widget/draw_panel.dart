import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test_riverpod/states/vertex_state.dart';
import 'package:test_riverpod/widget/some_painter.dart';

class DrawPanel extends ConsumerWidget {
  final Widget? child;
  const DrawPanel({super.key, this.child});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final vertex = ref.watch(VertexState.stateVertexProvider);
    final vertexProvider = ref.watch(VertexState.stateVertexProvider.notifier);

    return GestureDetector(
      onTapUp: (detail) => vertexProvider.addVertex(detail.localPosition),
      child: CustomPaint(
        painter: SomePainter(vertex: vertex),
        child: child,
      ),
    );
  }
}
