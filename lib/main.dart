import 'dart:io';

import 'package:flutter/material.dart';

void main()
{
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home()
    ),
  );
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  bool lang1 = true;
  bool lang2 = true;
  bool lang3 = true;
  String selected = "";
  String data = "Surat";

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => back(),
      child: SafeArea(
        child: Scaffold(
          body: Column(
            children: [
              Text("Languages",style: TextStyle(color: Colors.indigo,fontSize: 20,fontWeight: FontWeight.bold),),
              Center(
                child: CheckboxListTile(
                  value: lang1,
                  title: Text("Gujarati"),
                  activeColor: Colors.indigo,
                  onChanged: (value) {
                    setState(() {
                      lang1 = value!;
                    });
                  },
                ),
              ),
              Center(
                child: CheckboxListTile(
                  value: lang2,
                  title: Text("English"),
                  activeColor: Colors.indigo,
                  onChanged: (value) {
                    setState(() {
                      lang2 = value!;
                    });
                  },
                ),
              ),
              Center(
                child: CheckboxListTile(
                  value: lang3,
                  title: Text("Hindi"),
                  activeColor: Colors.indigo,
                  onChanged: (value) {
                    setState(() {
                      lang3 = value!;
                    });
                  },
                ),
              ),
              RadioListTile(
                  value: "Android",
                  title: Text("Android"),
                  groupValue: selected,
                  onChanged: (value) {
                    setState(() {
                      selected = value!;
                    });
                  },
                ),
              RadioListTile(
                value: "IOS",
                title: Text("IOS"),
                groupValue: selected,
                onChanged: (value) {
                  setState(() {
                    selected = value!;
                  });
                },
              ),
              RadioListTile(
                value: "Web",
                title: Text("Web"),
                groupValue: selected,
                onChanged: (value) {
                  setState(() {
                    selected = value!;
                  });
                },
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Expanded(
                      child: DropdownButton(
                          items: [
                            DropdownMenuItem(child: Text("Surat"),value: "Surat",),
                            DropdownMenuItem(child: Text("Vapi"),value: "Vapi",),
                          ],
                          onChanged: (value) {
                            setState(() {
                              data = value!;
                            });
                          },
                        value: data,
                      ),
                    ),
                  ],
                ),
              ),
             ElevatedButton(onPressed: () {
              Exitdialog();
              }, child: Text("Submit"))
            ],
          ),
        ),
      ),
    );
  }

  void Exitdialog()
  {
     showDialog(
       barrierDismissible: false,
       context: context,
       builder: (context) {
         return  AlertDialog(
           content: SizedBox(
             height: 80,
             child: Column(
               children: [
                 Text("Are you sure you want to exit?"),
                 SizedBox(height: 20,),
                 Row(
                   mainAxisAlignment: MainAxisAlignment.center,
                   children: [
                     ElevatedButton(onPressed: () {
                       exit(0);
                     }, child: Text("Yes")),
                     SizedBox(width: 10,),
                     ElevatedButton(onPressed: () {
                       Navigator.pop(context);
                     }, child: Text("No"))
                   ],
                 ),
               ],
             ),
           ),
         );
       },
     );
  }

  Future<bool> back() async{

    Exitdialog();
    return await false;
  }

}
