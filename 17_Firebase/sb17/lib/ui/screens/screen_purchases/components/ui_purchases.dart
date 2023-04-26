part of '../screen_purchases.dart';

class _UiPurchases extends StatelessWidget {
  final List<ApiPurchase> purchases;

  const _UiPurchases({required this.purchases});

  @override
  Widget build(BuildContext context) {
    if (purchases.isEmpty) {
      return UiEmptyData(text: labelsPurchases[keyContent]!);
    }

    return ListView.separated(
      separatorBuilder: (_, __) => const UiDivider(),
      itemCount: purchases.length,
      itemBuilder: (_, index) => _UiPurchase(purchase: purchases[index]),
    );
  }
}
