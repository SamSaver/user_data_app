import 'package:flutter/material.dart';
import '../api/helper.dart';
import '../models/user.dart';
import 'user_card.dart';

class ShowUsers extends StatefulWidget {
  const ShowUsers({super.key});

  @override
  State<ShowUsers> createState() => _ShowUsersState();
}

class _ShowUsersState extends State<ShowUsers> {
  bool loading = true;
  List<User> users = <User>[];

  @override
  void initState() {
    super.initState();

    fetchUsers().then((value) {
      setState(() {
        users = value;
        loading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 20, top: 40, right: 20),
      child: Column(
        children: [
          loading
              ? const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                )
              : Flexible(
                  child: GridView.builder(
                    shrinkWrap: true,
                    physics: const BouncingScrollPhysics(),
                    gridDelegate:
                        const SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 220,
                      childAspectRatio: 0.65,
                      crossAxisSpacing: 20,
                      mainAxisSpacing: 20,
                    ),
                    itemBuilder: (_, index) => UserCard(
                      user: users[index],
                    ),
                    itemCount: users.length,
                  ),
                ),
        ],
      ),
    );
  }
}
