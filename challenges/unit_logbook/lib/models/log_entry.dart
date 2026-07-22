class LogEntry {
  final String id;
  final String title;
  final String body;
  final DateTime timestamp;
  final double? lat;
  final double? lon;

  LogEntry({
    required this.id,
    required this.title,
    required this.body,
    required this.timestamp,
    this.lat,
    this.lon,
  });

  factory LogEntry.fromJson(Map<String, dynamic> json) {
    return LogEntry(
      // Fallback id in case sample data doesn't include one.
      id: json['id'].toString(),
      title: json['title'] as String? ?? '(untitled)',
      body: json['body'] as String? ?? '',
      timestamp: DateTime.tryParse(json['timestamp'] as String? ?? '') ??
          DateTime.now(),
      lat: (json['lat'] as num?)?.toDouble(),
      lon: (json['lon'] as num?)?.toDouble(),
    );
  }

  Map<String, dynamic> toJson() { // debugg
    return {
      'id': id,
      'title': title,
      'body': body,
      'timestamp': timestamp.toIso8601String(),
      if (lat != null) 'lat': lat,
      if (lon != null) 'lon': lon,
    };
  }
}