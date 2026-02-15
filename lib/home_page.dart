import 'dart:async';
import 'package:flutter/material.dart';
import 'allah_names_page.dart';
import 'ramadan_page.dart';

class HomePage extends StatefulWidget {
  final bool isDarkMode;
  final bool isBangla;
  final Function(int) onNavigate;

  const HomePage({
    super.key,
    required this.isDarkMode,
    required this.isBangla,
    required this.onNavigate,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Timer _timer;
  Duration _timeLeft = Duration.zero;
  String _nextEvent = "";
  final String _selectedCity = 'Dhaka';

  final Map<String, int> _cityAdjustments = {
    'Dhaka': 0, 'Chattogram': -5, 'Sylhet': -6, 'Rajshahi': 7,
    'Khulna': 3, 'Barisal': 1, 'Rangpur': 6, 'Mymensingh': -1
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
      _nextEvent = widget.isBangla ? "সেহরির বাকি" : "Sehri Ends In";
      _timeLeft = sehriTime.difference(now);
    } else if (now.isBefore(iftarTime)) {
      _nextEvent = widget.isBangla ? "ইফতারের বাকি" : "Iftar Begins In";
      _timeLeft = iftarTime.difference(now);
    } else {
      final tomorrow = now.add(const Duration(days: 1));
      try {
        final tomorrowData = _ramadanData.firstWhere(
          (d) => d.date.year == tomorrow.year && d.date.month == tomorrow.month && d.date.day == tomorrow.day
        );
        DateTime nextSehri = _parseTime(tomorrowData.date, tomorrowData.sehri, adj);
        _nextEvent = widget.isBangla ? "সেহরির বাকি" : "Next Sehri In";
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
      '0': '০', '1': '১', '2': '২', '3': '৩', '4': '৪', '5': '৫', '6': '৬', '7': '৭', '8': '৮', '9': '৯',
    };
    String output = input;
    for (var key in conversionMap.keys) {
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

  String _getGreeting() {
    final hour = DateTime.now().hour;
    if (hour < 12) {
      return widget.isBangla ? "শুভ সকাল" : "Good Morning";
    } else if (hour < 17) {
      return widget.isBangla ? "শুভ দুপুর" : "Good Afternoon";
    } else if (hour < 20) {
      return widget.isBangla ? "শুভ সন্ধ্যা" : "Good Evening";
    } else {
      return widget.isBangla ? "শুভ রাত্রি" : "Good Night";
    }
  }

  @override
  Widget build(BuildContext context) {
    final primaryGreen = Colors.green.shade600;
    final surfaceColor = widget.isDarkMode ? const Color(0xFF1E293B) : Colors.white;
    final textColor = widget.isDarkMode ? Colors.white : Colors.black87;
    final subtextColor = widget.isDarkMode ? Colors.white70 : Colors.black54;

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Modern Header
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.isBangla ? "আসসালামু আলাইকুম" : "Assalamu Alaikum",
                      style: TextStyle(
                        color: primaryGreen,
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 0.5,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      _getGreeting(),
                      style: TextStyle(
                        color: textColor,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: primaryGreen.withOpacity(0.1),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(Icons.wb_sunny_outlined, color: primaryGreen, size: 24),
                ),
              ],
            ),
            const SizedBox(height: 24),
            
            // Ramadan Card - Redesigned
            _buildModernCountdownCard(primaryGreen),
            
            const SizedBox(height: 32),
            
            // Daily Inspiration Section
            _buildDailyInspiration(primaryGreen, surfaceColor, textColor, subtextColor),
            
            const SizedBox(height: 32),
            
            // Feature Grid Label
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  widget.isBangla ? "প্রয়োজনীয় সেবা" : "Essential Services",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: textColor,
                  ),
                ),
                Icon(Icons.grid_view_rounded, size: 20, color: subtextColor),
              ],
            ),
            const SizedBox(height: 16),
            
            // Modern Bento-style Grid
            GridView.count(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisCount: 2,
              mainAxisSpacing: 16,
              crossAxisSpacing: 16,
              childAspectRatio: 1.1,
              children: [
                _buildModernFeatureCard(
                  widget.isBangla ? "আল্লাহর নাম" : "99 Names",
                  Icons.auto_awesome_rounded,
                  Colors.amber.shade700,
                  surfaceColor,
                  textColor,
                  () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AllahNamesPage(
                        isDarkMode: widget.isDarkMode,
                        isBangla: widget.isBangla,
                      ),
                    ),
                  ),
                ),
                _buildModernFeatureCard(
                  widget.isBangla ? "ডিজিটাল তাসবিহ" : "Tasbih",
                  Icons.fingerprint_rounded,
                  primaryGreen,
                  surfaceColor,
                  textColor,
                  () => widget.onNavigate(1),
                ),
                _buildModernFeatureCard(
                  widget.isBangla ? "রমজান" : "Ramadan",
                  Icons.calendar_month_rounded,
                  Colors.orange.shade700,
                  surfaceColor,
                  textColor,
                  () => widget.onNavigate(2),
                ),
                _buildModernFeatureCard(
                  widget.isBangla ? "নামাজের সময়" : "Prayer Times",
                  Icons.access_time_filled_rounded,
                  Colors.blue.shade700,
                  surfaceColor,
                  textColor,
                  () => widget.onNavigate(3),
                ),
                _buildModernFeatureCard(
                  widget.isBangla ? "যাকাত" : "Zakat Calc",
                  Icons.calculate_rounded,
                  Colors.teal.shade700,
                  surfaceColor,
                  textColor,
                  () => widget.onNavigate(4),
                ),
                _buildModernFeatureCard(
                  widget.isBangla ? "কিবলা" : "Qibla",
                  Icons.explore_rounded,
                  Colors.red.shade700,
                  surfaceColor,
                  textColor,
                  () => Navigator.pushNamed(context, '/qibla'),
                ),
              ],
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }

  Widget _buildModernCountdownCard(Color primaryGreen) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        gradient: LinearGradient(
          colors: [primaryGreen, Colors.green.shade800],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        boxShadow: [
          BoxShadow(
            color: primaryGreen.withOpacity(0.3),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Stack(
        children: [
          Positioned(
            right: -20,
            top: -20,
            child: Icon(
              Icons.dark_mode_outlined,
              size: 100,
              color: Colors.white.withOpacity(0.1),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text(
                        widget.isBangla ? "রমজান ২০২৬" : "Ramadan 2026",
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Text(
                  _nextEvent,
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.9),
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  _formatDuration(_timeLeft),
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.5,
                  ),
                ),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      widget.isBangla ? "ঢাকা, বাংলাদেশ" : "Dhaka, Bangladesh",
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.7),
                        fontSize: 12,
                      ),
                    ),
                    Icon(Icons.arrow_forward_ios_rounded, color: Colors.white.withOpacity(0.7), size: 14),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDailyInspiration(Color primaryGreen, Color surfaceColor, Color textColor, Color subtextColor) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: surfaceColor,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(
          color: widget.isDarkMode ? Colors.white.withOpacity(0.05) : Colors.black.withOpacity(0.05),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(widget.isDarkMode ? 0.2 : 0.05),
            blurRadius: 15,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.format_quote_rounded, color: primaryGreen, size: 28),
              const SizedBox(width: 8),
              Text(
                widget.isBangla ? "আজকের অনুপ্রেরণা" : "Daily Inspiration",
                style: TextStyle(
                  color: primaryGreen,
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Text(
            widget.isBangla 
              ? "“নিশ্চয়ই কষ্টের সাথেই স্বস্তি রয়েছে।” (সূরা ইনশিরাহ্: ৫)" 
              : "“Indeed, with hardship [will be] ease.” (Surah Ash-Sharh: 5)",
            style: TextStyle(
              color: textColor,
              fontSize: 15,
              height: 1.5,
              fontWeight: FontWeight.w500,
              fontStyle: FontStyle.italic,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildModernFeatureCard(
    String title,
    IconData icon,
    Color accentColor,
    Color surfaceColor,
    Color textColor,
    VoidCallback onTap,
  ) {
    return Container(
      decoration: BoxDecoration(
        color: surfaceColor,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(widget.isDarkMode ? 0.2 : 0.04),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(24),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: accentColor.withOpacity(0.1),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(icon, color: accentColor, size: 24),
                ),
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: textColor,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
