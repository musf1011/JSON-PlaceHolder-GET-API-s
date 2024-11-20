import 'package:first_api_app/UI/get_user/userModel.dart';
import 'package:first_api_app/UI/get_user/userProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Getuser extends StatefulWidget {
  const Getuser({super.key});

  @override
  State<Getuser> createState() => _GetuserState();
}

class _GetuserState extends State<Getuser> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => UserProvider(),
      child: Consumer<UserProvider>(builder: (context, model, child) {
        return Scaffold(
          appBar: AppBar(
            title: Text('USER DATA'),
            centerTitle: true,
          ),
          body: Column(
            children: [
              FutureBuilder(
                  future: model.getUserData(),
                  builder: (context, snapshot) {
                    return Expanded(
                      child: ListView.builder(
                          itemCount: model.userList.length,
                          itemBuilder: (context, index) {
                            return ListTile(
                              leading: Text('${model.userList[index].name}'),
                              title: Text(
                                  '${model.userList[index].username} ${model.userList[index].email}'),
                              subtitle: Text(
                                  '${model.userList[index].address?.street}  ${model.userList[index].address?.suite}  ${model.userList[index].address?.city}  ${model.userList[index].address?.zipcode}'),
                              trailing: Text(
                                  '${model.userList[index].website}  ${model.userList[index].company?.name}  '),
                            );
                          }),
                    );
                  }),
            ],
          ),
        );
      }),
    );
  }
}
