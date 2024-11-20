import 'package:first_api_app/UI/get_album/AlbumProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class getAlbum extends StatefulWidget {
  const getAlbum({super.key});

  @override
  State<getAlbum> createState() => _getAlbumState();
}

class _getAlbumState extends State<getAlbum> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AlbumProvider(),
      child: Consumer<AlbumProvider>(
        builder: (context, model, child) => Scaffold(
          body: Column(
            children: [
              FutureBuilder(
                  future: model.getAlbumData(),
                  builder: (context, snapshot) {
                    return Expanded(
                      child: ListView.builder(
                          itemCount: model.albumList.length,
                          itemBuilder: (context, index) {
                            return ListTile(
                              title: Text('${model.albumList[index].id}'),
                              subtitle:
                                  Text('${model.albumList[index].userId}'),
                              trailing: Text('${model.albumList[index].title}'),
                            );
                          }),
                    );
                  })
            ],
          ),
        ),
      ),
    );
  }
}
