import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:yes_no_app/domain/entities/message.dart';
import 'package:yes_no_app/presentation/widgets/chat/text_message.dart';

class HerMessageBubble extends StatelessWidget {
  const HerMessageBubble({
    super.key,
    required this.message,
  });

  final Message message;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextMessage(color: colors.secondary, text: message.text, margin: 10),
        _ImageBubble(imageUrl: message.imageUrl!),
        const SizedBox(height: 5)
      ],
    );
  }
}

class _ImageBubble extends StatelessWidget {
  const _ImageBubble({required this.imageUrl});

  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Image.network(
        imageUrl,
        width: size.width * 0.7,
        height: 200,
        fit: BoxFit.cover,
        loadingBuilder: (context, child, loadingProgress) {
          if (loadingProgress == null) return child;
          return Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            width: size.width * 0.7,
            height: 200,
            child: const CupertinoActivityIndicator(),
          );
        },
        errorBuilder: (context, error, stackTrace) => Center(
          child: Image.asset('assets/images/404.png'),
        ),
      ),
    );
  }
}
