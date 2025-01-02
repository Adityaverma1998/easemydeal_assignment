import 'package:flutter/material.dart';

class PrimaryLayout extends StatefulWidget {
  final Widget child;
  final bool isBack; 

  const PrimaryLayout({
    super.key,
    required this.child,
    this.isBack = true,
  });

  @override
  _StatePrimaryLayout createState() => _StatePrimaryLayout();
}

class _StatePrimaryLayout extends State<PrimaryLayout> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context, widget.isBack),
      body: widget.child,
    );
  }
}

PreferredSizeWidget _buildAppBar(BuildContext context, bool isBack) {
  return AppBar(
    leading: isBack
        ? IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          )
        : null,
    title: Text("App Bar"),
    actions: [
      IconButton(
        icon: Icon(Icons.search),
        onPressed: () {},
      ),
      IconButton(
        icon: Icon(Icons.favorite),
        onPressed: () {},
      ),
      IconButton(
        icon: Icon(Icons.shopping_cart),
        onPressed: () {},
      ),
    ],
  );
}
