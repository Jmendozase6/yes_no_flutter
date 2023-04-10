import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yes_no_app/domain/entities/message.dart';
import 'package:yes_no_app/presentation/providers/chat/chat_provider.dart';
import 'package:yes_no_app/presentation/providers/theme/theme_provider.dart';
import 'package:yes_no_app/presentation/widgets/chat/her_message_bubble.dart';
import 'package:yes_no_app/presentation/widgets/chat/my_message_bubble.dart';
import 'package:yes_no_app/presentation/widgets/shared/message_field_box.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = context.watch<ThemeProvider>();

    return Scaffold(
      appBar: AppBar(
        leading: const Padding(
          padding: EdgeInsets.only(left: 15),
          child: CircleAvatar(
            backgroundImage: NetworkImage(
                'https://styles.redditmedia.com/t5_21p263/styles/communityIcon_2okd26ie6ak81.png'),
          ),
        ),
        actions: [
          IconButton(
            icon: themeProvider.getIconByTheme(),
            onPressed: themeProvider.updateBrightness,
          ),
          IconButton(
            icon: const Icon(Icons.change_circle),
            onPressed: themeProvider.updateColor,
          ),
        ],
        title: const Text('Botsito'),
      ),
      body: const _ChatView(),
    );
  }
}

class _ChatView extends StatelessWidget {
  const _ChatView();

  @override
  Widget build(BuildContext context) {
    final chatProvider = context.watch<ChatProvider>();

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                controller: chatProvider.chatScrollController,
                itemCount: chatProvider.messageList.length,
                itemBuilder: (context, index) {
                  final message = chatProvider.messageList[index];
                  return message.fromWho == FromWho.me
                      ? MyMessageBubble(message: message)
                      : HerMessageBubble(message: message);
                },
              ),
            ),

            // Field box to write the message
            MessageFieldBox(
              onValue: chatProvider.sendMessage,
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
