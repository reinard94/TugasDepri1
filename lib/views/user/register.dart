import 'package:flutter/material.dart';
import 'package:tugas_depri_1/database/database.dart';
import 'package:tugas_depri_1/models/user.dart';
import 'package:tugas_depri_1/views/user/list.dart';
import 'package:tugas_depri_1/views/user/navigation_page.dart';

class RegisterUserPage extends StatefulWidget {
  const RegisterUserPage({Key? key}) : super(key: key);
  static String tag = "register-user";

  @override
  _RegisterUserPageState createState() => _RegisterUserPageState();
}

class _RegisterUserPageState extends State<RegisterUserPage> {
  TextEditingController _txtName = TextEditingController();
  TextEditingController _txtNim = TextEditingController();
  TextEditingController _txtAddress = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            width: double.infinity,
            child: Center(
                child: ListView(
              shrinkWrap: true,
              children: [
                _formGroup("Name", _txtName),
                _formGroup("NIM", _txtNim),
                _formGroup("Address", _txtAddress),
                Container(
                    margin: EdgeInsets.all(10),
                    child: TextButton(
                      onPressed: () {
                        Database.users.add(User(
                            name: _txtName.text,
                            nim: _txtNim.text,
                            address: _txtAddress.text));
                        Navigator.of(context).pushNamed(NavigationPage.tag);
                      },
                      child: const Text(
                        "Register",
                        style: TextStyle(color: Colors.white),
                      ),
                      style: ButtonStyle(
                        minimumSize: MaterialStateProperty.all(
                            const Size(double.infinity, 50)),
                        backgroundColor: MaterialStateProperty.all(Colors.blue),
                      ),
                    ))
              ],
            ))));
  }

  Widget _formGroup(String title, TextEditingController controller) {
    return Container(
        margin: EdgeInsets.all(10),
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                title,
              ),
            ),
            TextFormField(
              controller: controller,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey)),
                  hintText: title),
            ),
          ],
        ));

    return Container();
  }
}
