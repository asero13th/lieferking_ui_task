import 'package:flutter/material.dart';

class CommentBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const TextField(
      maxLines: 3,
      decoration: InputDecoration(
        labelText: 'Your comments (optional)',
        alignLabelWithHint: true,
        border: OutlineInputBorder(),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey),
        ),
      ),
    );
  }
}
