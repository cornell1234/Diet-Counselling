import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'message_scroll_controller.dart';

class MessagesScreen extends StatefulWidget {
  const MessagesScreen({Key? key, required this.messages}) : super(key: key);
  final List messages;

  @override
  State<MessagesScreen> createState() => _MessagesScreenState();
}

class _MessagesScreenState extends State<MessagesScreen> {
  final MessageScrollController _messageScrollController =
      Get.put(MessageScrollController());
  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    return ListView.separated(
      itemBuilder: ((context, index) {
        return SingleChildScrollView(
          controller: _messageScrollController.controller,
          child: Container(
            margin: const EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: widget.messages[index]['isUserMessage']
                  ? MainAxisAlignment.end
                  : MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        bottomLeft: const Radius.circular(20),
                        topRight: const Radius.circular(20),
                        bottomRight: Radius.circular(
                            widget.messages[index]['isUserMessage'] ? 0 : 20),
                        topLeft: Radius.circular(
                            widget.messages[index]['isUserMessage'] ? 20 : 0)),
                    color: widget.messages[index]['isUserMessage']
                        ? Colors.purple[400]
                        : Colors.blueGrey[700],
                  ),
                  constraints: BoxConstraints(maxWidth: w * 2 / 3),
                  child: Text(
                    widget.messages[index]['message'].text.text[0],
                    style:
                        GoogleFonts.openSans(fontSize: 17, color: Colors.white),
                  ),
                )
              ],
            ),
          ),
        );
      }),
      separatorBuilder: (_, i) =>
          const Padding(padding: EdgeInsets.only(top: 10)),
      itemCount: widget.messages.length,
    );
  }
}
