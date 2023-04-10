import 'package:flutter/material.dart';

class MessageFieldBox extends StatelessWidget {
  const MessageFieldBox({
    super.key,
    required this.onValue,
  });

  final ValueChanged<String> onValue;

  @override
  Widget build(BuildContext context) {
    final myMessageController = TextEditingController();
    final focusNode = FocusNode();

    final outlineInputBorder = UnderlineInputBorder(
      borderSide: const BorderSide(
        color: Colors.transparent,
      ),
      borderRadius: BorderRadius.circular(40),
    );

    final inputDecoration = InputDecoration(
      hintText: 'End your message with  a "?"',
      filled: true,
      enabledBorder: outlineInputBorder,
      focusedBorder: outlineInputBorder,
      suffixIcon: IconButton(
        onPressed: () {
          final message = myMessageController.value.text;
          myMessageController.clear();
          onValue(message);
        },
        icon: const Icon(Icons.send_outlined),
      ),
    );

    return TextFormField(
      onTapOutside: (_) => focusNode.unfocus(),
      controller: myMessageController,
      decoration: inputDecoration,
      focusNode: focusNode,
      onFieldSubmitted: (value) {
        myMessageController.clear();
        focusNode.requestFocus();
        onValue(value);
      },
    );
  }
}
