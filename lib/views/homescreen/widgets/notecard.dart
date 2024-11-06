import 'package:flutter/material.dart';

class NoteCard extends StatelessWidget {
  final String title;
  final String? subtitle;
  final String? time;
  final String? date;
  final bool isBookmarked;

  const NoteCard({
    required this.title,
    this.subtitle,
    this.time,
    this.date,
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
          if (subtitle != null) ...[
            SizedBox(height: 4),
            Text(subtitle!, style: TextStyle(fontSize: 18)),
          ],
          if (time != null) ...[
            SizedBox(height: 8),
            Text(time!, style: TextStyle(fontSize: 16, color: Colors.grey)),
          ],
          if (date != null) ...[
            SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(date!, style: TextStyle(fontSize: 16, color: Colors.grey)),
                if (isBookmarked)
                  Icon(Icons.bookmark, color: Colors.amber, size: 20),
              ],
            ),
          ],
        ],
      ),
    );
  }
}
