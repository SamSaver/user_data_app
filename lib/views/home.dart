import 'package:flutter/material.dart';
import 'package:users_app/widgets/post_user.dart';
import 'package:users_app/widgets/show_users.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int navbarIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/bg.jpg"),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
          // Bottom Navigation Bar
          backgroundColor: Colors.transparent,
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: navbarIndex,
            selectedItemColor: Colors.amber[800],
            unselectedItemColor: Colors.grey,
            backgroundColor: Colors.black,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.post_add),
                label: 'Post',
              ),
            ],
            onTap: (index) {
              setState(() {
                navbarIndex = index;
              });
            },
          ),
          body: navbarIndex == 0
              ? const ShowUsers()
              : navbarIndex == 1
                  ? const PostUser()
                  : null),
    );
  }
}
