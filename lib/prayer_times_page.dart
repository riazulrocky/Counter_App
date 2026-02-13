import 'package:flutter/material.dart';
import 'package:adhan/adhan.dart';
import 'package:geolocator/geolocator.dart';
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
  Position? _currentPosition;
  bool _isLoading = false;

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

  String _toBn(String input) {
    if (!widget.isBangla) return input;
    
    // Using a more robust replacement strategy to avoid partial matches
    final Map<String, String> monthMap = {
      'January': 'জানুয়ারি', 'February': 'ফেব্রুয়ারি', 'March': 'মার্চ', 'April': 'এপ্রিল', 'May': 'মে', 'June': 'জুন', 'July': 'জুলাই', 'August': 'আগস্ট', 'September': 'সেপ্টেম্বর', 'October': 'অক্টোবর', 'November': 'নভেম্বর', 'December': 'ডিসেম্বর'
    };
    
    final Map<String, String> dayMap = {
      'Saturday': 'শনিবার', 'Sunday': 'রবিবার', 'Monday': 'সোমবার', 'Tuesday': 'মঙ্গলবার', 'Wednesday': 'বুধবার', 'Thursday': 'বৃহস্পতিবার', 'Friday': 'শুক্রবার'
    };

    final Map<String, String> digitMap = {
      '0': '০', '1': '১', '2': '২', '3': '৩', '4': '৪', '5': '৫', '6': '৬', '7': '৭', '8': '৮', '9': '৯'
    };

    String output = input;
    
    // Replace full words first
    monthMap.forEach((eng, bng) => output = output.replaceAll(eng, bng));
    dayMap.forEach((eng, bng) => output = output.replaceAll(eng, bng));
    digitMap.forEach((eng, bng) => output = output.replaceAll(eng, bng));
    
    return output;
  }

  Future<void> _getCurrentLocation() async {
    setState(() => _isLoading = true);
    try {
      LocationPermission permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
      }
      
      if (permission == LocationPermission.whileInUse || permission == LocationPermission.always) {
        Position position = await Geolocator.getCurrentPosition();
        setState(() {
          _currentPosition = position;
          _selectedCity = 'Auto';
        });
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(widget.isBangla ? "লোকেশন পেতে সমস্যা হয়েছে" : "Error getting location")),
      );
    } finally {
      setState(() => _isLoading = false);
    }
  }

  PrayerTimes _getPrayerTimes(DateTime date) {
    Coordinates coord = _selectedCity == 'Auto' && _currentPosition != null
        ? Coordinates(_currentPosition!.latitude, _currentPosition!.longitude)
        : _cities[_selectedCity]!;

    final params = CalculationMethod.karachi.getParameters();
    params.madhab = Madhab.hanafi;
    return PrayerTimes(coord, DateComponents.from(date), params);
  }

  @override
  Widget build(BuildContext context) {
    final primaryGreen = Colors.green.shade600;
    final prayerTimes = _getPrayerTimes(DateTime.now());

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 10.0),
        child: Column(
          children: [
            const SizedBox(height: 10), // Matched with Digital Tajbih page
            Card(
              elevation: 4,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
              color: widget.isDarkMode ? const Color(0xFF1E293B) : Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        DropdownButton<String>(
                          value: _selectedCity == 'Auto' ? null : _selectedCity,
                          hint: Text(widget.isBangla ? "অটো লোকেশন" : "Auto Location"),
                          underline: const SizedBox(),
                          items: _cities.keys.map((String city) {
                            return DropdownMenuItem(
                              value: city, 
                              child: Text(widget.isBangla ? _cityNamesBn[city]! : city)
                            );
                          }).toList(),
                          onChanged: (val) => setState(() {
                            _selectedCity = val!;
                            _currentPosition = null;
                          }),
                        ),
                        IconButton(
                          icon: Icon(Icons.my_location, color: primaryGreen),
                          onPressed: _getCurrentLocation,
                        ),
                      ],
                    ),
                    if (_isLoading) const LinearProgressIndicator(),
                    const Divider(),
                    Text(
                      _toBn(DateFormat('dd MMMM, yyyy').format(DateTime.now())),
                      style: TextStyle(fontWeight: FontWeight.bold, color: primaryGreen),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            _buildPrayerTile(widget.isBangla ? "ফজর" : "Fajr", prayerTimes.fajr, primaryGreen),
            _buildPrayerTile(widget.isBangla ? "সূর্যোদয়" : "Sunrise", prayerTimes.sunrise, Colors.orange),
            _buildPrayerTile(widget.isBangla ? "যোহর" : "Dhuhr", prayerTimes.dhuhr, primaryGreen),
            _buildPrayerTile(widget.isBangla ? "আসর" : "Asr", prayerTimes.asr, primaryGreen),
            _buildPrayerTile(widget.isBangla ? "মাগরিব" : "Maghrib", prayerTimes.maghrib, primaryGreen),
            _buildPrayerTile(widget.isBangla ? "এশা" : "Isha", prayerTimes.isha, primaryGreen),
            
            const SizedBox(height: 30),
            Text(
              widget.isBangla ? "আগামী ৭ দিনের সূচি" : "Next 7 Days Schedule",
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            _buildWeeklySchedule(primaryGreen),
          ],
        ),
      ),
    );
  }

  Widget _buildPrayerTile(String label, DateTime time, Color color) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 4),
      color: widget.isDarkMode ? const Color(0xFF1E293B) : Colors.white,
      child: ListTile(
        leading: Icon(Icons.access_time, color: color),
        title: Text(label, style: const TextStyle(fontWeight: FontWeight.w600)),
        trailing: Text(
          _toBn(DateFormat.jm().format(time)),
          style: TextStyle(color: color, fontWeight: FontWeight.bold, fontSize: 16),
        ),
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
        return ExpansionTile(
          title: Text(_toBn(DateFormat('EEEE, d MMMM').format(date))), // Full Day and Month name
          children: [
            _buildSmallTime(widget.isBangla ? "ফজর" : "Fajr", times.fajr),
            _buildSmallTime(widget.isBangla ? "যোহর" : "Dhuhr", times.dhuhr),
            _buildSmallTime(widget.isBangla ? "আসর" : "Asr", times.asr),
            _buildSmallTime(widget.isBangla ? "মাগরিব" : "Maghrib", times.maghrib),
            _buildSmallTime(widget.isBangla ? "এশা" : "Isha", times.isha),
          ],
        );
      },
    );
  }

  Widget _buildSmallTime(String label, DateTime time) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label),
          Text(_toBn(DateFormat.jm().format(time))),
        ],
      ),
    );
  }
}
