import 'package:flutter/material.dart';
import 'package:namer_app/Class/TextNote.dart';
import 'package:namer_app/Values/app_color.dart';
import 'package:namer_app/Values/app_font.dart';

class ItemClass extends StatefulWidget {

  final TextNote? note;

  const ItemClass({super.key, this.note});
  @override
  State<ItemClass> createState() => _ItemState();
}

class _ItemState extends State<ItemClass> {

  TextEditingController texteditController = TextEditingController();

  @override
  void initState() {
    if (widget.note != null) {
    texteditController = TextEditingController(text: widget.note!.content);

    super.initState();
    }
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: MyAppColor.backgroundColor,

      appBar: AppBar(
        
        leading: IconButton(
          onPressed: () {
    
              Navigator.pop(context);
  
          },
          icon: const Icon(Icons.arrow_back),
        ),

        title: const Text("Editor App"),
        titleTextStyle: MyFont.h3.copyWith(
          color: Colors.black,
        ),

        actions: [
        IconButton(
          onPressed: () {
            if (texteditController.text != "") {
              Navigator.pop(context, texteditController.text);
             
            } else {
               _showDialog();
            }
          }
        , icon: Icon(Icons.save),
        )
      ],

        backgroundColor: MyAppColor.appBarColor,
      ),

      body: Column(
       children: [
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: TextField(
            maxLines: null,
            controller: texteditController,
            decoration: InputDecoration(
              hintText: "Enter this text",
              border: InputBorder.none,
              labelStyle: MyFont.h4.copyWith(
                color: Colors.black,
              ),
            ),
          ),
        ),
       ],
      ),

        
    );
  }

  Future<void> _showDialog() async {
    return showDialog(
      context: context, 
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("No infomation"),
          content: const SingleChildScrollView(
            child: ListBody(
              children: [
                Text("Please enter this word"),
                Text("Word don't empty"),
              ],
            ),
          ),

          actions: <Widget> [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              }
            , child: const Text("Ok"))
          ],
        );
      }
      );
  }

}

