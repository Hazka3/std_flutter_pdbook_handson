sealed class AppState {
  const AppState();
}

class Input extends AppState {
  const Input();
}

class Loading extends AppState {
  const Loading();
}

class Converted extends AppState {
  final String sentence;

  const Converted({
    required this.sentence,
  });
}
