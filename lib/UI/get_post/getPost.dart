import 'package:first_api_app/UI/get_post/postProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Getpost extends StatefulWidget {
  const Getpost({super.key});

  @override
  State<Getpost> createState() => _GetpostState();
}

class _GetpostState extends State<Getpost> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => PostProvider(),
        child: Consumer<PostProvider>(
            builder: (context, model, child) => Scaffold(
                    body: Column(children: [
                  FutureBuilder(
                      future: model.getPostData(),
                      builder: (context, snapshot) {
                        return Expanded(
                            child: ListView.builder(
                                itemCount: model.postList.length,
                                itemBuilder: (context, index) {
                                  return ListTile(
                                    title:
                                        Text('${model.postList[index].title}'),
                                    subtitle:
                                        Text('${model.postList[index].body}'),
                                  );
                                }));
                      })
                ]))));
  }
}
