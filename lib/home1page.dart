import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class FhomePage extends StatefulWidget {
  const FhomePage({super.key});

  @override
  State<FhomePage> createState() => _FhomePageState();
}

class _FhomePageState extends State<FhomePage> {
  final User = FirebaseAuth.instance.currentUser!;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Signed in as: ' + User.email!),
            MaterialButton(
              onPressed: () {
                FirebaseAuth.instance.signOut();
              },
              color: Colors.grey[400],
              child: Text('Sign Out'),
            ),
          ],
        ),
      ),
    );
  }
}
