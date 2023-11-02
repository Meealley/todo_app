import 'package:flutter/material.dart';
import 'package:todo_app/theme/app_colors.dart';
import 'package:todo_app/theme/app_style.dart';

class HomeListDetails extends StatelessWidget {
  final String HomeListAppbar;
  const HomeListDetails({super.key, required this.HomeListAppbar});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppConst.kPurple,
        title: Text(
          HomeListAppbar,
          style: appstyle(23, Colors.white, FontWeight.w500),
        ),
      ),
      body: Column(
        children: [],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppConst.kPurple,
        onPressed: () {
          showModalBottomSheet(
              context: context,
              builder: (context) => SingleChildScrollView(
                    child: Container(
                      padding: EdgeInsets.only(
                        bottom: MediaQuery.of(context).viewInsets.bottom,
                      ),
                      child: Container(
                        padding: EdgeInsets.all(8),
                        child: Column(
                          children: [
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              "Task Name",
                              style:
                                  appstyle(18, Colors.black, FontWeight.w500),
                            ),
                            SizedBox(
                              height: 18,
                            ),
                            TextField(
                              autofocus: true,
                              keyboardType: TextInputType.text,
                              decoration: InputDecoration(
                                  label: Text("Task name"),
                                  labelStyle: appstyle(
                                      18, Colors.black, FontWeight.normal)),
                            ),
                            SizedBox(
                              height: 29,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ));
        },
        tooltip: 'Add to do',
        child: const Icon(Icons.add),
      ),
    );
  }
}
