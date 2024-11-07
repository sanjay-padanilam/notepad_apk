import 'package:flutter/material.dart';

class NoteCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final String time;

  final bool isBookmarked;

  const NoteCard({
    required this.title,
    required this.subtitle,
    required this.time,
    this.isBookmarked = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 8),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.grey[850],
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title,
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
          SizedBox(height: 4),
          Text(subtitle, style: TextStyle(fontSize: 18)),
          SizedBox(height: 8),
          Text(time, style: TextStyle(fontSize: 16, color: Colors.grey)),
        ],
      ),
    );
  }
}
