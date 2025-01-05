import 'dart:convert';

// Enum for layout options
enum Layout { single, grid }
enum ThemeType { dark, light }

class AppSetting {
  final Layout layout;
  final ThemeType theme;
  final double padding;
  final bool showSearchIcon;
  final bool showWishListIcon;
  final bool showCartIcon;

  AppSetting({
    required this.layout,
    required this.theme,
    required this.padding,
    this.showSearchIcon = true,
    this.showWishListIcon = true,
    this.showCartIcon = true,
  });

  factory AppSetting.fromJson(Map<String, dynamic> json) {
    return AppSetting(
      layout: Layout.values.firstWhere(
        (e) => e.name == json['layout'],
        orElse: () => Layout.grid,
      ),
      theme: ThemeType.values.firstWhere(
        (e) => e.name == json['theme'],
        orElse: () => ThemeType.light,
      ),
      padding: (json['padding'] as num?)?.toDouble() ?? 8.0,
      showSearchIcon: json['showSearchIcon'] ?? true,
      showWishListIcon: json['showWishListIcon'] ?? true,
      showCartIcon: json['showCartIcon'] ?? true,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'layout': layout.name,
      'theme': theme.name,
      'padding': padding,
      'showSearchIcon': showSearchIcon,
      'showWishListIcon': showWishListIcon,
      'showCartIcon': showCartIcon,
    };
  }

  String toJson() => json.encode(toMap());

  factory AppSetting.fromJsonString(String source) =>
      AppSetting.fromJson(json.decode(source));

  AppSetting copyWith({
    Layout? layout,
    ThemeType? theme,
    double? padding,
    bool? showSearchIcon,
    bool? showWishListIcon,
    bool? showCartIcon,
  }) {
    return AppSetting(
      layout: layout ?? this.layout,
      theme: theme ?? this.theme,
      padding: padding ?? this.padding,
      showSearchIcon: showSearchIcon ?? this.showSearchIcon,
      showWishListIcon: showWishListIcon ?? this.showWishListIcon,
      showCartIcon: showCartIcon ?? this.showCartIcon,
    );
  }
}
