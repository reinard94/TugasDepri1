import 'package:flutter/material.dart';
import 'package:tugas_depri_1/database/database.dart';
import 'package:tugas_depri_1/models/user_detail_args.dart';
import 'package:tugas_depri_1/views/user/detail.dart';

class ListUserPage extends StatefulWidget {
  const ListUserPage({Key? key}) : super(key: key);
  static String tag = "list-user";

  @override
  _ListUserPageState createState() => _ListUserPageState();
}

class _ListUserPageState extends State<ListUserPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("User List")),
      body: Container(
        child: ListView.builder(
          itemCount: Database.users.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                UserDetailArgs args = UserDetailArgs(
                    user: Database.users.elementAt(index),
                    callback: () {
                      setState(() {});
                    });
                Navigator.of(context)
                    .pushNamed(DetailUserPage.tag, arguments: args)
                    .then((value) {
                  print(value);
                  setState(() {});
                });
              },
              child: Card(
                elevation: 10,
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.all(10),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(Database.users.elementAt(index).name),
                            SizedBox(width: 50),
                            Text(Database.users.elementAt(index).nim),
                          ]),
                    ),
                    Container(
                      width: double.infinity,
                      alignment: Alignment.centerLeft,
                      margin: EdgeInsets.all(10),
                      child: Column(
                        children: [
                          Text(Database.users.elementAt(index).address),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
