import 'package:apicaaling/model/class_model.dart';
import 'package:apicaaling/services/api_function.dart';
import 'package:flutter/material.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.red,
        appBar: AppBar(
            backgroundColor: Colors.red,
            title: const Center(
              child: Text(
                'API',
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 30),
              ),
            )),
        resizeToAvoidBottomInset: false,
        body: FutureBuilder<List<Student2>>(
            future: Api().fetchData(),
            builder: (BuildContext context, snapshot) {
              if (snapshot.hasData) {
                print(snapshot.data?.length);
                return ListView.builder(
                    itemCount: snapshot.data?.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Card(
                        child: ListTile(
                          title: Text(snapshot.data![index].userId.toString()),
                          subtitle: Column(
                            children: [
                              Text(snapshot.data![index].id.toString()),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(snapshot.data![index].title.toString()),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(snapshot.data![index].body.toString())
                            ],
                          ),
                        ),
                      );
                    });
              } else {
                return const Text('Error');
              }
            }));
  }
}
