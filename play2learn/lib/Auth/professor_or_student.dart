import 'package:flutter/material.dart';
import 'package:play2learn/Pages/home_page_professor.dart';
import 'package:play2learn/Pages/home_page_student.dart';

class ProfessorOrStudent extends StatefulWidget {
  final String? role;
  ProfessorOrStudent({super.key, required this.role});

  @override
  State<ProfessorOrStudent> createState() => _ProfessorOrStudentState();
}

class _ProfessorOrStudentState extends State<ProfessorOrStudent> {
  @override
  Widget build(BuildContext context) {
    if(widget.role == 'p'){
      return Home_Page_Professor();
    } else{
      return Home_Page_Student();
    }
  }
}
