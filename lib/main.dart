import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yes_no_app/presentation/providers/theme/theme_provider.dart';

import 'config/theme/app_theme.dart';
import 'presentation/providers/providers.dart';
import 'presentation/screens/chat/chat_screen.dart';

void main() {
  runApp(
    /// We use MultiProvider to provide all the providers
    MultiProvider(
      providers: providers,
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = context.watch<ThemeProvider>();

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Yes No App',
      theme: AppTheme(
        selectedColor: themeProvider.selectedColor,
        brightness: themeProvider.brightness,
      ).theme(),
      home: const ChatScreen(),
    );
  }
}
