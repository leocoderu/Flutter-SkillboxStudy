part of '../screen_signin.dart';

class UiLogo extends StatelessWidget {
  const UiLogo({super.key});

  @override
  Widget build(BuildContext context) {
    final storage = FirebaseStorage.instance;

    return FutureBuilder(
      future: storage.ref('logo.png').getDownloadURL(),
      builder: (BuildContext _, AsyncSnapshot<String> snapshot) {
        if (snapshot.connectionState == ConnectionState.done &&
            snapshot.hasData) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 48),
            child: Image.network(snapshot.data!, height: 200),
          );
        }

        return const SizedBox(height: 200);
      },
    );
  }
}
