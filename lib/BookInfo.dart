import 'package:flutter/material.dart';

class BookInfo extends StatefulWidget {
  String book_name;
  String book_image;
  String book_desc;
  String book_author;
  BookInfo({super.key, required this.book_name, required this.book_image, required this.book_desc, required this.book_author});


  @override
  State<BookInfo> createState() => _BookInfoState();
}

class _BookInfoState extends State<BookInfo> {
  String howAuthor() {
    if(widget.book_author == ""){
      return widget.book_author = "не указан";
    }
    return widget.book_author;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Информация о книге"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(top: 60, left: 10, right: 10),
          child: Column(
            children:[
              Container(
                width: 140,
                child: Image.network(widget.book_image)
              ),
              SizedBox(height: 6,),
              Text(widget.book_name, style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold), textAlign: TextAlign.center,),
              SizedBox(height: 6,),
              Text.rich(
                TextSpan(text: "Автор:", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),children: [
                  TextSpan(text: " ${howAuthor()}",style: TextStyle(fontSize: 18, fontWeight: FontWeight.normal))
                ]),
              ),
              SizedBox(height: 12,),
              Text(widget.book_desc, style: TextStyle(fontSize: 18),),
              SizedBox(height: 60,),
            ],
          )
        )
      ),
    );
  }
}
