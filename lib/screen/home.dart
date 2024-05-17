import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:todo_app/const/colors.dart';
import 'package:todo_app/screen/add_note_screen.dart';
import 'package:todo_app/widgets/task_widgets.dart';

class Home_Screen extends StatefulWidget {
  const Home_Screen({super.key});

  @override
  State<Home_Screen> createState() => _Home_ScreenState();
}

class _Home_ScreenState extends State<Home_Screen> {
  @override
  bool show = true;
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: backgroundColors,
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => Add_Screen()));
          },
          backgroundColor: custom_green,
          child: Icon(
            Icons.add,
            size: 30,
          ),
        ),
        body: SafeArea(
          child: NotificationListener<UserScrollNotification>(
            onNotification: (notification) {
              if (notification.direction == ScrollDirection.forward) {
                setState(() {
                  show = true;
                });
              }
              if (notification.direction == ScrollDirection.reverse) {
                setState(() {
                  show = false;
                });
              }
              return true;
            },
            child: ListView.builder(
              itemBuilder: (context, index) {
                return Task_Widget();
              },
              itemCount: 10,
            ),
          ),
        ));
  }
}
