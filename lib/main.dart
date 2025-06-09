import 'package:flutter/material.dart';

void main() {
  runApp(mainapp());
}

class mainapp extends StatefulWidget {
  @override
  State<mainapp> createState() => _mainappState();
}

class _mainappState extends State<mainapp> {
  String displayText = "No text data";
  List<String> tasklist = [];
  TextEditingController textcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("Todo List App"),
          backgroundColor: Colors.blue,
        ),
        body: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: Container(
                    padding: EdgeInsets.all(10),
                    child: TextField(
                      controller: textcontroller,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        label: Text("Enter the Task"),
                      ),
                    ),
                  ),
                ),

                MaterialButton(
                  child: Text("Add"),
                  color: Colors.white,
                  height: 50,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  onPressed: () {
                    setState(() {
                      tasklist.add(textcontroller.text);
                      textcontroller.clear();
                    });
                  },
                ),
              ],
            ),

            Flexible(
              child: ListView.builder(
                itemCount: tasklist.length,
                itemBuilder: (context, index) {
                    return Row(
                    children: [
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.all(10),
                          child: Text(tasklist[index]),
                        ),
                      ),
                      MaterialButton(
                        child: Icon(Icons.delete, color: Colors.red),

                        onPressed: () {
                          setState(() {
                            tasklist.removeAt(index);
                          });
                        },
                      ),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
 }