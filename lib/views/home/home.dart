import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_api_tutorial/models/posts_model.dart';
import 'package:flutter_api_tutorial/services/api_services.dart';
import 'package:http/http.dart' as http;

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // List<PostsModel> posts = [];

  // @override
  // void initState() {
  //   super.initState();
  //   fetchData();
  // }
  //
  // fetchData() async {
  //   final data = await ApiServices.fetchData();
  //
  //   print(data!.length);
  //
  //   setState(() {
  //     posts = data;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: const Text(
          'API Integration By Programming Wormhole',
          style: TextStyle(fontSize: 15),
        ),
      ),
      body: FutureBuilder(
          future: ApiServices.fetchData(),
          builder: (context, snapshot) {

            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }

            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (_, index) {
                final data = snapshot.data![index];
                return Card(
                  child: ListTile(
                    leading: Image.network(data.thumbnail),
                    title: Text(data.title),
                    subtitle: Text(
                      data.description,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                );
              },
            );
          }),
    );
  }
}
