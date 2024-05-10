import 'package:flutter/material.dart';
import 'package:serverpod_auth_shared_flutter/serverpod_auth_shared_flutter.dart';
import 'package:vola_flutter/src/serverdata/serverpod_client.dart';

class FeedScreen extends StatefulWidget {
  const FeedScreen({super.key, required this.title});

  final String title;

  @override
  State<FeedScreen> createState() => _FeedScreenState();
}

class _FeedScreenState extends State<FeedScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          ListTile(
            contentPadding:
                const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            leading: CircularUserImage(
              userInfo: sessionManager.signedInUser,
              size: 42,
            ),
            title: Text(sessionManager.signedInUser!.userName),
            subtitle: Text(sessionManager.signedInUser!.email ?? ''),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: ElevatedButton(
              onPressed: () {
                sessionManager.signOut();
              },
              child: const Text('Sign out'),
            ),
          ),
        ],
      ),
    );
  }
}
