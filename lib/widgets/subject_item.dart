import 'package:archi_app/model/subject.dart';
import '../screens/subject-detail-screen.dart';
import 'package:archi_app/screens/subject-detail-screen.dart';
import 'package:flutter/material.dart';

class SubjectItem extends StatelessWidget {
  final String id;
  final String title;
  final String imageUrl;
  final int duration;
  final Complexity complexity;
  final Affordability affordability;

  SubjectItem({
    @required this.id,
    @required this.title,
    @required this.imageUrl,
    @required this.duration,
    @required this.complexity,
    @required this.affordability,
  });

  String get complexityText{
    switch (complexity) {
      case Complexity.Easy: 
        return 'Easy';
        break;
      case Complexity.Medium:
        return 'Medium';
        break;
      case Complexity.Hard:
        return 'Hard';
        break;
      default:
        return 'Unknown';
    }
  }

  String get affordabilityText{
    switch (affordability) {
      case Affordability.Affordable:
        return '3-Credits';
        break;
      case Affordability.Pricey:
        return '4-Credits';
        break;
      case Affordability.Luxurious:
        return '2-Credits';
        break;  
      default:
      return 'Unknown';  
    }
  }

  void SelectSubject(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (_) {
        return SubjectDetailScreen(id, title);
      })
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => SelectSubject(context),
      child: Card
      (shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
        ),
        elevation: 4,
        margin: EdgeInsets.all(10),
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
              ClipRRect(borderRadius: BorderRadius.only(
                topLeft: Radius.circular(15),
                topRight: Radius.circular(15),
              ),
              child: Image.network(
                imageUrl, 
                height: 250, 
                width: double.infinity, 
                fit: BoxFit.cover
                ),
              ),
              Positioned(
                bottom: 20,
                right: 10,
                 child: Container(
                   width: 300,
                   color: Colors.black54,
                   padding: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                   child: Text(
                  title, 
                  style: TextStyle(
                    color: Colors.white,
                    ),
                    softWrap: true,
                    overflow: TextOverflow.fade,
                    ),
                              ),
              ),
            ],
            ),
            Padding(padding: EdgeInsets.all(20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
              Row(children: <Widget>[
                Icon(Icons.schedule),
                SizedBox(width: 6),
                Text('$duration hours'),
              ],),
              Row(children: <Widget>[
                Icon(Icons.work),
                SizedBox(width: 6),
                Text(complexityText),
              ],),
              Row(children: <Widget>[
                Icon(Icons.content_paste),
                SizedBox(width: 6),
                Text(affordabilityText),
              ],),
            ],)
            )
          ]
        ),
        ),
    );
  }
}