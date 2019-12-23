import 'package:flutter/material.dart';

void main(){
  runApp(App());
}
class App extends StatelessWidget{
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      home: Home(),
    );
  }
}

class Home extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return HomeState();
  }

}
class HomeState extends State<Home>{
  List <String> todos;
  TextEditingController toDoFieldContrl;
  @override
  void initState(){
    super.initState();
    todos = [];
    toDoFieldContrl = TextEditingController();
  }
  Widget build(BuildContext context) {

    return Scaffold(
  appBar: AppBar( title: Text("hello world ${todos.length}"),),
      body: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Expanded(
                child: TextField(
                  controller:toDoFieldContrl,
                ),
              ),
              RaisedButton(
                child: Text("Add"),
                onPressed: (){
                String toDoText = toDoFieldContrl.text;
toDoFieldContrl.clear();
                setState(() {
                  todos.add(toDoText);
                });
                },
              )
            ],
          ),
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.only(top: 10),
              itemCount: todos.length,
              itemBuilder: (ctx,indx){
                return toDoscreen(todos[indx]);
              },
            ),
          )
        ],
      ),
    );

  }
Widget toDoscreen(String toDoText){

  return Container(
    margin: EdgeInsets.only(left: 10, right: 10,bottom: 5),
    decoration: BoxDecoration(
      boxShadow: [
        BoxShadow(),
      ],
      color: Colors.white,
    ),
    child: Text(toDoText),
    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
  );
  }
}
