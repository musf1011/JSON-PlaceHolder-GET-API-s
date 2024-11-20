import 'package:first_api_app/UI/get_comment/commentProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class GetComment extends StatefulWidget {
  const GetComment({super.key});

  @override
  State<GetComment> createState() => _GetcommeComment();
}

class _GetcommeComment extends State<GetComment> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => CommentProvider(),
        child: Consumer<CommentProvider>(
            builder: (context, model, child) => Scaffold(
                  body: Column(
                    children: [
                      FutureBuilder(
                          future: model.getCommentData(),
                          builder: (context, snapshot) {
                            return Expanded(
                                child: ListView.builder(
                                    itemCount: model.commentList.length,
                                    itemBuilder: (context, index) {
                                      return ListTile(
                                        title: Text(
                                            '${model.commentList[index].name}'),
                                        subtitle: Text(
                                            '${model.commentList[index].body}'),
                                        trailing: Text(
                                            model.commentList[index].email ??
                                                ''),
                                      );
                                    }));
                          })
                    ],
                  ),
                )));
  }
}
