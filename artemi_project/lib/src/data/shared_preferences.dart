import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefsEventRepository {
  static const String _eventsKey = 'events';

  Future<void> saveEvents(List<String> eventTitles) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setStringList(_eventsKey, eventTitles);
  }

  Future<List<String>> loadEvents() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getStringList(_eventsKey) ?? [];
  }

  Future<void> addEvent(String eventTitle) async {
    final events = await loadEvents();
    events.add(eventTitle);
    await saveEvents(events);
  }

  Future<void> deleteEvent(String eventTitle) async {
    final events = await loadEvents();
    events.remove(eventTitle);
    await saveEvents(events);
  }
}
