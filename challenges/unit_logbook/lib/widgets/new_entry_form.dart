import 'package:flutter/material.dart';
import '../models/log_entry.dart';

class NewEntryForm extends StatefulWidget {
  final void Function(LogEntry entry) onSubmit;

  const NewEntryForm({super.key, required this.onSubmit});

  @override
  State<NewEntryForm> createState() => _NewEntryFormState();
}

class _NewEntryFormState extends State<NewEntryForm> {
  final _formKey = GlobalKey<FormState>();

  final _titleController = TextEditingController();
  final _bodyController = TextEditingController();
  final _latController = TextEditingController();
  final _lonController = TextEditingController();

  void _handleSubmit() {
    if (!_formKey.currentState!.validate()) return;

    final entry = LogEntry(
      id: DateTime.now().microsecondsSinceEpoch.toString(),
      title: _titleController.text.trim(),
      body: _bodyController.text.trim(),
      timestamp: DateTime.now(),
      lat: double.tryParse(_latController.text),
      lon: double.tryParse(_lonController.text),
    );

    widget.onSubmit(entry);
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(

      ),
    );
  }
}