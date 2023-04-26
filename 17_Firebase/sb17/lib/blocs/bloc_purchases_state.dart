// Package imports:
import 'package:freezed_annotation/freezed_annotation.dart';

// Project imports:
import 'package:app_firebase_shop/models/api_purchase/api_purchase.dart';

part 'bloc_purchases_state.freezed.dart';

// class BlocPurchasesState with _$BlocPurchasesState {
//   const factory BlocPurchasesState({
//     required List<ApiPurchase> purchases,
//     required String error,
//     required bool isLoading,
//   }) = _BlocPurchasesState;
// }

@freezed
class BlocPurchasesState with _$BlocPurchasesState {
  const factory BlocPurchasesState.loading() = BlocPurchasesStateLoading;

  const factory BlocPurchasesState.loaded(List<ApiPurchase> purchases) =
      BlocPurchasesStateLoaded;

  const factory BlocPurchasesState.error(String error) =
      BlocPurchasesStateError;
}
