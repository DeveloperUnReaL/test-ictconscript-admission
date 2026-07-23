import 'package:flutter/material.dart';
import 'package:unit_logbook/widgets/new_entry_form.dart';
import 'package:unit_logbook/models/log_entry.dart';
import 'package:unit_logbook/widgets/entry_card.dart';
import 'package:unit_logbook/services/entry_service.dart';

class LogbookScreen extends StatefulWidget{
  const LogbookScreen({super.key});

  @override
  State<LogbookScreen> createState() => _LogbookScreenState();
}

class _LogbookScreenState extends State<LogbookScreen> {
  final EntryRepository _repository = EntryRepository();
  // This should have 3 states: Loading, Loaded and Error
  bool _isLoading = true;
  String? _errorMessage;

  @override
  void initState() {
    super.initState();
    _loadEntries();
  }

  Future<void> _loadEntries() async {
    try {
      await _repository.load();
      setState(() => _isLoading = false);
    } catch (e) {
      setState(() {
        _isLoading = false;
        _errorMessage = 'Failed to load entries: $e';
      });
    }
  }

  void _openNewEntrySheet() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (context) => NewEntryForm(
        onSubmit: (entry) {
          setState(() {
            _repository.add(entry);
          });
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "INTTI Logbook",
          style: TextStyle(
            color: Theme.of(context).colorScheme.onPrimary,
          ),
        ),
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
      body: Stack(
        children: [
          Opacity(
            opacity: 0.2,
            child: Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/bg.png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          _buildBody(),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _openNewEntrySheet,
        tooltip: 'New entry',
        child: const Icon(Icons.add),
      ),
    );
  }

  Widget _buildBody() {
    if (_isLoading) {
      return const Center();
    }

    if (_errorMessage != null) {
      return Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Text(_errorMessage!, textAlign: TextAlign.center),
        ),
      );
    }

    final entries = _repository.entries;

    if (entries.isEmpty) {
      return const Center(child: Text('No entries yet. Tap + to add one.'));
    }

    return ListView.builder(
      padding: const EdgeInsets.symmetric(vertical: 8),
      itemCount: entries.length,
      itemBuilder: (context, index) {
        final LogEntry entry = entries[index];
        return EntryCard(entry: entry);
      },
    );
  }
}