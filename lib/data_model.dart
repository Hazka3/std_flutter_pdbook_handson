import 'package:json_annotation/json_annotation.dart';

part 'data_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class Request {
  final String appId;
  final String sentence;
  final String outputType;

  const Request({
    required this.appId,
    required this.sentence,
    this.outputType = "hiragana",
  });

  Map<String, dynamic> toJson() => _$RequestToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class Response {
  final String converted;

  const Response({required this.converted});

  factory Response.fromJson(Map<String, dynamic> json) =>
      _$ResponseFromJson(json);
}
