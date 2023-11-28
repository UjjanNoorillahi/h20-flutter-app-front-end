import 'package:flutter/material.dart';
import 'package:h2o/screens/friends_suggestion_screen.dart';

import '../models/get_user_data_model.dart';

class MessagesScreen extends StatefulWidget {
  final FriendSuggestion suggestion;

  const MessagesScreen({super.key, required this.suggestion});

  @override
  State<MessagesScreen> createState() => _MessagesScreenState();
}

class _MessagesScreenState extends State<MessagesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            IconButton(
                onPressed: () {
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                        builder: (context) => const FriendsSuggestionPage()),
                  );
                },
                icon: Icon(Icons.arrow_back)),
            CircleAvatar(),
            SizedBox(
              width: 20,
            ),
            Text(widget.suggestion.fullName),
          ],
        ),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.more_vert_outlined))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 16.0, right: 16.0, top: 16.0),
        child: Column(
          children: [
            Container(
              // messages portion
              color: Colors.green,
              height: MediaQuery.of(context).size.height *
                  0.75, // 70% of screen height
              width:
                  MediaQuery.of(context).size.width, // Full width of the screen
              child: Text("Hello"),
            ),
            Expanded(
                // Search bar portion of the whole screen
                child: Container(
              width: MediaQuery.of(context).size.width,
              color: Colors.red,
              child: Text("remaning part"),
            ))
          ],
        ),
      ),
    );
  }
}
