import 'package:flutter/material.dart';
import 'package:mobile/core/theme/palette.dart';
import 'package:mobile/modules/home/widgets/header_home.widget.dart';
import 'package:mobile/modules/home/widgets/list_conversation.widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(
          left: 20,
          right: 20,
          top: MediaQuery.of(context).padding.top + 10,
        ),
        child: Column(
          children: const [
            HeaderHome(),
            SizedBox(
              height: 20,
            ),
            Expanded(child: ListConversation())
          ],
        ),
      ),
      backgroundColor: Palette.white200,
    );
  }
}
