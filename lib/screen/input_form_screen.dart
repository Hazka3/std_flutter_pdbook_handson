import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:std_flutter_pdbook_handson/data_view_model.dart';
import 'package:std_flutter_pdbook_handson/generated/l10n.dart';

class InputFormScreen extends ConsumerStatefulWidget {
  const InputFormScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _InputFormScreenState();
}

class _InputFormScreenState extends ConsumerState<InputFormScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _textEditingController = TextEditingController();

  void _onConvertTap() async {
    final sentence = _textEditingController.text;
    final validate = _formKey.currentState!.validate();

    if (validate == false) return;

    ref.read(dataViewModelProvider.notifier).convert(sentence);
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    S.load(const Locale("ja"));

    return Form(
      key: _formKey,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
              ),
              child: TextFormField(
                controller: _textEditingController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return S.of(context).emptyErrorText;
                  }
                  return null;
                },
                decoration: InputDecoration(
                  hintText: S.of(context).hintTextOfTextField,
                ),
                maxLines: 5,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: _onConvertTap,
              child: Text(S.of(context).convertBtn),
            ),
          ],
        ),
      ),
    );
  }
}
