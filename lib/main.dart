import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:std_flutter_pdbook_handson/constants/app_state.dart';
import 'package:std_flutter_pdbook_handson/data_view_model.dart';
import 'package:std_flutter_pdbook_handson/generated/l10n.dart';
import 'package:std_flutter_pdbook_handson/screen/convert_result_screen.dart';
import 'package:std_flutter_pdbook_handson/screen/input_form_screen.dart';
import 'package:std_flutter_pdbook_handson/screen/loading_screen.dart';

void main() {
  runApp(
    const ProviderScope(
      child: FlutterHandson(),
    ),
  );
}

class FlutterHandson extends StatelessWidget {
  const FlutterHandson({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: const [
        GlobalCupertinoLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        S.delegate,
      ],
      themeMode: ThemeMode.system,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        useMaterial3: true,
      ),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appState = ref.watch(dataPorivder);

    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).appTitle),
      ),
      body: switch (appState) {
        Input() => const InputFormScreen(),
        Loading() => const LoadingScreen(),
        Converted(sentence: final sentence) =>
          ConvertResultScreen(sentence: sentence),
      },
    );
  }
}
