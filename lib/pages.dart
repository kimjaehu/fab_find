import 'package:flutter/material.dart';
import 'package:fab_find/widgets/provider_widget.dart';
import 'package:fab_find/services/auth_service.dart';

class SearchView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.yellow,
    );
  }
}

class SavedView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red,
    );
  }
}

class AccountView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _width = MediaQuery.of(context).size.width;
    final _height = MediaQuery.of(context).size.height;
    return Container(
      width: _width,
      height:_height,
      color: Colors.green,
      child: IconButton(
              icon: Icon(Icons.undo),
              onPressed: () async {
               try {
                 AuthService auth = Provider.of(context).auth;
                 await auth.signOut();
                 print('Signed Out');               
              } catch (e) {
                print (e);
              }
              }),
    );
  }
}