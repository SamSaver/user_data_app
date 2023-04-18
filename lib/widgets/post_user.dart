import 'dart:math';

import 'package:flutter/material.dart';
import 'package:users_app/models/user.dart';

import '../api/helper.dart';
import 'response.dart';

class PostUser extends StatefulWidget {
  const PostUser({super.key});

  @override
  State<PostUser> createState() => _PostUserState();
}

class _PostUserState extends State<PostUser> {
  final _formKey = GlobalKey<FormState>();
  final _fnameController = TextEditingController();
  final _lnameController = TextEditingController();
  final _emailController = TextEditingController();
  final _avatarController = TextEditingController();
  User? _response;

  // get random integer function
  int getRandomInt(int min, int max) {
    return min + (max - min) * Random().nextInt(100) ~/ 100;
  }

  bool loading = false;

  @override
  Widget build(BuildContext context) {
    return loading
        ? const Center(
            child: CircularProgressIndicator(),
          )
        : Container(
            padding: const EdgeInsets.only(left: 20, top: 40, right: 20),
            child: Form(
              key: _formKey,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    TextFormField(
                      controller: _fnameController,
                      cursorColor: Colors.amber,
                      style: const TextStyle(
                        color: Colors.amber,
                      ),
                      decoration: const InputDecoration(
                        labelText: 'First Name',
                        labelStyle: TextStyle(color: Colors.white38),
                        floatingLabelStyle: TextStyle(color: Colors.amber),
                        border: OutlineInputBorder(),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your first name';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                      controller: _lnameController,
                      cursorColor: Colors.amber,
                      style: const TextStyle(
                        color: Colors.amber,
                      ),
                      decoration: const InputDecoration(
                        labelText: 'Last Name',
                        labelStyle: TextStyle(color: Colors.white38),
                        floatingLabelStyle: TextStyle(color: Colors.amber),
                        border: OutlineInputBorder(),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your last name';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                      controller: _emailController,
                      cursorColor: Colors.amber,
                      style: const TextStyle(
                        color: Colors.amber,
                      ),
                      decoration: const InputDecoration(
                        labelText: 'Email',
                        labelStyle: TextStyle(color: Colors.white38),
                        floatingLabelStyle: TextStyle(color: Colors.amber),
                        border: OutlineInputBorder(),
                      ),
                      validator: (value) {
                        if (value == null ||
                            value.isEmpty ||
                            !value.contains('@')) {
                          return 'Please enter your email';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                      controller: _avatarController,
                      cursorColor: Colors.amber,
                      style: const TextStyle(
                        color: Colors.amber,
                      ),
                      decoration: const InputDecoration(
                        labelText: 'Avatar (URL)',
                        labelStyle: TextStyle(color: Colors.white38),
                        floatingLabelStyle: TextStyle(color: Colors.amber),
                        border: OutlineInputBorder(),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your avatar url';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () async {
                        setState(() {
                          loading = true;
                        });

                        if (_formKey.currentState!.validate()) {
                          final user = User(
                            fname: _fnameController.text,
                            lname: _lnameController.text,
                            email: _emailController.text,
                            avatar: _avatarController.text,
                          );

                          await postUser(user).then((value) {
                            print("value: ${value}");
                            if (value != null) {
                              setState(() {
                                loading = false;
                                _response = value;
                              });

                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text('User added successfully'),
                                ),
                              );

                              _fnameController.clear();
                              _lnameController.clear();
                              _emailController.clear();
                              _avatarController.clear();
                            } else {
                              setState(() {
                                loading = false;
                              });

                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text('Error adding user'),
                                ),
                              );
                            }
                          });
                        }
                      },
                      child: const Text('Submit'),
                    ),
                    // Response from API
                    ResponseWidget(
                        response: _response, visibility: (_response != null)),
                  ],
                ),
              ),
            ),
          );
  }
}
