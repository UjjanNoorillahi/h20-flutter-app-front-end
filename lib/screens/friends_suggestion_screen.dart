import 'package:flutter/material.dart';
import 'package:h2o/screens/find_friends_screen.dart';
import 'package:h2o/widgets/primary_button.dart';
import 'package:provider/provider.dart';

import '../Services/get_friends_data_api.dart';
import '../Services/login_api.dart';
import '../models/get_user_data_model.dart';
import '../provider/auth_token_provider.dart';

class FriendsSuggestionPage extends StatefulWidget {
  const FriendsSuggestionPage({super.key});

  @override
  State<FriendsSuggestionPage> createState() => _FriendsSuggestionPageState();
}

class _FriendsSuggestionPageState extends State<FriendsSuggestionPage> {
String? authToken;
List<FriendSuggestion>? friendSuggestions = [];
String friendsData = "no value";

@override
  void initState() {
    getFriendSuggestions();
    super.initState();
  }

  printFriendsData(){

    if (friendSuggestions != null) {
      print("Friend Suggestions Received:");
      for (FriendSuggestion suggestion in friendSuggestions!) {
        Text("Full Name: ${suggestion.fullName}");
        Text("Gender: ${suggestion.gender}");
        Text("Email: ${suggestion.email}");
        Text("Religion: ${suggestion.religion}");
        Text("Zodiac Sign: ${suggestion.zodiacSign}");
        Text("Birth Date: ${suggestion.birthDate.toLocal()}"); // Convert to local time
        Text("Compatibility: ${suggestion.compatibility}");
        Text("--------------");
      }
      // Add your logic to use the friend suggestions
    }
  }

    getFriendSuggestions() async {
    String _authToken =  "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY1NTI3ZTlhZWRjYmVkODc1OTA0MDdmZiIsInVzZXJuYW1lIjoic2FqaWRAZ21haWwuY29tIiwiaWF0IjoxNzAwMzc3NTUyfQ.ZenSxB1HqjPjSABnbveQNltLsdVJkbEXFUe2SnR4nU4"; // Replace with your actual auth token

    FriendSuggestionService friendSuggestionService = FriendSuggestionService();

     friendSuggestions = await
          friendSuggestionService.getFriendSuggestions(_authToken!);

    if (friendSuggestions != null) {
      print("Friend Suggestions Received:");
      for (FriendSuggestion suggestion in friendSuggestions!) {
        print("Full Name: ${suggestion.fullName}");
        print("Gender: ${suggestion.gender}");
        print("Email: ${suggestion.email}");
        print("Religion: ${suggestion.religion}");
        print("Zodiac Sign: ${suggestion.zodiacSign}");
        print("Birth Date: ${suggestion.birthDate.toLocal()}"); // Convert to local time
        print("Compatibility: ${suggestion.compatibility}");
        print("--------------");
      }
      // Add your logic to use the friend suggestions

      setState(() {
        // Update the state with the received friend suggestions
        friendSuggestions = friendSuggestions;
      });
    } else {
      print("Failed to get friend suggestions.");
      // Add error handling or display an error message
    }
  }

  @override
  Widget build(BuildContext context) {

    // final authTokenProvider = Provider.of<AuthTokenProvider>(context);
    return  Scaffold(
      appBar: AppBar(
        title: const Text("Friends Suggestion"),
        leading: InkWell(child: const Icon(Icons.arrow_back_ios), onTap: (){
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(
              builder: (context) => const FindFriendsScreen(),
            ),
          );
        },),
      ),
          body: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Center(
              child: friendSuggestions == null
                  ? CircularProgressIndicator() // Display a loading indicator while fetching data
                  : ListView.builder(
                itemCount: friendSuggestions!.length,
                itemBuilder: (context, index) {
                  FriendSuggestion suggestion = friendSuggestions![index];
                  return Card(
                    child: ListTile(
                      leading: const CircleAvatar(
                        radius: 28,
                        // Add your avatar properties here, e.g., backgroundImage, radius, etc.
                        child: Icon(Icons.person,
                                size: 38,), // You can replace this with your avatar image
                      ),
                      title: Text("${suggestion.fullName}",
                              style: const TextStyle(
                                fontSize: 20
                              ),),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Text("Gender: ${suggestion.gender}"),
                          Text("Email: ${suggestion.email}",
                            style: const TextStyle(
                                fontSize: 16
                            ),),
                          // Text("Religion: ${suggestion.religion}"),
                          // Text("Zodiac Sign: ${suggestion.zodiacSign}"
                          // ),
                          // Text(
                          //     "Birth Date: ${suggestion.birthDate.toLocal()}"), // Convert to local time
                          Text("Compatibility: ${suggestion.compatibility}",
                            style: const TextStyle(
                                fontSize: 16
                            ),),
                        ],
                      ),
                    ),
                  );

                },
              ),
            ),
          )



    //       Column(
    //     children: [
    //        Column(
    //           mainAxisAlignment: MainAxisAlignment.center,
    //           children: [
    //
    //
    //
    //
    //             // Text(friendSuggestions!.first.toString()),
    //             PrimaryButton(text: "Show Data", color: Colors.black,
    //                 onPressed: () async {
    //                  await getFriendSuggestions();
    //                   friendsData = friendSuggestions.toString();
    //
    //                  printFriendsData();
    //                  setState(() {
    //
    //                  });
    //                 }, textColor: Colors.white),
    //
    //                 Text(friendsData),
    //
    //
    //       // ListView.builder(
    //       // itemCount: friendSuggestions?.length,
    //       //   itemBuilder: (context, index) {
    //       //     return ListTile(
    //       //       title: Text(friendSuggestions?[index] as String),
    //       //       // You can customize ListTile as needed
    //       //       // For example, you can add onTap to handle item clicks
    //       //       // onTap: () {
    //       //       //   // Handle the tap on the friend suggestion
    //       //       // },
    //       //     );
    //       //   },
    //       //   ),
    //
    //
    //
    //           ],
    //
    //
    //
    //
    //         ),
    //
    //
    //   ],
    // ),
    );
  }
}












