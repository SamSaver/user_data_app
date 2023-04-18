import 'package:flutter/material.dart';

import '../models/user.dart';

class ResponseWidget extends StatelessWidget {
  const ResponseWidget(
      {super.key, required this.response, required this.visibility});

  final User? response;
  final bool visibility;

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: visibility,
      child: Container(
        padding: const EdgeInsets.all(20),
        child: response != null
            ? Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.white24,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black87,
                      blurRadius: 10,
                      offset: Offset(0, 10),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    const Text(
                      "Response",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.amber,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      "First Name: ${response!.fname}",
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                        color: Colors.amber,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      "Last Name: ${response!.lname}",
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                        color: Colors.amber,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      "Email: ${response!.email}",
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                        color: Colors.amber,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      "Avatar: ${response!.avatar}",
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                        color: Colors.amber,
                      ),
                    ),
                  ],
                ),
              )
            : const Text("No response"),
      ),
    );
  }
}
