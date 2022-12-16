import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'i18n/intl_localization.dart';

class pageC extends StatefulWidget {
  const pageC({Key? key}) : super(key: key);

  @override
  State<pageC> createState() => _pageCState();
}

class _pageCState extends State<pageC> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Red Application")),
      body: Padding(
        padding: const EdgeInsets.only(bottom: 15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(padding: EdgeInsets.all(15),child: Text(Locs.of(context).trans("work")),color: Colors.red,),
                Container(padding: EdgeInsets.all(15),child: Text(Locs.of(context).trans("yes")),color: Colors.green,)
              ],
            ),
            Text(Locs.of(context).trans("nobody")),
            Text(Locs.of(context).trans("Toaster"))
          ],
        ),
      ),
    );
  }
}
