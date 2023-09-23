import 'dart:convert';
import '../model/class_model.dart';
import 'package:http/http.dart' as http;

class Api {
  Future<List<Student2>> fetchData() async {
    final response =
        await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));
    var data1 = jsonDecode(response.body);
    List<Student2> students = await data1.map<Student2>((item) {
      return Student2.fromJson(item);
    }).toList();
    return students;
  }
}
