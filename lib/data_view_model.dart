import 'dart:convert';

import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:std_flutter_pdbook_handson/constants/app_state.dart';
import 'package:http/http.dart' as http;
import 'package:std_flutter_pdbook_handson/data_model.dart';

part 'data_view_model.g.dart';

@riverpod
class DataViewModel extends _$DataViewModel {
  @override
  AppState build() {
    return const Input();
  }

  void reset() {
    state = const Input();
  }

  Future<void> convert(String sentence) async {
    state = const Loading();

    final url = Uri.parse("https://labs.goo.ne.jp/api/hiragana");
    final headers = {"Content-type": "application/json"};

    final request = Request(
      appId: 'be35a9bf7c379cdf5ccd70941baa551a44a4f7e223c2eb1d466676f44256e1ae',
      sentence: sentence,
    );

    final response = await http.post(
      url,
      headers: headers,
      body: jsonEncode(
        request.toJson(),
      ),
    );

    final result = Response.fromJson(
      jsonDecode(response.body),
    );

    state = Converted(sentence: result.converted);
  }
}


// class DataViewModel extends Notifier<AppState> {
//   @override
//   AppState build() {
//     return const Input();
//   }

//   void reset() {
//     state = const Input();
//   }

//   Future<void> convert(String sentence) async {
//     state = const Loading();
//     final url = Uri.parse("https://labs.goo.ne.jp/api/hiragana");
//     final headers = {"Content-type": "application/json"};

//     final request = Request(
//       appId: 'be35a9bf7c379cdf5ccd70941baa551a44a4f7e223c2eb1d466676f44256e1ae',
//       sentence: sentence,
//     );

//     final response = await http.post(
//       url,
//       headers: headers,
//       body: jsonEncode(
//         request.toJson(),
//       ),
//     );

//     final result = Response.fromJson(
//       jsonDecode(response.body),
//     );
//     state = Converted(sentence: result.converted);
//   }
// }

// final dataPorivder = NotifierProvider<DataViewModel, AppState>(
//   () => DataViewModel(),
// );
