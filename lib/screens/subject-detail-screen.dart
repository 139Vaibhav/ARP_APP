import 'package:flutter/material.dart';
import '../dummy_data.dart';
import './hyperlink.dart';

class SubjectDetailScreen extends StatelessWidget {
  final String subjectDetailId;
  final String subjectDetailTitle;
  
  SubjectDetailScreen(this.subjectDetailId, this.subjectDetailTitle);

  Widget buildSectionTitle(BuildContext context,String text) {
    return Container(
            margin: EdgeInsets.symmetric(vertical: 10),
            child: Text(
              text, 
              style: Theme.of(context).textTheme.title,
              ),
              );
  }

  Widget buildContainer(Widget child) {
   return Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(10),
                ),
                margin: EdgeInsets.all(10),
                padding: EdgeInsets.all(10),
                height: 250,
                width: 300,
                child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    final selectedSubject = DUMMY_SubjectS.firstWhere((subject) => subject.id == subjectDetailId);
    return Scaffold(
      appBar: AppBar(title: Text('${selectedSubject.title}'),),
      body: SingleChildScrollView(
              child: Column(children: <Widget>[
          Container(
            height: 300,
            width: double.infinity,
            child: Image.network(
              selectedSubject.imageUrl,
              fit: BoxFit.cover,
            )
            ),
            Container(
              child:Hyperlink(selectedSubject.resourceUrl),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 10),
              child: Text(
                'Grades', 
                style: Theme.of(context).textTheme.title,
                ),
                ),
                buildContainer(
                   ListView.builder(
                    itemBuilder: (ctx, index) => Card(
                      color: Theme.of(context).accentColor,
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: 5, 
                          horizontal: 10
                          ),
                      child: Text(selectedSubject.grades[index])),
                    ),
                  itemCount: selectedSubject.grades.length,  
                    ),
                    ),
                  buildSectionTitle(context, 'Syllabus'),
                  buildContainer(
                    ListView.builder(
                      itemCount: selectedSubject.steps.length,
                      itemBuilder: (ctx, index) => ListTile(
                        leading: CircleAvatar(
                          child: Text('# ${(index + 1)}',),
                      ),
                      title: Text(selectedSubject.steps[index]),
                    )
                  ),),
        ],
        ),
      ),
    );
  }
}