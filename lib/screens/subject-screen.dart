import 'package:flutter/material.dart';
import '../dummy_data.dart';
import '../widgets/subject_item.dart';

class SubjectScreen extends StatelessWidget {
   final String subjectId;
   final String subjectTitle; 
   
   SubjectScreen(this.subjectId, this.subjectTitle);
  @override
  Widget build(BuildContext context) {
    final categorySubject = DUMMY_SubjectS.where((subject) {
      return subject.categories.contains(subjectId);
    }).toList();
    return Scaffold(
      appBar: AppBar(
        title: Text(subjectTitle),
      ),
    body: 
    ListView.builder(itemBuilder: (ctx, index){
      return SubjectItem(
        id: categorySubject[index].id,
        title: categorySubject[index].title,
        imageUrl: categorySubject[index].imageUrl,
        duration: categorySubject[index].duration,
        affordability: categorySubject[index].affordability,
        complexity: categorySubject[index].complexity,
      );
    }, itemCount: categorySubject.length,)
    );
  }
}