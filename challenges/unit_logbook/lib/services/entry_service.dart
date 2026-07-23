import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;
import '../models/log_entry.dart';

class EntryRepository {
  List<LogEntry> _entries = [];

  List<LogEntry> get entries => List.unmodifiable(_entries);

  Future<void> load() async {
    final String response = await rootBundle.loadString('assets/data.json');

    final decoded = jsonDecode(response) as List<dynamic>;
    _entries = decoded
        .map((item) => LogEntry.fromJson(item as Map<String, dynamic>))
        .toList();

    _sortNewestFirst();
  }

  void add(LogEntry entry) {
    _entries.add(entry);
    _sortNewestFirst();
  }

  void _sortNewestFirst() {
    _entries.sort((a, b) => b.timestamp.compareTo(a.timestamp));
  }
}