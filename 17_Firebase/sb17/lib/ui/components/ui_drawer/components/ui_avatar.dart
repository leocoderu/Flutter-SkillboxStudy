part of '../ui_drawer.dart';

class _UiAvatar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final storage = FirebaseStorage.instance;

    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 32,
      ),
      child: FutureBuilder(
        future: storage.ref('avatar.png').getDownloadURL(),
        builder: (BuildContext _, AsyncSnapshot<String> snapshot) {
          if (snapshot.connectionState == ConnectionState.done &&
              snapshot.hasData) {
            return Align(
              alignment: Alignment.center,
              child: CircleAvatar(
                radius: 48.0,
                backgroundImage: NetworkImage(snapshot.data!),
              ),
            );
          }

          return const SizedBox(
            width: 96,
            height: 96,
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
