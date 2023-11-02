import 'package:flutter/material.dart';
import 'package:todo_app/pages/home/data/home_list_model.dart';
import 'package:todo_app/pages/home/widgets/home_list_details.dart';
import 'package:todo_app/pages/home/widgets/home_project.dart';
import 'package:todo_app/theme/app_style.dart';

class HomeList extends StatelessWidget {
  const HomeList({super.key});

  @override
  Widget build(BuildContext context) {
    // return SizedBox(
    //   width: double.infinity,
    //   height: MediaQuery.of(context).size.height * 0.2,
    //   child: Card(
    //     color: Colors.purple.shade300,
    //     elevation: 2,
    //     shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
    //     child: Padding(
    //       padding: EdgeInsets.all(12),
    //       child: Column(
    //         children: [
    //           Text(
    //             "Today's tasks",
    //             style: appstyle(17, Colors.white, FontWeight.normal),
    //           )
    //         ],
    //       ),
    //     ),
    //   ),
    // );

//The Home container lists
    return Column(
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.purple.shade300,
          ),
          child: ListView.separated(
              separatorBuilder: (context, index) {
                return Divider(
                  thickness: 1.5,
                );
              },
              shrinkWrap: true,
              padding: EdgeInsets.all(8),
              itemCount: tasklist.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => HomeListDetails(
                            HomeListAppbar: tasklist[index].title),
                      ),
                    );
                  },
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Container(
                            padding: EdgeInsets.all(9),
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.grey.shade300),
                            child: Center(
                              child: Icon(
                                tasklist[index].icon,
                                color: tasklist[index].color,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Text(
                            tasklist[index].title,
                            style:
                                appstyle(17, Colors.black, FontWeight.normal),
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              }),
        ),
        SizedBox(
          height: 30,
        ),
        HomeProject(),
      ],
    );
  }
}
