import 'package:flutter/material.dart';
import 'package:h2o/screens/friends_suggestion_screen.dart';
import 'package:h2o/screens/login_screen.dart';
import 'package:h2o/widgets/primary_button.dart';

class FindFriendsScreen extends StatefulWidget {
  const FindFriendsScreen({super.key});

  @override
  State<FindFriendsScreen> createState() => _FindFriendsScreenState();
}

class _FindFriendsScreenState extends State<FindFriendsScreen> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: const Text("Find Friends"),

        leading: InkWell(child: const Icon(Icons.arrow_back_ios), onTap: (){
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(
              builder: (context) => const LoginScreen(),
            ),
          );
        },),

      ),
      body:  SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [

                Padding(
                  padding: const EdgeInsets.only(top: 200),
                  child: Image.asset("assets/logo/find_friends_icon.png"),
                ),

              const Text(
                "Wait...",
                style: TextStyle(color: Colors.black, fontSize: 28, fontFamily: 'Adamina-Regular',
                    fontWeight: FontWeight.bold),
              ),
             const  Text(
                "We're searching friends for you",
                style: TextStyle(color: Colors.black, fontSize: 24, fontFamily: 'Adamina-Regular',
                    fontWeight: FontWeight.w400),
              ),


              Padding(
                padding: const EdgeInsets.only(top: 200),
                child: PrimaryButton(text: "Continue", color: Colors.black,
                    onPressed: (){

                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder:
                          (context) => const FriendsSuggestionPage()));
                    }, textColor: Colors.white),
              )
            ],
          ),
        ),
      ),
    );
  }
}
