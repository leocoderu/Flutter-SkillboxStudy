part of '../screen_purchases.dart';

class _UiPurchase extends StatelessWidget {
  final ApiPurchase purchase;

  const _UiPurchase({
    required this.purchase,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: UiText(text: purchase.label),
      trailing: IconButton(
        icon: _icons[purchase.isBought]!,
        onPressed: () => context
            .read<BlocPurchases>()
            .add(BlocPurchasesEventSwitch(purchase)),
      ),
    );
  }
}

final _icons = <bool, Widget>{
  true: Icon(
    Icons.check_box_outlined,
    color: Colors.green.shade200,
  ),
  false: const Icon(
    Icons.check_box_outline_blank_rounded,
    color: Colors.green,
  ),
};
