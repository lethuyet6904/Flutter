import 'package:flutter/material.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MyBody(),
    );
  }

  Widget MyBody(){
    return Column(
      children: [
        Block1(),
        Block2(),
        Block3(),
        Block4()
      ],
    );
  }
  Widget Block1(){
    var src = "https://images.unsplash.com/photo-1506744038136-46273834b3fb";
    return Image.network(src);
  }

  Widget Block2(){
    var namePlace = "Oeschinen Lake Campground";
    var addressPlace = "Kandersteg, Switzerland";
    var votePlace = "41";
    return Padding(
      padding: const EdgeInsets.all(30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(namePlace, style: TextStyle(fontWeight: FontWeight.bold),), 
              Text(addressPlace, style: TextStyle(color: Colors.grey))
            ]),
          Row(
            children: [
              Icon(Icons.star, color: Colors.red,), 
              Text(votePlace)])
            ],
      ),
    );
  }

  Widget Block3(){
   var color = Colors.blue;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Column(children: [
          Icon(Icons.call, color: color), 
          Text("CALL", style: TextStyle(color: color))]),
        Column(children: [
          Icon(Icons.route, color: color), 
          Text("ROUTE", style: TextStyle(color: color))]),
        Column(children: [
          Icon(Icons.share, color: color), 
          Text("SHARE", style: TextStyle(color: color))],)
      ],
    );
  }

  Widget Block4(){
    var data = "";
    return Padding(
      padding: const EdgeInsets.only(right: 30, left: 30),
      child: Text(data),
    );
  }
}