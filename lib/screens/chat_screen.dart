import 'package:flutter/material.dart';
import 'package:whatsapp_clone/apis/chats.dart';
import 'package:whatsapp_clone/models/chat_user.dart';
import 'package:whatsapp_clone/apis/https1.dart';
import 'package:whatsapp_clone/models/message_item.dart';
import 'package:whatsapp_clone/screens/chat_message_screen.dart';
import 'package:whatsapp_clone/screens/optimize_this.dart';

class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  List<ChatUser> chatUsers = [
    ChatUser('Shreyash',
        userProfileURL:
            'https://cdn3.vectorstock.com/i/1000x1000/30/97/flat-business-man-user-profile-avatar-icon-vector-4333097.jpg',
        lastMessageTime: DateTime(2021, 2, 26, 14, 34),
        noOfUnreadMessages: 3,
        messages: [
          MessageItem(
            'Hey, how are you',
            DateTime(2021, 2, 26, 14, 34, 40),
          ),
          MessageItem(
            'Hey, ',
            DateTime(2021, 2, 26, 14, 34, 40),
          ),
          MessageItem(
            'Hey, how  you',
            DateTime(2021, 2, 26, 14, 34, 40),
          ),
          MessageItem(
            'Hey, are you',
            DateTime(2021, 2, 26, 14, 34, 40),
          ),
          MessageItem(
            'Hey, how are you',
            DateTime(2021, 2, 26, 14, 34, 40),
          ),
          MessageItem(
            'Hey, how are you',
            DateTime(2021, 2, 26, 14, 34, 40),
          ),
          MessageItem(
            'Hey, how are you',
            DateTime(2021, 2, 26, 14, 34, 40),
          ),
        ]),
    ChatUser(
      'José',
      userProfileURL:
          'https://cdn3.vectorstock.com/i/1000x1000/30/97/flat-business-man-user-profile-avatar-icon-vector-4333097.jpg',
      lastMessageTime: DateTime(2021, 2, 26, 14, 34),
      noOfUnreadMessages: 3,
    ),
    ChatUser('Pedro',
        userProfileURL:
            'https://cdn2.vectorstock.com/i/1000x1000/41/11/flat-business-woman-user-profile-avatar-icon-vector-4334111.jpg',
        lastMessageTime: DateTime(2021, 2, 26, 14, 10),
        noOfUnreadMessages: 10),
    ChatUser(
      'João',
      userProfileURL:
          'https://cdn3.vectorstock.com/i/1000x1000/30/97/flat-business-man-user-profile-avatar-icon-vector-4333097.jpg',
      lastMessageTime: DateTime(2021, 2, 26, 14, 34),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.green[800],
          title: Text('WhatsUP'),
          actions: [
            IconButton(
                icon: Icon(Icons.search),
                onPressed: () {
                  print('search clicked');
                }),
            IconButton(
                icon: Icon(Icons.settings),
                onPressed: () {
                  print('setting clicked');
                })
          ],
          bottom: TabBar(
            tabs: [
              Tab(
                icon: Icon(Icons.chat),
                // text: 'Chat',
              ),
              Tab(
                icon: Icon(Icons.account_circle),
                // text: 'Status',
              ),
              Tab(
                icon: Icon(Icons.call),
                // text: 'Calls',
              ),
            ],
            onTap: (index) {
              if (index == 2) {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => OptimizeThis()));
              } else if (index == 1) {
                ChatsApi().getChats().then(
                  (value) {
                    print(value);
                  },
                );
              }
            },
          ),
        ),
        body: TabBarView(
          children: [
            ListView.builder(
              itemBuilder: (context, index) {
                ChatUser user = chatUsers[index];

                return ListTile(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return ChatMessageScreen(user);
                        },
                      ),
                    );
                  },
                  leading: CircleAvatar(
                    child: Image.network(user.userProfileURL),
                  ),
                  title: Text(user.name),
                  subtitle: Text('Oie, tudo bem ai?'),
                  trailing: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        user.timeInString(),
                        style: TextStyle(
                            color: Colors.green, fontWeight: FontWeight.bold),
                      ),
                      CircleAvatar(
                        child: Text(
                          '${user.noOfUnreadMessages}',
                          style: TextStyle(fontSize: 10),
                        ),
                        backgroundColor: Colors.green,
                        maxRadius: 8,
                      )
                    ],
                  ),
                );
              },
              itemCount: chatUsers.length,
            ),
            Center(
              child: Icon(Icons.account_circle),
            ),
            Center(
              child: Icon(Icons.call),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(
            Icons.chat_bubble,
            color: Colors.green[800],
          ),
          onPressed: () {
            //body
          },
        ),
      ),
    );
  }
}
