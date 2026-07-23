import 'package:flutter/material.dart';
import '../models/log_entry.dart';

class EntryCard extends StatelessWidget {
  final LogEntry entry;

  const EntryCard({super.key, required this.entry});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(child: Text(entry.title, style: Theme.of(context).textTheme.titleMedium),),
                Text(
                  _formatTimestamp(entry.timestamp),
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ],
            ),
            const SizedBox(height: 6),
            Text(entry.body),
          ],
        ),
      )
    );
  }

  String _formatTimestamp(DateTime dt) { // Avoid unnecessary package...
    String two(int n) => n.toString().padLeft(2, '0');
    return '${dt.year}-${two(dt.month)}-${two(dt.day)} ${two(dt.hour)}:${two(dt.minute)}';
  }
}