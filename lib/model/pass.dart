import 'package:meta/meta.dart';

class Pass {
  final int id;
  final String title;
  final String description;
  final String data;

  Pass(
      {@required this.id,
      @required this.title,
      @required this.description,
      @required this.data});

  Pass copyWith({int id, String title, String description, String data}) {
    return Pass(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      data: data ?? this.data,
    );
  }
}
