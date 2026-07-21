import 'package:flutter/material.dart';

class LogbookScreen extends StatefulWidget{
  const LogbookScreen({super.key});

  @override
  State<LogbookScreen> createState() => _LogbookScreenState();
}
class _LogbookScreenState extends State<LogbookScreen> {
  // This should have 3 states: Loading, Loaded and Error
  bool _isLoading = true;
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
        title:  const Text("Intti Logbook"),
      ),
      body: const Center(
        child: Text("placeholder"),
      ),
    );
  }

  // _buildBody
}