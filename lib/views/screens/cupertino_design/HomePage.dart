import 'package:converter_ios_and/controllers/providers/app_provider.dart';
import 'package:converter_ios_and/views/components/AddChat.dart';
import 'package:converter_ios_and/views/components/CallsPage.dart';
import 'package:converter_ios_and/views/components/ChatPage.dart';
import 'package:converter_ios_and/views/components/SettingsPage.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.person_add),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.chat_bubble_2),
            label: "CHATS",
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.phone),
            label: "CALLS",
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.settings),
            label: "SETTINGS",
          ),
        ],
      ),
      tabBuilder: (context, i) {
        return CupertinoTabView(
          builder: (context) {
            return CupertinoPageScaffold(
              navigationBar: CupertinoNavigationBar(
                middle: const Text("Platform Converter",
                style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                trailing: CupertinoSwitch(
                  value: Provider.of<AppProvider>(context).appModel.switchValue,
                  onChanged: (val) {
                    Provider.of<AppProvider>(context, listen: false).switchUi();
                  },
                ),
              ),
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 80,
                    ),
                    IndexedStack(
                      index: i,
                      children: const [
                        AddChat(),
                        ChatPage(),
                        CallsPage(),
                        SettingsPage(),
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }
}
