import 'package:flutter/material.dart';
import 'package:play2learn/Page_Controllers/page_controller_students.dart';
import 'package:play2learn/Pages/home_page_professor.dart';

class ProfessorOrStudent extends StatefulWidget {
  final String? role;
  const ProfessorOrStudent({super.key, required this.role});

  @override
  State<ProfessorOrStudent> createState() => _ProfessorOrStudentState();
}

class _ProfessorOrStudentState extends State<ProfessorOrStudent> {
  @override
  Widget build(BuildContext context) {
    if(widget.role == 'p'){
      return const HomePageProfessor();
    } else{
      return const PageControllerStudents(id: 2,);
    }
  }
}
