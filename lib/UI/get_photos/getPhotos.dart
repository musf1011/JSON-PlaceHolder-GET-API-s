import 'package:first_api_app/UI/get_photos/photosProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class GetPhotos extends StatefulWidget {
  const GetPhotos({super.key});

  @override
  State<GetPhotos> createState() => _GetPhotosState();
}

class _GetPhotosState extends State<GetPhotos> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => PhotosProvider(),
      child: Consumer<PhotosProvider>(
        builder: (context, model, child) => Scaffold(
          appBar: AppBar(
            title: const Text('Photos Tiles'),
            centerTitle: true,
          ),
          body: Column(
            children: [
              FutureBuilder(
                  future: model.getPhotosData(),
                  builder: (context, snapshot) {
                    return Expanded(
                      child: ListView.builder(
                          itemCount: model.photosList.length,
                          itemBuilder: (context, index) {
                            return ListTile(
                              leading: Text('${model.photosList[index].id}'),
                              title: Text('${model.photosList[index].title}'),
                              trailing: Container(
                                width: 50,
                                height: 50,
                                decoration: BoxDecoration(
                                  color: Colors.amber,
                                  // image: DecorationImage(
                                  //     image:
                                  //  NetworkImage(
                                  //     '${model.photosList[index].url}')
                                  // )
                                ),
                                child: Image.network(
                                    '${model.photosList[index].url}'),
                              ),
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
