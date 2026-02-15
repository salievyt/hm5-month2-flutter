import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:hm5month2/BookInfo.dart';

void main() {
  runApp(MaterialApp(home: const MainPage(), debugShowCheckedModeBanner: false,));
}

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final List<String> _books = ["Тень Великого Древа", "Как я попала замуж за светлого", "Забракованные", "Атомные привычки", "Маленький гриб."];
  final List<double> _reatings = [4.7, 4.8, 4.3, 5.0, 4.6];
  final List<String> _images = [
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQgqmn-HnVBYe-50h7A0eisYFhno3755LRDXg&s",
    "https://s1.livelib.ru/boocover/1015544023/200x305/378b/Yuliya_Maslova__Kak_ya_popala_zamuzh_za_svetlogo.jpg",
    "https://www.litres.ru/pub/c/cover/73240468.jpg",
    "https://flibusta.su/b/img/big/1030.jpg",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQstk-zPIwHo4ysJROIW-ZVYN32qL3EsF9yfg&s"
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
          Expanded(child:
            ListView.separated(
              itemCount: _books.length,
              separatorBuilder: (context,index) => Divider(),
              itemBuilder: (context,index){
                return ListTile(
                  title: Text(_books[index]),
                  subtitle: Text("Рейтинг: ${_reatings[index]}"),
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(_images[index]),
                  ),
                  trailing: Icon(Icons.navigate_next),
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => BookInfo(book_name: _books[index], book_image: _images[index],)));
                  },
                );
              }
            )
          ),
          ],
        ),
      ),
    );
  }
}

