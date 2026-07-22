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
                  "datetime",
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
}