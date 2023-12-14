
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:namer_app/Pages/itemclass.dart';
import 'package:namer_app/Class/TextNote.dart';
import 'package:namer_app/Values/app_color.dart';
import 'package:namer_app/Values/app_font.dart';

class MainApp extends StatelessWidget {

  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ListItemsHome(),
    );
  }

}

class ListItemsHome extends StatefulWidget {

  @override
  State<ListItemsHome> createState() => _ListItemsHomeState();
}


class _ListItemsHomeState extends State<ListItemsHome> {

  @override
  Widget build(BuildContext context) {
   
    return Scaffold(
      backgroundColor: MyAppColor.backgroundColor,
      
      appBar: AppBar(
        title: const Text("Editor App"),
        titleTextStyle: MyFont.h3.copyWith(
          color: Colors.black,
        ),
        backgroundColor: MyAppColor.appBarColor,
      ),

      body: Column(
        children: [
          const Padding(padding: EdgeInsets.all(8)),
          Expanded(
            child: ListView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            itemCount: textNote.length,
            itemBuilder: (context, index){
              return Card(
                margin: const EdgeInsets.all(8),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)
                ),
                child: ListTile(

                  onTap: () async {
                   final result = await Navigator.push(context, 
                    MaterialPageRoute(builder: (context) => ItemClass(note: textNote[index]))
                    );

                    if (result != null) {
                      setState(() {
                        textNote[index].content = result;
                      });
                    }

                  },

                  title: RichText(
                    maxLines: 3,
                    text: TextSpan(
                      text: textNote[index].content,
                      style: MyFont.h4.copyWith(
                        color: Colors.black
                      )
                    ) ,

                  ),
                  
                  trailing: 
                  IconButton(
                    onPressed: () {
                      setState(() {
                        textNote.removeAt(index);
                      });
                    },
                    icon: const Icon(Icons.delete),
                  ),
                ),
            
              );
            },
          )
          ),
        ],
      

      
      ),

      floatingActionButton: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ElevatedButton.icon(
          onPressed: () async {
            final result = await Navigator.push(context, 
              MaterialPageRoute
              (builder: (context) => const ItemClass()),
            );

           if (result != null) {
            setState(() {
              textNote.add(TextNote(content: result));
            });
           }
           
          }
          , icon: const Icon(Icons.add), 
          label: const Text("Add"),
          ),
      ),

    );
  }
}

void main() {
  
  runApp(
     const MainApp()
  );

}