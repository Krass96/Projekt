class Event {
  final String eventId;
  final String title;
  final String description;
  final String artistName;
  final DateTime start;
  final DateTime end;
  final String location;
  final double price;

  Event(
      {required this.eventId,
      required this.title,
      required this.description,
      required this.artistName,
      required this.start,
      required this.end,
      required this.location,
      required this.price});
}
