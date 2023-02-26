import 'package:api_integration_third/services/home_view_services.dart';
import 'package:api_integration_third/views/update.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: homedata(),
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data.data.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text("${snapshot.data.data[index].name}"),
                  subtitle: Text("${snapshot.data.data[index].email}"),
                  trailing: GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => UpdateView(
                                  name: "${snapshot.data.data[index].name}",
                                  email: "${snapshot.data.data[index].email}",
                                  id: "${snapshot.data.data[index].id}")));
                    },
                    child: Icon(Icons.add),
                  ),
                );
              },
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
