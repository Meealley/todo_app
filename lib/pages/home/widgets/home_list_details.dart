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
              builder: (context) {
                return Container(
                  height: MediaQuery.of(context).size.height * 0.40,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade100,
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(18),
                      topRight: Radius.circular(18),
                    ),
                  ),
                  child: Stack(
                    children: [
                      Column(
                        children: [
                          SizedBox(
                            height: 12,
                          ),
                          TextFormField(
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderSide: BorderSide.none),
                              labelText: 'Task Name',
                            ),
                            style: appstyle(17, Colors.black, FontWeight.w600),
                          )
                        ],
                      ),
                    ],
                  ),
                );
              });
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
