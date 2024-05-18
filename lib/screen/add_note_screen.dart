import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:todo_app/const/colors.dart';
import 'package:todo_app/data/fire_store.dart';

class Add_Screen extends StatefulWidget {
  const Add_Screen({super.key});

  @override
  State<Add_Screen> createState() => _Add_ScreenState();
}

class _Add_ScreenState extends State<Add_Screen> {
  final title = TextEditingController();
  final subtitle = TextEditingController();

  FocusNode _focusNode1 = FocusNode();
  FocusNode _focusNode2 = FocusNode();

  int indexValue= 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColors,
      body: SafeArea(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          title_widgets(),
          SizedBox(
            height: 20,
          ),
          subtitle_widgets(),
          SizedBox(
            height: 100,
          ),
          images(),
          SizedBox(
            height: 20,
          ),
          button()
        ],
      )),
    );
  }

  Widget button() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green, minimumSize: Size(170, 48)),
            onPressed: () {
              FireStore_Datasource().AddNote(subtitle.text, title.text, indexValue);
              Navigator.pop(context);
            },
            child: Text(
              "Add Task",
              style: TextStyle(color: Colors.white),
            )),
        ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red, minimumSize: Size(170, 48)),
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text("cancel", style: TextStyle(color: Colors.white))),
      ],
    );
  }

  Container images() {
    return Container(
      height: 200,
      child: ListView.builder(
        itemCount: 4,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              indexValue = index;
              Logger().e(indexValue);
              Logger().w(index);
            },
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                      width: 2,
                      color: indexValue == index ? custom_green : Colors.grey)),
              width: 140,
              margin: EdgeInsets.all(8),
              child: Column(
                children: [Image.asset('images/${index}.png')],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget title_widgets() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
        ),
        child: TextField(
          controller: title,
          focusNode: _focusNode1,
          style: TextStyle(fontSize: 18, color: Colors.black),
          decoration: InputDecoration(
              contentPadding:
                  EdgeInsets.symmetric(horizontal: 15, vertical: 15),
              hintText: 'title',
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(
                  color: Color(0xffc5c5c5),
                  width: 2.0,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(
                  color: custom_green,
                  width: 2.0,
                ),
              )),
        ),
      ),
    );
  }

  Padding subtitle_widgets() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
        ),
        child: TextField(
          maxLines: 3,
          controller: subtitle,
          focusNode: _focusNode2,
          style: TextStyle(fontSize: 18, color: Colors.black),
          decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
            hintText: 'subtitle',
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(
                color: Color(0xffc5c5c5),
                width: 2.0,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(
                color: custom_green,
                width: 2.0,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
