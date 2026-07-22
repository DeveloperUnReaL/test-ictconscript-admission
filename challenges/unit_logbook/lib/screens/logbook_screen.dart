import 'package:flutter/material.dart';

class LogbookScreen extends StatefulWidget{
  const LogbookScreen({super.key});

  @override
  State<LogbookScreen> createState() => _LogbookScreenState();
}
class _LogbookScreenState extends State<LogbookScreen> {
  // This should have 3 states: Loading, Loaded and Error
  bool _isLoading = false;
  String? _errorMessage;

  @override
  void initState() {
    super.initState();
    // load entries
  }

  // Void Load entries

  // Void Open new entry sheet

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("INTTI Logbook"),
        backgroundColor: Color.fromARGB(255, 109, 128, 73),
      ),
      body: _buildBody()
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

    return const Center(child: Text('No entries yet. Tap + to add one.'));
  }
}