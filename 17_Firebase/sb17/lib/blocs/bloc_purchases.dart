// Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';

// Project imports:
import 'package:app_firebase_shop/blocs/bloc_purchases_event.dart';
import 'package:app_firebase_shop/blocs/bloc_purchases_state.dart';
import 'package:app_firebase_shop/repositories/repository_purchases.dart';

class BlocPurchases extends Bloc<BlocPurchasesEvent, BlocPurchasesState> {
  final RepositoryPurchases repo;

  BlocPurchases({required this.repo})
      : super(const BlocPurchasesState.loading()) {
    on<BlocPurchasesEventInit>(_init);
    on<BlocPurchasesEventSwitch>(_switch);
  }

  Future<void> _init(
    BlocPurchasesEventInit event,
    Emitter<BlocPurchasesState> emit,
  ) async {
    try {
      final purchases = repo.data;

      await emit.forEach(
        purchases,
        onData: (data) => BlocPurchasesState.loaded(data),
      );
    } catch (e) {
      emit(BlocPurchasesState.error(e.toString()));
    }
  }

  Future<void> _switch(
    BlocPurchasesEventSwitch event,
    Emitter<BlocPurchasesState> emit,
  ) async {
    await repo.switchIsBought(event.purchase);
  }
}
