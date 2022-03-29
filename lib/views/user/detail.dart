import 'package:flutter/material.dart';
import 'package:tugas_depri_1/database/database.dart';
import 'package:tugas_depri_1/models/user.dart';
import 'package:tugas_depri_1/models/user_detail_args.dart';
import 'package:tugas_depri_1/views/user/list.dart';

class DetailUserPage extends StatefulWidget {
  const DetailUserPage({Key? key}) : super(key: key);
  static String tag = "detail-user";

  @override
  _DetailUserPageState createState() => _DetailUserPageState();
}

class _DetailUserPageState extends State<DetailUserPage> {
  TextEditingController _txtName = TextEditingController();
  TextEditingController _txtAddress = TextEditingController();

  static const String VIEW_MODE = "view";
  static const String EDIT_MODE = "edit";
  String _currentMode = VIEW_MODE;
  UserDetailArgs? _args;
  User? _user;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _args = ModalRoute.of(context)!.settings.arguments as UserDetailArgs;
    _user = _args!.user as User;
    // _user = ModalRoute.of(context)!.settings.arguments as User;
    print("name : " + _user!.name);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Details of: ${_user!.name}"),
        actions: [
          IconButton(
            onPressed: () {
              //Navigator.of(context).pushNamed(EditPage.tag);
              // print("edit di pencet");
              setState(() {
                if (_currentMode == EDIT_MODE) {
                  _currentMode = VIEW_MODE;
                } else {
                  _currentMode = EDIT_MODE;
                  _txtName = TextEditingController(text: _user!.name);
                  _txtAddress = TextEditingController(text: _user!.address);
                }
              });
            },
            icon: Icon(Icons.edit),
          ),
          IconButton(
            onPressed: () {
              Database.users
                  .removeWhere((element) => element.nim == _user!.nim);
              if (_args!.callback != null) {
                _args!.callback!();
              }
              Navigator.of(context).pop(true);
              // Navigator.of(context).popAndPushNamed(ListUserPage.tag);
            },
            icon: Icon(Icons.delete),
          ),
        ],
      ),
      body: _generateBody(),
    );
  }

  Widget _generateBody() {
    if (_currentMode == VIEW_MODE) {
      //generate view body
      return Column(
        children: [
          Text("Name : " + _user!.name),
          Text("NIM : " + _user!.nim),
          Text("Address : " + _user!.address),
        ],
      );
    } else if (_currentMode == EDIT_MODE) {
      //generate edit body
      return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.all(10),
            child: TextFormField(
              controller: _txtName,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey)),
                  hintText: "Name"),
            ),
          ),
          Text("NIM : " + _user!.nim),
          Container(
            margin: EdgeInsets.all(10),
            child: TextFormField(
              controller: _txtAddress,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey)),
                  hintText: "Address"),
            ),
          ),
          Container(
              margin: EdgeInsets.all(10),
              child: TextButton(
                onPressed: () {
                  User selectedUser = Database.users
                      .firstWhere((element) => element.nim == _user!.nim);
                  selectedUser.name = _txtName.text;
                  selectedUser.address = _txtAddress.text;
                  setState(() {
                    _currentMode = VIEW_MODE;
                  });
                },
                child: const Text(
                  "Edit",
                  style: TextStyle(color: Colors.white),
                ),
                style: ButtonStyle(
                  minimumSize: MaterialStateProperty.all(
                      const Size(double.infinity, 50)),
                  backgroundColor: MaterialStateProperty.all(Colors.blue),
                ),
              ))
        ],
      );
    }

    return Container();
  }
}
