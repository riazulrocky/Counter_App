import 'dart:async';
import 'package:flutter/material.dart';
import 'allah_names_page.dart';
import 'ramadan_page.dart';

class QuranVerse {
  final String textBn;
  final String textEn;
  final String referenceBn;
  final String referenceEn;

  const QuranVerse({
    required this.textBn,
    required this.textEn,
    required this.referenceBn,
    required this.referenceEn,
  });
}

class HomePage extends StatefulWidget {
  final bool isDarkMode;
  final bool isBangla;
  final String selectedCity;
  final Function(String) onLocationChanged;
  final Function(int) onNavigate;

  const HomePage({
    super.key,
    required this.isDarkMode,
    required this.isBangla,
    required this.selectedCity,
    required this.onLocationChanged,
    required this.onNavigate,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Timer _timer;
  Duration _timeLeft = Duration.zero;
  String _nextEvent = "";

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

  final List<QuranVerse> _dailyVerses = const [
    QuranVerse(
      textBn: "নিশ্চয়ই কষ্টের সাথেই স্বস্তি রয়েছে।",
      textEn: "Indeed, with hardship [will be] ease.",
      referenceBn: "সূরা ইনশিরাহ্: ৫",
      referenceEn: "Surah Ash-Sharh: 5",
    ),
    QuranVerse(
      textBn: "তোমরা আমাকে স্মরণ করো, আমিও তোমাদের স্মরণ করব।",
      textEn: "Remember Me; I will remember you.",
      referenceBn: "সূরা আল-বাকারা: ১৫২",
      referenceEn: "Surah Al-Baqarah: 152",
    ),
    QuranVerse(
      textBn: "আর আল্লাহ তোমাদের যা দিয়েছেন তার জন্য আনন্দিত হয়ো।",
      textEn: "And be grateful for the graces of Allah.",
      referenceBn: "সূরা আন-নাহল: ১১৪",
      referenceEn: "Surah An-Nahl: 114",
    ),
    QuranVerse(
      textBn: "নিশ্চয়ই আল্লাহ ধৈর্যশীলদের সাথে আছেন।",
      textEn: "Indeed, Allah is with the patient.",
      referenceBn: "সূরা আল-বাকারা: ১৫৩",
      referenceEn: "Surah Al-Baqarah: 153",
    ),
    QuranVerse(
      textBn: "আমার বান্দারা যখন আমার সম্পর্কে তোমাকে জিজ্ঞাসা করে, আমি তো তাদের নিকটেই আছি।",
      textEn: "When My servants ask you concerning Me, indeed I am near.",
      referenceBn: "সূরা আল-বাকারা: ১৮৬",
      referenceEn: "Surah Al-Baqarah: 186",
    ),
    QuranVerse(
      textBn: "তিনিই তোমাদের জন্য পৃথিবীকে সুগম করেছেন।",
      textEn: "It is He who made the earth tame for you.",
      referenceBn: "সূরা আল-মূলক: ১৫",
      referenceEn: "Surah Al-Mulk: 15",
    ),
    QuranVerse(
      textBn: "আল্লাহ কোনো প্রাণীকে তার সাধ্যের বাইরে কষ্ট দেন না।",
      textEn: "Allah does not charge a soul except [with that within] its capacity.",
      referenceBn: "সূরা আল-বাকারা: ২৮৬",
      referenceEn: "Surah Al-Baqarah: 286",
    ),
    QuranVerse(
      textBn: "আর তারা চক্রান্ত করে এবং আল্লাহও কৌশল করেন, আর আল্লাহই শ্রেষ্ঠ কৌশলী।",
      textEn: "And they planned, and Allah planned. And Allah is the best of planners.",
      referenceBn: "সূরা আল-ইমরান: ৫৪",
      referenceEn: "Surah Al-Imran: 54",
    ),
    QuranVerse(
      textBn: "আল্লাহর রহমত থেকে নিরাশ হয়ো না।",
      textEn: "Do not despair of the mercy of Allah.",
      referenceBn: "সূরা আজ-জুমার: ৫৩",
      referenceEn: "Surah Az-Zumar: 53",
    ),
    QuranVerse(
      textBn: "নিশ্চয়ই সালাত অশ্লীল ও মন্দ কাজ থেকে বিরত রাখে।",
      textEn: "Indeed, prayer prohibits immorality and wrongdoing.",
      referenceBn: "সূরা আল-আনকাবুত: ৪৫",
      referenceEn: "Surah Al-Ankabut: 45",
    ),
    QuranVerse(
      textBn: "তোমরা সত্যকে মিথ্যার সাথে মিশ্রিত করো না।",
      textEn: "And do not mix the truth with falsehood.",
      referenceBn: "সূরা আল-বাকারা: ৪২",
      referenceEn: "Surah Al-Baqarah: 42",
    ),
    QuranVerse(
      textBn: "আল্লাহ যাকে ইচ্ছা অপরিমিত রিযিক দান করেন।",
      textEn: "Allah gives provision to whom He wills without account.",
      referenceBn: "সূরা আল-বাকারা: ২১২",
      referenceEn: "Surah Al-Baqarah: 212",
    ),
    QuranVerse(
      textBn: "তোমরা মুমিন না হওয়া পর্যন্ত জান্নাতে প্রবেশ করতে পারবে না।",
      textEn: "You will not enter Paradise until you believe.",
      referenceBn: "সহীহ মুসলিম (হাদিস)",
      referenceEn: "Sahih Muslim (Hadith)",
    ),
    QuranVerse(
      textBn: "আর যে আল্লাহকে ভয় করে, তিনি তার জন্য নিষ্কৃতির পথ করে দেন।",
      textEn: "And whoever fears Allah - He will make for him a way out.",
      referenceBn: "সূরা আত-তালাক: ২",
      referenceEn: "Surah At-Talaq: 2",
    ),
    QuranVerse(
      textBn: "মানুষের জন্য তাই রয়েছে যা সে চেষ্টা করে।",
      textEn: "And that there is not for man except that [good] for which he strives.",
      referenceBn: "সূরা আন-নাজম: ৩৯",
      referenceEn: "Surah An-Najm: 39",
    ),
    QuranVerse(
      textBn: "নিশ্চয়ই আল্লাহ তাওবাকারীদের ভালোবাসেন।",
      textEn: "Indeed, Allah loves those who are constantly repentant.",
      referenceBn: "সূরা আল-বাকারা: ২২২",
      referenceEn: "Surah Al-Baqarah: 222",
    ),
    QuranVerse(
      textBn: "আর তোমরা একে অপরের গীবত করো না।",
      textEn: "And do not spy or backbite each other.",
      referenceBn: "সূরা আল-হুজুরাত: ১২",
      referenceEn: "Surah Al-Hujurat: 12",
    ),
    QuranVerse(
      textBn: "যে ব্যক্তি একটি ভালো কাজ করল, সে তার দশগুণ পাবে।",
      textEn: "Whoever comes [on the Day of Judgment] with a good deed will have ten times the like thereof.",
      referenceBn: "সূরা আল-আনআম: ১৬০",
      referenceEn: "Surah Al-An'am: 160",
    ),
    QuranVerse(
      textBn: "বলুন, সত্য এসেছে এবং মিথ্যা বিলুপ্ত হয়েছে।",
      textEn: "Say, 'Truth has come, and falsehood has departed.'",
      referenceBn: "সূরা আল-ইসরা: ৮১",
      referenceEn: "Surah Al-Isra: 81",
    ),
    QuranVerse(
      textBn: "আল্লাহ সুন্দর এবং তিনি সৌন্দর্যকে পছন্দ করেন।",
      textEn: "Allah is beautiful and He loves beauty.",
      referenceBn: "সহীহ মুসলিম (হাদিস)",
      referenceEn: "Sahih Muslim (Hadith)",
    ),
    QuranVerse(
      textBn: "তোমরা একে অপরের সম্পদ অন্যায়ভাবে গ্রাস করো না।",
      textEn: "And do not consume one another's wealth unjustly.",
      referenceBn: "সূরা আল-বাকারা: ১৮৮",
      referenceEn: "Surah Al-Baqarah: 188",
    ),
    QuranVerse(
      textBn: "আর তোমরা আল্লাহর রশিকে শক্তভাবে আঁকড়ে ধরো।",
      textEn: "And hold firmly to the rope of Allah all together.",
      referenceBn: "সূরা আল-ইমরান: ১০৩",
      referenceEn: "Surah Al-Imran: 103",
    ),
    QuranVerse(
      textBn: "নিশ্চয়ই আল্লাহ অতিশয় ক্ষমাশীল, পরম দয়ালু।",
      textEn: "Indeed, Allah is Forgiving and Merciful.",
      referenceBn: "সূরা আন-নিসা: ১১০",
      referenceEn: "Surah An-Nisa: 110",
    ),
    QuranVerse(
      textBn: "আর নামাজ কায়েম করো এবং যাকাত দাও।",
      textEn: "And establish prayer and give zakah.",
      referenceBn: "সূরা আল-বাকারা: ৪৩",
      referenceEn: "Surah Al-Baqarah: 43",
    ),
    QuranVerse(
      textBn: "হে আমাদের পালনকর্তা, আমাদের দুনিয়া ও আখিরাতে কল্যাণ দান করুন।",
      textEn: "Our Lord, give us in this world [that which is] good and in the Hereafter [that which is] good.",
      referenceBn: "সূরা আল-বাকারা: ২০১",
      referenceEn: "Surah Al-Baqarah: 201",
    ),
    QuranVerse(
      textBn: "সবচেয়ে উত্তম ব্যক্তি সে যে অন্য মানুষের কল্যাণ করে।",
      textEn: "The best of people are those who are most beneficial to people.",
      referenceBn: "সহীহ জামে (হাদিস)",
      referenceEn: "Sahih Jami' (Hadith)",
    ),
    QuranVerse(
      textBn: "যে আল্লাহকে ভয় করে, আল্লাহ তার কাজ সহজ করে দেন।",
      textEn: "And whoever fears Allah - He will make for him of his matter ease.",
      referenceBn: "সূরা আত-তালাক: ৪",
      referenceEn: "Surah At-Talaq: 4",
    ),
    QuranVerse(
      textBn: "আল্লাহর কাছে সবচেয়ে প্রিয় আমল হলো যা নিয়মিত করা হয়।",
      textEn: "The most beloved of deeds to Allah are those that are most consistent.",
      referenceBn: "সহীহ বুখারী (হাদিস)",
      referenceEn: "Sahih Bukhari (Hadith)",
    ),
    QuranVerse(
      textBn: "নিশ্চয়ই মুমিনরা একে অপরের ভাই।",
      textEn: "The believers are but brothers.",
      referenceBn: "সূরা আল-হুজুরাত: ১০",
      referenceEn: "Surah Al-Hujurat: 10",
    ),
    QuranVerse(
      textBn: "তোমরা বড় আশা নিয়ে আল্লাহর কাছে প্রার্থনা করো।",
      textEn: "And call upon Him in fear and aspiration.",
      referenceBn: "সূরা আল-আরাফ: ৫৬",
      referenceEn: "Surah Al-A'raf: 56",
    ),
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
    int adj = _cityAdjustments[widget.selectedCity] ?? 0;

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
              Flexible(
                child: LayoutBuilder(
                  builder: (context, constraints) {
                    final crossAxisCount = constraints.maxWidth > 600 ? 4 : 2;
                    return GridView.count(
                      shrinkWrap: true,
                      crossAxisCount: crossAxisCount,
                      childAspectRatio: 3,
                      children: _cityNamesBn.keys.map((city) {
                        return InkWell(
                          onTap: () {
                            widget.onLocationChanged(city);
                            Navigator.pop(context);
                          },
                          child: Container(
                            margin: const EdgeInsets.all(4),
                            decoration: BoxDecoration(
                              color: widget.selectedCity == city ? Colors.green.shade600 : (widget.isDarkMode ? Colors.white10 : Colors.grey.shade100),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            alignment: Alignment.center,
                            child: Text(
                              widget.isBangla ? _cityNamesBn[city]! : city,
                              style: TextStyle(color: widget.selectedCity == city ? Colors.white : (widget.isDarkMode ? Colors.white70 : Colors.black87), fontWeight: FontWeight.bold),
                            ),
                          ),
                        );
                      }).toList(),
                    );
                  }
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
    final surfaceColor = widget.isDarkMode ? const Color(0xFF1E293B) : Colors.white;
    final textColor = widget.isDarkMode ? Colors.white : Colors.black87;
    final subtextColor = widget.isDarkMode ? Colors.white70 : Colors.black54;

    return LayoutBuilder(
      builder: (context, constraints) {
        final double maxWidth = constraints.maxWidth;
        final bool isTablet = maxWidth > 600;
        final double horizontalPadding = isTablet ? maxWidth * 0.1 : 20.0;

        return Scaffold(
          backgroundColor: Colors.transparent,
          body: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            padding: EdgeInsets.symmetric(horizontal: horizontalPadding, vertical: 16),
            child: Center(
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 800),
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
                        InkWell(
                          onTap: _showLocationPicker,
                          child: Container(
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: primaryGreen.withOpacity(0.1),
                              shape: BoxShape.circle,
                            ),
                            child: Icon(Icons.location_on_outlined, color: primaryGreen, size: 24),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 24),
                    
                    // Ramadan Card
                    _buildModernCountdownCard(primaryGreen, isTablet),
                    
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
                    
                    // Responsive Feature Grid
                    GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: maxWidth > 900 ? 6 : (maxWidth > 600 ? 4 : 3),
                        mainAxisSpacing: 12,
                        crossAxisSpacing: 12,
                        childAspectRatio: 0.82,
                      ),
                      itemCount: 6,
                      itemBuilder: (context, index) {
                        final features = [
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
                            widget.isBangla ? "তাসবিহ" : "Tasbih",
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
                            widget.isBangla ? "নামাজ" : "Prayers",
                            Icons.access_time_filled_rounded,
                            Colors.blue.shade700,
                            surfaceColor,
                            textColor,
                            () => widget.onNavigate(3),
                          ),
                          _buildModernFeatureCard(
                            widget.isBangla ? "যাকাত" : "Zakat",
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
                        ];
                        return features[index];
                      },
                    ),
                    const SizedBox(height: 10),
                  ],
                ),
              ),
            ),
          ),
        );
      }
    );
  }

  Widget _buildModernCountdownCard(Color primaryGreen, bool isTablet) {
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
              size: isTablet ? 150 : 100,
              color: Colors.white.withOpacity(0.1),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(isTablet ? 32 : 24),
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
                SizedBox(height: isTablet ? 24 : 16),
                Text(
                  _nextEvent,
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.9),
                    fontSize: isTablet ? 20 : 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  _formatDuration(_timeLeft),
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: isTablet ? 48 : 36,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.5,
                  ),
                ),
                SizedBox(height: isTablet ? 24 : 16),
                InkWell(
                  onTap: _showLocationPicker,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        widget.isBangla ? "${_cityNamesBn[widget.selectedCity]!}, বাংলাদেশ" : "${widget.selectedCity}, Bangladesh",
                        style: TextStyle(
                          color: Colors.white.withOpacity(0.7),
                          fontSize: isTablet ? 14 : 12,
                        ),
                      ),
                      Icon(Icons.edit_location_alt_rounded, color: Colors.white.withOpacity(0.7), size: isTablet ? 18 : 14),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDailyInspiration(Color primaryGreen, Color surfaceColor, Color textColor, Color subtextColor) {
    final int dayIndex = (DateTime.now().day - 1) % _dailyVerses.length;
    final QuranVerse currentVerse = _dailyVerses[dayIndex];

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
            widget.isBangla ? "“${currentVerse.textBn}”" : "“${currentVerse.textEn}”",
            style: TextStyle(
              color: textColor,
              fontSize: 15,
              height: 1.5,
              fontWeight: FontWeight.w500,
              fontStyle: FontStyle.italic,
            ),
          ),
          const SizedBox(height: 8),
          Align(
            alignment: Alignment.centerRight,
            child: Text(
              widget.isBangla ? currentVerse.referenceBn : currentVerse.referenceEn,
              style: TextStyle(
                color: subtextColor,
                fontSize: 12,
                fontWeight: FontWeight.bold,
              ),
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
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(widget.isDarkMode ? 0.2 : 0.04),
            blurRadius: 8,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(16),
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: accentColor.withOpacity(0.1),
                    shape: BoxShape.circle,
                    border: Border.all(color: accentColor.withOpacity(0.1), width: 1),
                  ),
                  child: Icon(icon, color: accentColor, size: 22),
                ),
                const SizedBox(height: 10),
                Text(
                  title,
                  textAlign: TextAlign.center,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 12,
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
