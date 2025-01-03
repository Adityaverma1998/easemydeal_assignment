import 'dart:convert';

// Enum for layout options
enum Layout { single, grid }
enum Theme {dark,light}

class AppSetting {
  final Layout layout;
  final Theme theme;
  final double padding;

  AppSetting({
    required this.layout,
    required this.theme,
    required this.padding,
  });

  factory AppSetting.fromJson(Map<String, dynamic> json) {
    return AppSetting(
      layout: Layout.values.firstWhere(
        (e) => e.name == json['layout'],
        orElse: () => Layout.grid, 
      ),
      theme: Theme.values.firstWhere((e)=> e.name== json['theme'], orElse: () => Theme.light,),
      padding: (json['padding'] as num).toDouble(),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'layout': layout.name,
      'theme': theme.name,
      'padding': padding,
    };
  }

  // Convert to JSON string
  String toJson() => json.encode(toMap());

  // Factory constructor to create an instance from a JSON string
  factory AppSetting.fromJsonString(String source) =>
      AppSetting.fromJson(json.decode(source));
}
