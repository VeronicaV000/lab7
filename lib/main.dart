import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class MyBody extends StatefulWidget {
  @override
  createState() => new MyBodyState();
}

Future<String> str(int i) async {
  var url = Uri.parse("http://numbersapi.com/${i}/math");
  final response = await http.get(url);
  print(response.body);
  return response.body;
}

Image image(int i){
  if(i > 0 && i < 100 || i > 103 && i < 200 || i == 205 || i > 207 && i < 300 || i == 306 || i > 308 && i < 400 || i > 400 && i < 418 || i == 419 || i > 420 && i < 429 || i == 430 || i > 431 && i < 444 || i > 444 && i < 450 || i > 451 && i < 497 || i == 405 || i == 505 || i > 511 && i < 521 || i == 524 || i > 525 && i < 599 || i > 599){
    return Image.asset("images/404.jpg");
  }
  return Image.asset("images/${i}.jpg");
}

class MyBodyState extends State<MyBody> {
  @override
  Widget build(BuildContext context) {
    return new ListView.builder(itemBuilder: (context, i){
      return new ListTile(title: Row(children: [Expanded(child: image(i)), Expanded(child: FutureBuilder<String>(future: str(i), builder: (BuildContext context, AsyncSnapshot<String> snapshot) {final theText = snapshot.data;if (snapshot.hasData) {return Text(theText ?? "");}return Text(theText ?? "");}))]));
    });
  }
}

void main() =>  runApp(
    new MaterialApp(
        debugShowCheckedModeBanner: false,
        home: new Scaffold(body: new Center(child: new MyBody(),))
    )
);