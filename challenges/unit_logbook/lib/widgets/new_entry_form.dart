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
      padding: EdgeInsets.all(16),
      child: Form(key: _formKey, child: Column(
        children: [
            Text('New Entry', style: Theme.of(context).textTheme.titleLarge),
            const SizedBox(height: 16),
            TextFormField(
              controller: _titleController,
              decoration: const InputDecoration(labelText: 'Title'),
              style: const TextStyle(
                fontSize: 24,
              ),
              validator: (value) =>
                  (value == null || value.trim().isEmpty)
                  ? 'Title is required'
                  : null,
            ),
            const SizedBox(height: 12),

            TextFormField(
              controller: _bodyController,
              decoration: const InputDecoration(labelText: 'Body'),
              maxLines: 4,
              validator: (value) =>
                  (value == null || value.trim().isEmpty)
                      ? 'Body is required'
                      : null,
            ),
            const SizedBox(height: 12),

            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    controller: _latController,
                    decoration: const InputDecoration(labelText: 'Lat (optional)'),
                    keyboardType: const TextInputType.numberWithOptions(decimal: true, signed: true),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: TextFormField(
                    controller: _lonController,
                    decoration: const InputDecoration(labelText: 'Lon (optional)'),
                    keyboardType: const TextInputType.numberWithOptions(decimal: true, signed: true),
                  ),
                ),
              ],
            ),
            
            const SizedBox(height: 20),

            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Theme.of(context).colorScheme.onPrimary,
                padding: const EdgeInsets.symmetric(horizontal: 48.0, vertical: 24.0),
              ),
              onPressed: _handleSubmit,
              child: const Text('Add Entry', style: TextStyle(fontSize: 24),),
            ),
        ],
      )),
    );
  }
}