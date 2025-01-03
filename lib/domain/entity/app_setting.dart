import 'dart:convert';

// Enum for layout options
enum Layout { single, grid }

class AppSetting {
  final Layout layout;
  final String theme;
  final double padding;

  AppSetting({
    required this.layout,
    required this.theme,
    required this.padding,
  });

  // Factory constructor to create an instance from JSON map
  factory AppSetting.fromJson(Map<String, dynamic> json) {
    return AppSetting(
      layout: Layout.values.firstWhere(
        (e) => e.name == json['layout'],
        orElse: () => Layout.grid, // Default value if not found
      ),
      theme: json['theme'] as String,
      padding: (json['padding'] as num).toDouble(),
    );
  }

  // Method to convert an instance to a JSON map
  Map<String, dynamic> toMap() {
    return {
      'layout': layout.name,
      'theme': theme,
      'padding': padding,
    };
  }

  // Convert to JSON string
  String toJson() => json.encode(toMap());

  // Factory constructor to create an instance from a JSON string
  factory AppSetting.fromJsonString(String source) =>
      AppSetting.fromJson(json.decode(source));
}
