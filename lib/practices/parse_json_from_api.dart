import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';



class ParseJsonFromApi extends StatefulWidget {
  const ParseJsonFromApi({Key? key}) : super(key: key);

  @override
  State<ParseJsonFromApi> createState() => _ParseJsonFromApiState();
}

class _ParseJsonFromApiState extends State<ParseJsonFromApi> {
  List data = [];
  var s = "";

/*  Future<bool> _getPosts() async{
    var url = Uri.parse('https://jsonplaceholder.typicode.com/posts');
    var response= await http.get(url);

    setState(() {
      data = json.decode(response.body.toString());
    });
    return true;
  }*/

  Future<List<Data>?> getDataJson() async{
    Uri url = Uri.parse("https://jsonplaceholder.typicode.com/posts");
    var response= await http.get(url);

    setState(() {
     data = json.decode(response.body.toString());
      print(data);
    });

  }

  @override  //this inisState method is called when page start
  void initState() {
    super.initState();
    this.getDataJson();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("ListView"),),
      body:data.length==null?Container(height: 100,width: 100,color: Colors.amber,): ListView.builder(
        itemCount: data.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            leading: CircleAvatar(child: Text(data[index]["title"][0]),),
            title: Text(data[index]["title"]),
            subtitle: Text(data[index]["body"]),

            onTap: (){
              s = data[index]["title"];
             /* Route route = MaterialPageRoute(builder: (context)=> Page2(s));
              Navigator.push(context, route);*/
            },
          );

        },

      ),
    );
  }
}

class Data {
  late int userId;
  late int id;
  late String title;
  late String body;
  Data(this.userId,this.id,this.title,this.body);
}