import 'package:flutter/material.dart';
import 'package:flutter_chatting2/Chat_Massage.dart';
import 'package:logger/logger.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  TextEditingController _textEditingController = TextEditingController();

  List<ChatMessage>_chats = [],

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chat App'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(child: ListView.builder(itemBuilder: (context, index){
            return _chats[index];
          }, itemCount: _chats.length,)),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _textEditingController,
                    decoration: InputDecoration(hintText: "메세지 입력창"),
                    onSubmitted: _handleSubmitted
                  ),
                ),
                SizedBox(
                  width: 8.0,
                ),
                FlatButton(onPressed: (){
                  _handleSubmitted(_textEditingController.text);
                },
                  child: Text("Send"),
                  color: Colors.amberAccent,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _handleSubmitted(String text){
    Logger().d(Text);

    ChatMessage newChat = ChatMessage(text);
    _chats.add(newChat);
    _textEditingController.clear();
  }
}
