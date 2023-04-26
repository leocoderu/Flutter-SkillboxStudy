part of '../ui_drawer.dart';

class _UiTile extends StatelessWidget {
  final AppDrawerItem item;
  final bool? withoutArrow;

  const _UiTile({
    required this.item,
    this.withoutArrow,
  });

  @override
  Widget build(BuildContext context) {
    final activeRoute = ModalRoute.of(context)!.settings.name;
    final isActive = activeRoute == item.route;

    final handleTap = item.onTap ??
        () {
          Navigator.pop(context);

          if (!isActive) {
            Navigator.pushReplacementNamed(context, item.route);
          }
        };

    final leading = Icon(
      item.iconData,
      color: Colors.green,
    );

    final title = UiText(text: item.title);

    final trailing = withoutArrow == true
        ? null
        : const Icon(
            Icons.arrow_forward_ios,
            color: Colors.green,
          );

    return ListTile(
      tileColor: isActive ? Colors.green[50] : null,
      contentPadding: const EdgeInsets.symmetric(horizontal: 16),
      horizontalTitleGap: 0.0,
      leading: leading,
      title: title,
      trailing: trailing,
      onTap: handleTap,
    );
  }
}
