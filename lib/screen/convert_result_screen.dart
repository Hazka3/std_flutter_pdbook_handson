import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:std_flutter_pdbook_handson/data_view_model.dart';
import 'package:std_flutter_pdbook_handson/generated/l10n.dart';

class ConvertResultScreen extends ConsumerWidget {
  final String sentence;

  const ConvertResultScreen({
    super.key,
    required this.sentence,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    void onResetTap() {
      ref.read(dataPorivder.notifier).reset();
    }

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
            ),
            child: Text(sentence),
          ),
          const SizedBox(
            height: 20,
          ),
          ElevatedButton(
            onPressed: onResetTap,
            child: Text(S.of(context).resetBtn),
          ),
        ],
      ),
    );
  }
}
