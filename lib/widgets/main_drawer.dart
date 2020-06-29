import 'package:archi_app/main.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class MainDrawer extends StatelessWidget {
  Widget buildListTile(String title, IconData icon, Function tapHandler){
    return ListTile(leading: Icon(
          icon, 
          size:26), 
          title: Text(title,
          style: TextStyle(
            fontFamily: 'RobotoCondensed',
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
          ),
          onTap: tapHandler,
          );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(child: Column(children: <Widget>[
      Container(
        height: 120,
        width: double.infinity,
        padding: EdgeInsets.all(20),
        alignment: Alignment.centerLeft,
        color: Theme.of(context).accentColor,
        child: Text('ARCHI', style: TextStyle(
          fontWeight: FontWeight.w900,
          fontSize:30,
          color: Theme.of(context).primaryColor,
         ), 
         )
        ),
        SizedBox(
          height: 20,
          ),
        buildListTile('Archi', Icons.school,
        (){
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (_) {
              return MyApp();
            })
          );
        }
        ),
        ListTile(leading: Icon(
          Icons.book, 
          size:26), 
          title: Text('Sthapati',
          style: TextStyle(
            fontFamily: 'RobotoCondensed',
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
          ),
          onTap: ()=>launch('https://issuu.com/ssapiitkgp/docs/sthapati2k17_final_draft_'),
          ),
        //buildListTile('Sthapati', Icons.book),
        Container(
          height: 300,
          
          alignment: Alignment.bottomCenter,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
            Container(child:
            new IconButton(
              icon: new Icon(MdiIcons.facebook, size: 30,),
              onPressed: ()=>launch
              ('https://www.facebook.com/arpiitkgp/?ref=br_rs'),
                )
            ),
            Container(child:
            new IconButton(
              icon: new Icon(MdiIcons.instagram, size: 30,),
              onPressed: ()=>launch('https://www.instagram.com/iitkgp.arp/'),
              ),
          ),
          ],
          ),
        ),
    ],),);
  }
}