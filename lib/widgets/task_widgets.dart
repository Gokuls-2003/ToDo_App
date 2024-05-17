import 'package:flutter/material.dart';
import 'package:todo_app/const/colors.dart';
import 'package:todo_app/screen/edit_screen.dart';

class Task_Widget extends StatefulWidget {
  const Task_Widget({super.key});

  @override
  State<Task_Widget> createState() => _Task_WidgetState();
}

bool isDone = false;

class _Task_WidgetState extends State<Task_Widget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      child: Container(
        width: double.infinity,
        height: 130,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 5,
              blurRadius: 7,
              offset: Offset(0, 2),
            )
          ],
        ),
        child: Row(
          children: [
            image(),
            SizedBox(width: 20),
            Expanded(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'title',
                          style: TextStyle(
                              fontSize: 1, fontWeight: FontWeight.bold),
                        ),
                        Checkbox(
                          value: isDone,
                          onChanged: (value) {
                            setState(() {
                              isDone = !isDone;
                            });
                          },
                        )
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text('Subtitle',
                        style: TextStyle(
                            fontSize: 1,
                            fontWeight: FontWeight.w400,
                            color: Colors.grey.shade400)),
                    Spacer(),
                    edit_time()
                  ]),
            )
          ],
        ),
      ),
    );
  }

  Widget edit_time() {
    return Row(
      children: [
        Container(
            width: 90,
            height: 28,
            decoration: BoxDecoration(
              color: custom_green,
              borderRadius: BorderRadius.circular(18),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              child: Row(
                children: [
                  Image.asset('images/icon_time.png'),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    "time",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            )),
        SizedBox(
          width: 20,
        ),
        GestureDetector(
          onTap: () {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => Edit_Screen()));
          },
          child: Container(
              width: 90,
              height: 28,
              decoration: BoxDecoration(
                color: Color(0xffE2F6F1),
                borderRadius: BorderRadius.circular(18),
              ),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                child: Row(
                  children: [
                    Image.asset('images/icon_edit.png'),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      "edit",
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              )),
        ),
      ],
    );
  }

  Widget image() {
    return Container(
      height: 130,
      width: 100,
      decoration: BoxDecoration(
        color: Colors.white,
        image: DecorationImage(
          image: AssetImage('images/1.png'),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
