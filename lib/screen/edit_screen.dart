import 'package:flutter/material.dart';
import 'package:todo_app/const/colors.dart';
import 'package:todo_app/data/fire_store.dart';
import 'package:todo_app/model/notes_model.dart';

class Edit_Screen extends StatefulWidget {
  Note _note;
  Edit_Screen(this._note, {super.key});

  @override
  State<Edit_Screen> createState() => _Edit_ScreenState();
}

class _Edit_ScreenState extends State<Edit_Screen> {
  TextEditingController? title;
  TextEditingController? subtitle;

  FocusNode _focusNode1 = FocusNode();
  FocusNode _focusNode2 = FocusNode();

  int index = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    title = TextEditingController(text: widget._note.title);
    subtitle = TextEditingController(text: widget._note.subtitle);
  }

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
              FireStore_Datasource().Update_Note(
                  widget._note.id, index, title!.text, subtitle!.text);
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
          return GestureDetector(
            onDoubleTap: () {
              index = index;
            },
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                      width: 2,
                      color: index == index ? custom_green : Colors.grey)),
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
