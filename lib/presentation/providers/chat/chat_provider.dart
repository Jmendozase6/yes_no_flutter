import 'package:flutter/material.dart';
import 'package:yes_no_app/config/helpers/get_yes_no_answer.dart';
import 'package:yes_no_app/domain/entities/message.dart';

class ChatProvider extends ChangeNotifier {
  final List<Message> _messageList = [
    Message(text: 'Start your conversation', fromWho: FromWho.me),
  ];
  final _chatScrollController = ScrollController();
  final GetYesNoAnswer _getYesNoAnswer = GetYesNoAnswer();

  /// Returns the message list
  List<Message> get messageList => _messageList;

  /// Returns the scrollController
  ScrollController get chatScrollController => _chatScrollController;

  /// This method is called when the user sends a message
  /// the [Message] is validated and added to the list
  Future<void> sendMessage(String message) async {
    /// If the message is empty, we don't want to send it
    if (message.isEmpty) return;

    /// We create a new message and add it to the list
    final newMessage = Message(text: message, fromWho: FromWho.me);

    /// Add the answer to list
    _messageList.add(newMessage);
    notifyListeners();

    /// Check if the message ends with a question mark [?]
    if (message.endsWith('?')) await herReply();

    /// We scroll to end
    moveScrollToBottom();
  }

  /// This method is called for receiving a message from the bot
  Future<void> herReply() async {
    /// We get the answer from the API
    final herMessage = await _getYesNoAnswer.getAnswer();

    /// Add the answer to list
    _messageList.add(herMessage);
    notifyListeners();

    /// We scroll to end
    moveScrollToBottom();
  }

  /// This method scroll to the end of the message list
  void moveScrollToBottom() async {
    /// We wait a little bit to let the list rebuild
    await Future.delayed(const Duration(milliseconds: 100));

    /// We move the scroll to the bottom
    chatScrollController.animateTo(
      chatScrollController.position.maxScrollExtent,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeOut,
    );
  }
}
