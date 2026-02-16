import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:Books/BookInfo.dart';

void main() {
  runApp(MaterialApp(home: const MainPage(), debugShowCheckedModeBanner: false,));
}

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final List<String> _books = [
    "Тень Великого Древа",
    "Как я попала замуж за светлого",
    "Забракованные",
    "Атомные привычки",
    "Маленький гриб."
  ];
  final List<double> _reatings = [4.7, 4.8, 4.3, 5.0, 4.6];
  final List<String> _images = [
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQgqmn-HnVBYe-50h7A0eisYFhno3755LRDXg&s",
    "https://s1.livelib.ru/boocover/1015544023/200x305/378b/Yuliya_Maslova__Kak_ya_popala_zamuzh_za_svetlogo.jpg",
    "https://www.litres.ru/pub/c/cover/73240468.jpg",
    "https://flibusta.su/b/img/big/1030.jpg",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQstk-zPIwHo4ysJROIW-ZVYN32qL3EsF9yfg&s"
  ];
  final List<String> _authors = [
    "Роман Суржиков",
    "Юлия Маслова",
    "Татьяна Солодкова",
    "Джеймс Клир",
    "Ишисы Чжоу",
  ];
  final List<String> _desc = [
    "Завершающая книга цикла Полари. Каждый получит свое: кто власть и бессмертие, кто кровавую жатву, кто свободу, кто месть. А сумрачная тень древней тайны все плотнее накрывает мир, и кому-то предстоит развеять ее. Любой ценой. Том 1 из 3.",
    "Споткнулась, упала, в другой мир пропала и теперь должна выйти замуж ради укрепления мира между империями. Какое платье, какой алтарь?! Я не некромантка, за которую вы меня принимаете! Или лучше сделать вид, что она? Отец невесты велит родить наследника и устранить мужа, темный император требует украсть разработки супруга, а светлый князь недобро на меня косится, принимая за злодейку. Похоже, придется им подыгрывать, пока не найду способ вернуться домой.",
    "В высшем обществе браки совершаются по расчету. Юной Амелии повезло: отец предложил ей выбрать из двух подходящих по статусу кандидатов. И, когда выбор встал между обходительным, улыбчивым Эйданом Бриверивзом, прекрасным, словно ангел, сошедший с древних гравюр, и мрачным Рэймером Монтегрейном, к тому же грубо обошедшимся с ней при первой встрече, девушка колебалась недолго.",
    "Вы не достигаете целей, потому что ставите не на ту лошадь. Успех – это не цель, которую надо достичь, не финишная черта, которую надо пересечь. Это система улучшений, бесконечный процесс изменения.",
    "2030 год. Землю накрыла великая катастрофа. Геомагнитное поле пропало, приборы вышли из строя, безжалостное Солнце приблизило всё сущее к гибели. Спустя десятилетия человечество сумело восстановить крохи жизни на планете, которая теперь изменилась до неузнаваемости. Люди соседствуют с коварной природой, а постоянная угроза заражения и мутации предопределила появление судей — тех, кто берёт на себя роль палачей и спасителей, не позволяющих опасным существам проникнуть за стены города. А где-то в Бездне, среди диковинных растений и жутких монстров, живёт маленький гриб, наделённый сознанием. Ему неведомы человеческие беды и горести. Вот только однажды его спору похитили, и теперь, чтобы отыскать её, грибочек должен попасть на базу людей и притвориться одним из них...",
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
                    Navigator.push(context, MaterialPageRoute(builder: (context) => BookInfo(book_name: _books[index], book_image: _images[index],book_desc: _desc[index], book_author: _authors[index])));
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

