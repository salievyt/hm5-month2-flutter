import 'package:flutter/material.dart';

class BookInfo extends StatefulWidget {
  String book_name;
  String book_image;
  BookInfo({super.key, required this.book_name, required this.book_image});


  @override
  State<BookInfo> createState() => _BookInfoState();
}

class _BookInfoState extends State<BookInfo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          margin: EdgeInsets.only(top: 60),
          child: Column(
            children:[
              Row(
                children: [
                  IconButton(
                    onPressed: (){
                      Navigator.pop(context);
                    },
                    icon: Icon(Icons.arrow_back_ios_new),
                  ),
                ],
              ),
              Container(
                width: 240,
                child: Image.network(widget.book_image)
              ),
              Text(widget.book_name, style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),),
            ],
          )
        )
      ),
    );
  }
}
