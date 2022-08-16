import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile>{
  @override
  Widget build(BuildContext context) {
    // ignore: avoid_print
    print('BUILD PROFILE');
    return const Text('Profile widget');
  }
}