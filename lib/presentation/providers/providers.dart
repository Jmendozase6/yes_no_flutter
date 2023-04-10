import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:yes_no_app/presentation/providers/chat/chat_provider.dart';
import 'package:yes_no_app/presentation/providers/theme/theme_provider.dart';

List<SingleChildWidget> providers = [
  /// Chat Provider
  ChangeNotifierProvider(create: (_) => ChatProvider()),

  /// Chat Provider
  ChangeNotifierProvider(create: (_) => ThemeProvider()),
];
