import 'dart:async';
import 'package:flutter/material.dart';
import 'package:adhan/adhan.dart';
import 'package:intl/intl.dart';

class PrayerTimesPage extends StatefulWidget {
  final bool isDarkMode;
  final bool isBangla;

  const PrayerTimesPage({super.key, required this.isDarkMode, required this.isBangla});

  @override
  State<PrayerTimesPage> createState() => _PrayerTimesPageState();
}

class _PrayerTimesPageState extends State<PrayerTimesPage> {
  String _selectedCity = 'Dhaka';
  late Timer _timer;
  DateTime _currentTime = DateTime.now();

  final Map<String, Coordinates> _cities = {
    'Dhaka': Coordinates(23.8103, 90.4125),
    'Chattogram': Coordinates(22.3569, 91.7832),
    'Sylhet': Coordinates(24.8949, 91.8687),
    'Rajshahi': Coordinates(24.3745, 88.6042),
    'Khulna': Coordinates(22.8456, 89.5403),
    'Barisal': Coordinates(22.7010, 90.3535),
    'Rangpur': Coordinates(25.7439, 89.2752),
    'Mymensingh': Coordinates(24.7471, 90.4203),
  };

  final Map<String, String> _cityNamesBn = {
    'Dhaka': 'ঢাকা',
    'Chattogram': 'চট্টগ্রাম',
    'Sylhet': 'সিলেট',
    'Rajshahi': 'রাজশাহী',
    'Khulna': 'খুলনা',
    'Barisal': 'বরিশাল',
    'Rangpur': 'রংপুর',
    'Mymensingh': 'ময়মনসিংহ',
  };

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (mounted) {
        setState(() {
          _currentTime = DateTime.now();
        });
      }
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
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

  PrayerTimes _getPrayerTimes(DateTime date) {
    Coordinates coord = _cities[_selectedCity]!;
    final params = CalculationMethod.karachi.getParameters();
    params.madhab = Madhab.hanafi;
    return PrayerTimes(coord, DateComponents.from(date), params);
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
                  children: _cities.keys.map((city) {
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
    final prayerTimes = _getPrayerTimes(DateTime.now());

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
        child: Column(
          children: [
            const SizedBox(height: 10),
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
            Card(
              elevation: 4,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
              color: widget.isDarkMode ? const Color(0xFF1E293B) : Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    Text(_toBn(DateFormat('EEEE, dd MMMM, yyyy').format(_currentTime)), textAlign: TextAlign.center, style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: widget.isDarkMode ? Colors.white70 : Colors.black54)),
                    const SizedBox(height: 8),
                    Text(_toBn(DateFormat('hh:mm:ss a').format(_currentTime)), style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: primaryGreen)),
                    const Divider(height: 30),
                    _buildPrayerRow(widget.isBangla ? "ফজর" : "Fajr", prayerTimes.fajr, primaryGreen),
                    _buildPrayerRow(widget.isBangla ? "সূর্যোদয়" : "Sunrise", prayerTimes.sunrise, Colors.orange),
                    _buildPrayerRow(widget.isBangla ? "যোহর" : "Dhuhr", prayerTimes.dhuhr, primaryGreen),
                    _buildPrayerRow(widget.isBangla ? "আসর" : "Asr", prayerTimes.asr, primaryGreen),
                    _buildPrayerRow(widget.isBangla ? "মাগরিব" : "Maghrib", prayerTimes.maghrib, primaryGreen),
                    _buildPrayerRow(widget.isBangla ? "এশা" : "Isha", prayerTimes.isha, primaryGreen),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 30),
            Text(widget.isBangla ? "আগামী ৭ দিনের সূচি" : "Next 7 Days Schedule", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: widget.isDarkMode ? Colors.white : Colors.black87)),
            const SizedBox(height: 12),
            _buildWeeklySchedule(primaryGreen),
          ],
        ),
      ),
    );
  }

  Widget _buildPrayerRow(String label, DateTime time, Color color) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(children: [Icon(Icons.access_time, size: 20, color: color.withOpacity(0.7)), const SizedBox(width: 12), Text(label, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500))]),
          Text(_toBn(DateFormat.jm().format(time)), style: TextStyle(color: color, fontWeight: FontWeight.bold, fontSize: 18)),
        ],
      ),
    );
  }

  Widget _buildWeeklySchedule(Color primaryGreen) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: 7,
      itemBuilder: (context, index) {
        final date = DateTime.now().add(Duration(days: index + 1));
        final times = _getPrayerTimes(date);
        return Card(
          margin: const EdgeInsets.only(bottom: 8),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          color: widget.isDarkMode ? const Color(0xFF1E293B) : Colors.white,
          child: ExpansionTile(
            title: Text(_toBn(DateFormat('EEEE, d MMMM').format(date)), style: const TextStyle(fontWeight: FontWeight.w600)),
            iconColor: primaryGreen,
            children: [
              _buildSmallTime(widget.isBangla ? "ফজর" : "Fajr", times.fajr),
              _buildSmallTime(widget.isBangla ? "যোহর" : "Dhuhr", times.dhuhr),
              _buildSmallTime(widget.isBangla ? "আসর" : "Asr", times.asr),
              _buildSmallTime(widget.isBangla ? "মাগরিব" : "Maghrib", times.maghrib),
              _buildSmallTime(widget.isBangla ? "এশা" : "Isha", times.isha),
              const SizedBox(height: 10),
            ],
          ),
        );
      },
    );
  }

  Widget _buildSmallTime(String label, DateTime time) {
    return Padding(padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 4), child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [Text(label, style: const TextStyle(color: Colors.grey)), Text(_toBn(DateFormat.jm().format(time)), style: const TextStyle(fontWeight: FontWeight.w500))]));
  }
}
