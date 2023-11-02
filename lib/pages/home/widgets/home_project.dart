import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:todo_app/theme/app_style.dart';

class HomeProject extends StatefulWidget {
  const HomeProject({super.key});

  @override
  State<HomeProject> createState() => _HomeProjectState();
}

class _HomeProjectState extends State<HomeProject> {
  bool isVisible = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Projects",
              style: appstyle(21, Colors.black, FontWeight.w500),
            ),
            IconButton(
                onPressed: () {
                  setState(() {
                    isVisible = !isVisible;
                  });
                },
                icon: Icon(Icons.arrow_downward))
          ],
        ),
        Column(
          children: [
            AnimatedContainer(
              duration: Duration(milliseconds: 300),
              curve: Curves.elasticInOut,
              child: Container(
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.purple.shade300,
                ),
                child: Visibility(
                    visible: isVisible,
                    child: ListView.builder(
                        itemCount: 1,
                        shrinkWrap: true,
                        padding: EdgeInsets.all(8),
                        itemBuilder: (context, index) {
                          return Column(
                            children: [
                              Row(
                                children: [
                                  Container(
                                    padding: EdgeInsets.all(9),
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.grey.shade300),
                                    child: Center(
                                      child: RotationTransition(
                                        turns:
                                            Tween(begin: 0.0, end: 0.5).animate(
                                          CurvedAnimation(
                                            parent: ModalRoute.of(context)!
                                                .animation!,
                                            curve: Curves.fastOutSlowIn,
                                          ),
                                        ),
                                        child: Icon(
                                          Ionicons.pencil,
                                          color: Colors.red,
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Text(
                                    "Projects",
                                    style: appstyle(
                                        17, Colors.black, FontWeight.normal),
                                  ),
                                ],
                              ),
                            ],
                          );
                        })),
              ),
            )
          ],
        )
      ],
    );
  }
}
