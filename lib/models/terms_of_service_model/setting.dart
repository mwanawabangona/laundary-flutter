import 'dart:convert';

class Setting {
  String? title;
  String? content;

  Setting({this.title, this.content});

  @override
  String toString() => 'Setting(title: $title, content: $content)';

  factory Setting.fromMap(Map<String, dynamic> data) => Setting(
        title: data['title'] as String?,
        content: data['content'] as String?,
      );

  Map<String, dynamic> toMap() => {
        'title': title,
        'content': content,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Setting].
  factory Setting.fromJson(String data) {
    return Setting.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Setting] to a JSON string.
  String toJson() => json.encode(toMap());

  Setting copyWith({
    String? title,
    String? content,
  }) {
    return Setting(
      title: title ?? this.title,
      content: content ?? this.content,
    );
  }
}
