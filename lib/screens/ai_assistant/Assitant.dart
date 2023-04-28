import 'package:dialog_flowtter/dialog_flowtter.dart';
import 'package:diet_counselling/screens/ai_assistant/Messages.dart';
// import 'package:diet_counselling/screens/ai_assistant/privates.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class Assitant extends StatefulWidget {
  const Assitant({super.key, required this.title});
  final String title;

  @override
  State<Assitant> createState() => _AssitantState();
}

class _AssitantState extends State<Assitant> {
  late DialogFlowtter dialogFlowtter;
  final TextEditingController _controller = TextEditingController();
  List<Map<String, dynamic>> messages = [];
  // Private _private = Private();
  int _selectedIndex = 0;

  @override
  void initState() {
    // DialogFlowtter jsonAuthInstance = DialogFlowtter.fromJson(_private.apiKey);
    // dialogFlowtter = jsonAuthInstance;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title, style: GoogleFonts.openSans()),
        centerTitle: true,
        backgroundColor: Colors.purple[600],
        foregroundColor: Colors.white,
      ),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.only(top: 15, bottom: 10),
            child: Column(children: [
              Text(
                "Today",
                style: GoogleFonts.openSans(
                    fontSize: 15, color: Colors.blueGrey[900]),
              ),
              Text(" ${DateFormat("Hm").format(DateTime.now())} am",
                  style: GoogleFonts.openSans(
                      fontSize: 15, color: Colors.blueGrey[900])),
            ]),
          ),
          Expanded(child: MessagesScreen(messages: messages)),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
            color: Colors.white,
            child: Row(
              children: [
                Expanded(
                    child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Enter message',
                    labelStyle: GoogleFonts.openSans(fontSize: 18),
                  ),
                  controller: _controller,
                  style: GoogleFonts.openSans(
                      color: Colors.blueGrey[900], fontSize: 17),
                )),
                IconButton(
                    onPressed: () {
                      sendMessage(_controller.text);
                      _controller.clear();
                    },
                    icon: Icon(
                      Icons.send,
                      color: Colors.blueGrey[800],
                    ))
              ],
            ),
          )
        ],
      ),
    );
  }

  sendMessage(String text) async {
    try {
      if (text.isEmpty) {
      } else {
        setState(() {
          addMessage(Message(text: DialogText(text: [text])), true);
        });

        DetectIntentResponse response = await dialogFlowtter.detectIntent(
            queryInput: QueryInput(text: TextInput(text: text)));
        if (response.message == null) {
          return;
        } else {
          setState(() {
            addMessage(response.message!);
          });
        }
      }
    } catch (e) {
      Get.snackbar('Error', e.toString());
    }
  }

  addMessage(Message message, [bool isUserMessage = false]) {
    messages.add({'message': message, 'isUserMessage': isUserMessage});
  }
}
