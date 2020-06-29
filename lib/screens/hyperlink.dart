import 'package:flutter/material.dart';

import 'package:url_launcher/url_launcher.dart';

class Hyperlink extends StatelessWidget {
  final String _url;

  Hyperlink(this._url);

  _launchURL() async {
    if (await canLaunch(_url)) {
      await launch(_url);
    } else {
      throw 'Could not launch $_url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        width: 170,
        padding: EdgeInsets.all(0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(
              Icons.folder,
              color: Colors.blueGrey,
              size: 30.0,
              ),
               Text('Resources',
                style: TextStyle(color: Colors.white,
                fontSize: 20),
              ),
              ], 
        ),
         decoration: BoxDecoration(
           gradient: LinearGradient(
             colors: [Colors.black54.withOpacity(0.7),
               Colors.black38,
               ],
               begin: Alignment.topLeft,
               end: Alignment.bottomRight),
                borderRadius: BorderRadius.circular(5),
               )                 
      ),
      onTap: _launchURL,
    );
  }
}