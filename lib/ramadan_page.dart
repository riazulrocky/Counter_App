import 'dart:async';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class RamadanDay {
  final int ramadan;
  final DateTime date;
  final String sehri;
  final String iftar;

  RamadanDay({required this.ramadan, required this.date, required this.sehri, required this.iftar});
}

class RamadanPage extends StatefulWidget {
  final bool isDarkMode;
  final bool isBangla;

  const RamadanPage({super.key, required this.isDarkMode, required this.isBangla});

  @override
  State<RamadanPage> createState() => _RamadanPageState();
}

class _RamadanPageState extends State<RamadanPage> {
  String _selectedCity = 'Dhaka';
  late Timer _timer;
  Duration _timeLeft = Duration.zero;
  String _nextEvent = "";
  DateTime _currentTime = DateTime.now();
  
  final Map<String, int> _cityAdjustments = {
    'Dhaka': 0, 'Chattogram': -5, 'Sylhet': -6, 'Rajshahi': 7, 
    'Khulna': 3, 'Barisal': 1, 'Rangpur': 6, 'Mymensingh': -1
  };

  final Map<String, String> _cityNamesBn = {
    'Dhaka': 'ঢাকা', 'Chattogram': 'চট্টগ্রাম', 'Sylhet': 'সিলেট', 'Rajshahi': 'রাজশাহী',
    'Khulna': 'খুলনা', 'Barisal': 'বরিশাল', 'Rangpur': 'রংপুর', 'Mymensingh': 'ময়মনসিংহ',
  };

  final List<RamadanDay> _ramadanData = [
    RamadanDay(ramadan: 1, date: DateTime(2026, 2, 18), sehri: "05:15", iftar: "18:02"),
    RamadanDay(ramadan: 2, date: DateTime(2026, 2, 19), sehri: "05:14", iftar: "18:03"),
    RamadanDay(ramadan: 3, date: DateTime(2026, 2, 20), sehri: "05:13", iftar: "18:03"),
    RamadanDay(ramadan: 4, date: DateTime(2026, 2, 21), sehri: "05:12", iftar: "18:04"),
    RamadanDay(ramadan: 5, date: DateTime(2026, 2, 22), sehri: "05:11", iftar: "18:04"),
    RamadanDay(ramadan: 6, date: DateTime(2026, 2, 23), sehri: "05:10", iftar: "18:05"),
    RamadanDay(ramadan: 7, date: DateTime(2026, 2, 24), sehri: "05:09", iftar: "18:05"),
    RamadanDay(ramadan: 8, date: DateTime(2026, 2, 25), sehri: "05:08", iftar: "18:06"),
    RamadanDay(ramadan: 9, date: DateTime(2026, 2, 26), sehri: "05:07", iftar: "18:06"),
    RamadanDay(ramadan: 10, date: DateTime(2026, 2, 27), sehri: "05:06", iftar: "18:07"),
    RamadanDay(ramadan: 11, date: DateTime(2026, 2, 28), sehri: "05:05", iftar: "18:07"),
    RamadanDay(ramadan: 12, date: DateTime(2026, 3, 1), sehri: "05:04", iftar: "18:08"),
    RamadanDay(ramadan: 13, date: DateTime(2026, 3, 2), sehri: "05:03", iftar: "18:08"),
    RamadanDay(ramadan: 14, date: DateTime(2026, 3, 3), sehri: "05:02", iftar: "18:09"),
    RamadanDay(ramadan: 15, date: DateTime(2026, 3, 4), sehri: "05:01", iftar: "18:09"),
    RamadanDay(ramadan: 16, date: DateTime(2026, 3, 5), sehri: "05:00", iftar: "18:10"),
    RamadanDay(ramadan: 17, date: DateTime(2026, 3, 6), sehri: "04:59", iftar: "18:10"),
    RamadanDay(ramadan: 18, date: DateTime(2026, 3, 7), sehri: "04:58", iftar: "18:11"),
    RamadanDay(ramadan: 19, date: DateTime(2026, 3, 8), sehri: "04:57", iftar: "18:11"),
    RamadanDay(ramadan: 20, date: DateTime(2026, 3, 9), sehri: "04:56", iftar: "18:12"),
    RamadanDay(ramadan: 21, date: DateTime(2026, 3, 10), sehri: "04:55", iftar: "18:12"),
    RamadanDay(ramadan: 22, date: DateTime(2026, 3, 11), sehri: "04:54", iftar: "18:13"),
    RamadanDay(ramadan: 23, date: DateTime(2026, 3, 12), sehri: "04:53", iftar: "18:13"),
    RamadanDay(ramadan: 24, date: DateTime(2026, 3, 13), sehri: "04:52", iftar: "18:14"),
    RamadanDay(ramadan: 25, date: DateTime(2026, 3, 14), sehri: "04:51", iftar: "18:14"),
    RamadanDay(ramadan: 26, date: DateTime(2026, 3, 15), sehri: "04:50", iftar: "18:15"),
    RamadanDay(ramadan: 27, date: DateTime(2026, 3, 16), sehri: "04:49", iftar: "18:15"),
    RamadanDay(ramadan: 28, date: DateTime(2026, 3, 17), sehri: "04:48", iftar: "18:16"),
    RamadanDay(ramadan: 29, date: DateTime(2026, 3, 18), sehri: "04:47", iftar: "18:16"),
    RamadanDay(ramadan: 30, date: DateTime(2026, 3, 19), sehri: "04:46", iftar: "18:17"),
  ];

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (mounted) {
        setState(() {
          _currentTime = DateTime.now();
          _calculateNextEvent();
        });
      }
    });
  }

  void _calculateNextEvent() {
    final now = DateTime.now();
    int adj = _cityAdjustments[_selectedCity] ?? 0;

    RamadanDay? todayData;
    try {
      todayData = _ramadanData.firstWhere(
        (d) => d.date.year == now.year && d.date.month == now.month && d.date.day == now.day
      );
    } catch (_) {
      _nextEvent = widget.isBangla ? "রমজান শুরু হয়নি" : "Ramadan not started";
      _timeLeft = Duration.zero;
      return;
    }

    DateTime sehriTime = _parseTime(todayData.date, todayData.sehri, adj);
    DateTime iftarTime = _parseTime(todayData.date, todayData.iftar, adj);

    if (now.isBefore(sehriTime)) {
      _nextEvent = widget.isBangla ? "সেহরির বাকি" : "Next Sehri in";
      _timeLeft = sehriTime.difference(now);
    } else if (now.isBefore(iftarTime)) {
      _nextEvent = widget.isBangla ? "ইফতারের বাকি" : "Next Iftar in";
      _timeLeft = iftarTime.difference(now);
    } else {
      final tomorrow = now.add(const Duration(days: 1));
      try {
        final tomorrowData = _ramadanData.firstWhere(
          (d) => d.date.year == tomorrow.year && d.date.month == tomorrow.month && d.date.day == tomorrow.day
        );
        DateTime nextSehri = _parseTime(tomorrowData.date, tomorrowData.sehri, adj);
        _nextEvent = widget.isBangla ? "সেহরির বাকি" : "Next Sehri in";
        _timeLeft = nextSehri.difference(now);
      } catch (_) {
        _nextEvent = widget.isBangla ? "রমজান শেষ" : "Ramadan Ended";
        _timeLeft = Duration.zero;
      }
    }
  }

  DateTime _parseTime(DateTime date, String timeStr, int adjMinutes) {
    final parts = timeStr.split(':');
    return DateTime(date.year, date.month, date.day, int.parse(parts[0]), int.parse(parts[1])).add(Duration(minutes: adjMinutes));
  }

  String _toBn(String input) {
    if (!widget.isBangla) return input;
    final Map<String, String> conversionMap = {
      'January': 'জানুয়ারি', 'February': 'ফেব্রুয়ারি', 'March': 'মার্চ', 'April': 'এপ্রিল', 'May': 'মে', 'June': 'জুন', 'July': 'জুলাই', 'August': 'আগস্ট', 'September': 'সেপ্টেম্বর', 'October': 'অক্টোবর', 'November': 'নভেম্বর', 'December': 'ডিসেম্বর',
      'Saturday': 'শনিবার', 'Sunday': 'রবিবার', 'Monday': 'সোমবার', 'Tuesday': 'মঙ্গলবার', 'Wednesday': 'বুধবার', 'Thursday': 'বৃহস্পতিবার', 'Friday': 'শুক্রবার',
      '0': '০', '1': '১', '2': '২', '3': '৩', '4': '৪', '5': '৫', '6': '৬', '7': '৭', '8': '৮', '9': '৯',
    };
    String output = input;
    var keys = conversionMap.keys.toList()..sort((a, b) => b.length.compareTo(a.length));
    for (var key in keys) {
      output = output.replaceAll(key, conversionMap[key]!);
    }
    return output;
  }

  String _formatDuration(Duration d) {
    String h = d.inHours.toString().padLeft(2, '0');
    String m = (d.inMinutes % 60).toString().padLeft(2, '0');
    String s = (d.inSeconds % 60).toString().padLeft(2, '0');
    return _toBn("$h:$m:$s");
  }

  void _showLocationPicker() {
    showModalBottomSheet(
      context: context,
      backgroundColor: widget.isDarkMode ? const Color(0xFF0F172A) : Colors.white,
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(24))),
      builder: (context) {
        return Container(
          padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Text(
                  widget.isBangla ? "লোকেশন নির্বাচন করুন" : "Select Location",
                  style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: 20),
              Expanded(
                child: GridView.count(
                  crossAxisCount: 2,
                  childAspectRatio: 3,
                  children: _cityAdjustments.keys.map((city) {
                    return InkWell(
                      onTap: () {
                        setState(() => _selectedCity = city);
                        Navigator.pop(context);
                      },
                      child: Container(
                        margin: const EdgeInsets.all(4),
                        decoration: BoxDecoration(
                          color: _selectedCity == city ? Colors.green.shade600 : (widget.isDarkMode ? Colors.white10 : Colors.grey.shade100),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        alignment: Alignment.center,
                        child: Text(
                          widget.isBangla ? _cityNamesBn[city]! : city,
                          style: TextStyle(color: _selectedCity == city ? Colors.white : (widget.isDarkMode ? Colors.white70 : Colors.black87), fontWeight: FontWeight.bold),
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final primaryGreen = Colors.green.shade600;

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          children: [
            const SizedBox(height: 10),
            // Location Selector Box
            InkWell(
              onTap: _showLocationPicker,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                decoration: BoxDecoration(
                  color: widget.isDarkMode ? const Color(0xFF1E293B) : Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 10)],
                ),
                child: Row(
                  children: [
                    Icon(Icons.location_on, color: primaryGreen),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(widget.isBangla ? "লোকেশন" : "Location", style: const TextStyle(fontSize: 12, color: Colors.grey)),
                          Text(widget.isBangla ? _cityNamesBn[_selectedCity]! : _selectedCity, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                        ],
                      ),
                    ),
                    Icon(Icons.keyboard_arrow_down, color: primaryGreen),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            // Timer Card
            _buildTimerCard(primaryGreen),
            const SizedBox(height: 30),
            // Calendar Table
            _buildCalendarTable(primaryGreen),
            const SizedBox(height: 20),
            // Eid Info Card
            _buildEidInfoCard(primaryGreen),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

  Widget _buildTimerCard(Color primaryGreen) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: [primaryGreen, Colors.green.shade800]),
        borderRadius: BorderRadius.circular(24),
        boxShadow: [BoxShadow(color: primaryGreen.withOpacity(0.3), blurRadius: 15, offset: const Offset(0, 8))],
      ),
      child: Column(
        children: [
          Text(_nextEvent, style: const TextStyle(color: Colors.white70, fontSize: 18)),
          const SizedBox(height: 10),
          Text(_formatDuration(_timeLeft), style: const TextStyle(color: Colors.white, fontSize: 42, fontWeight: FontWeight.bold, letterSpacing: 2)),
        ],
      ),
    );
  }

  Widget _buildCalendarTable(Color primaryGreen) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      color: widget.isDarkMode ? const Color(0xFF1E293B) : Colors.white,
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
            decoration: BoxDecoration(color: primaryGreen.withOpacity(0.1), borderRadius: const BorderRadius.vertical(top: Radius.circular(16))),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(child: Text(widget.isBangla ? "রমজান" : "Ram.", textAlign: TextAlign.center, style: const TextStyle(fontWeight: FontWeight.bold))),
                Expanded(child: Text(widget.isBangla ? "তারিখ" : "Date", textAlign: TextAlign.center, style: const TextStyle(fontWeight: FontWeight.bold))),
                Expanded(child: Text(widget.isBangla ? "সেহরি" : "Sehri", textAlign: TextAlign.center, style: const TextStyle(fontWeight: FontWeight.bold))),
                Expanded(child: Text(widget.isBangla ? "ইফতার" : "Iftar", textAlign: TextAlign.center, style: const TextStyle(fontWeight: FontWeight.bold))),
              ],
            ),
          ),
          ..._ramadanData.map((day) => _buildDataRow(day, primaryGreen)),
        ],
      ),
    );
  }

  Widget _buildDataRow(RamadanDay day, Color primaryGreen) {
    int adj = _cityAdjustments[_selectedCity] ?? 0;
    return Container(
      decoration: BoxDecoration(border: Border(bottom: BorderSide(color: Colors.grey.withOpacity(0.1)))),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(child: Text(_toBn(day.ramadan.toString()), textAlign: TextAlign.center)),
          Expanded(child: Text(_toBn(DateFormat('d MMMM').format(day.date)), textAlign: TextAlign.center, style: const TextStyle(fontSize: 11))),
          Expanded(child: Text(_toBn(DateFormat('hh:mm').format(_parseTime(day.date, day.sehri, adj))), textAlign: TextAlign.center)),
          Expanded(child: Text(_toBn(DateFormat('hh:mm').format(_parseTime(day.date, day.iftar, adj))), textAlign: TextAlign.center, style: TextStyle(color: primaryGreen, fontWeight: FontWeight.bold))),
        ],
      ),
    );
  }

  Widget _buildEidInfoCard(Color primaryGreen) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: primaryGreen.withOpacity(0.1),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: primaryGreen.withOpacity(0.3)),
      ),
      child: Column(
        children: [
          Icon(Icons.star_outline, color: primaryGreen, size: 30),
          const SizedBox(height: 10),
          Text(
            widget.isBangla ? "ঈদুল ফিতর ২০২৬ (সম্ভাব্য)" : "Eid-ul-Fitr 2026 (Expected)",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: primaryGreen),
          ),
          const SizedBox(height: 5),
          Text(
            widget.isBangla ? "২০ মার্চ, ২০২৬ (শুক্রবার)" : "20 March, 2026 (Friday)",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: widget.isDarkMode ? Colors.white70 : Colors.black87),
          ),
          const SizedBox(height: 10),
          Text(
            widget.isBangla ? "* চাঁদ দেখার ওপর নির্ভরশীল" : "* Subject to moon sighting",
            style: const TextStyle(fontSize: 12, color: Colors.grey, fontStyle: FontStyle.italic),
          ),
        ],
      ),
    );
  }
}
