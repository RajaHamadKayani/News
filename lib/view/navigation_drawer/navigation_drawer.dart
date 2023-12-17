
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class MyNavigationDrawer extends StatefulWidget {
  String? title;
  String? email;
  MyNavigationDrawer({super.key, this.email, this.title});

  @override
  State<MyNavigationDrawer> createState() => _MyNavigationDrawerState();
}

class _MyNavigationDrawerState extends State<MyNavigationDrawer> {
  List<String> title = ["Live Location", "Charging module", "Add tasks"];
  List<Icon> icons = [
    const Icon(Icons.location_on),
    const Icon(Icons.charging_station),
    const Icon(Icons.task)
  ];
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          UserAccountsDrawerHeader(
            decoration: const BoxDecoration(color: Colors.teal),
            accountName: Text(widget.title ?? ""),
            accountEmail: Text(widget.email ?? ""),
          ),
          Expanded(
            child: SizedBox(
              width: double.infinity,
              child: ListView.builder(
                  itemCount: title.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: ClipRRect(
                        child: GestureDetector(
                          onTap: () {
                          },
                          child: SizedBox(
                            width: double.infinity,
                            child: Card(
                              child: ListTile(
                                leading: icons[index],
                                title: Text(title[index].toString()),
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  }),
            ),
          )
        ],
      ),
    );
  }

  
}
