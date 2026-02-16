import 'dart:async';
import 'package:flutter/material.dart';
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
  bool _showCountdown = true;

  final Map<String, int> _cityAdjustments = {
    'Dhaka': 0,
    'Chattogram': -5,
    'Sylhet': -6,
    'Rajshahi': 7,
    'Khulna': 3,
    'Barisal': 1,
    'Rangpur': 6,
    'Mymensingh': -1
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

  final List<RamadanDay> _ramadanData = [
    RamadanDay(
        ramadan: 1,
        date: DateTime(2026, 2, 18),
        sehri: "05:15",
        iftar: "18:02"),
    RamadanDay(
        ramadan: 2,
        date: DateTime(2026, 2, 19),
        sehri: "05:14",
        iftar: "18:03"),
    RamadanDay(
        ramadan: 3,
        date: DateTime(2026, 2, 20),
        sehri: "05:13",
        iftar: "18:03"),
    RamadanDay(
        ramadan: 4,
        date: DateTime(2026, 2, 21),
        sehri: "05:12",
        iftar: "18:04"),
    RamadanDay(
        ramadan: 5,
        date: DateTime(2026, 2, 22),
        sehri: "05:11",
        iftar: "18:04"),
    RamadanDay(
        ramadan: 6,
        date: DateTime(2026, 2, 23),
        sehri: "05:10",
        iftar: "18:05"),
    RamadanDay(
        ramadan: 7,
        date: DateTime(2026, 2, 24),
        sehri: "05:09",
        iftar: "18:05"),
    RamadanDay(
        ramadan: 8,
        date: DateTime(2026, 2, 25),
        sehri: "05:08",
        iftar: "18:06"),
    RamadanDay(
        ramadan: 9,
        date: DateTime(2026, 2, 26),
        sehri: "05:07",
        iftar: "18:06"),
    RamadanDay(
        ramadan: 10,
        date: DateTime(2026, 2, 27),
        sehri: "05:06",
        iftar: "18:07"),
    RamadanDay(
        ramadan: 11,
        date: DateTime(2026, 2, 28),
        sehri: "05:05",
        iftar: "18:07"),
    RamadanDay(
        ramadan: 12,
        date: DateTime(2026, 3, 1),
        sehri: "05:04",
        iftar: "18:08"),
    RamadanDay(
        ramadan: 13,
        date: DateTime(2026, 3, 2),
        sehri: "05:03",
        iftar: "18:08"),
    RamadanDay(
        ramadan: 14,
        date: DateTime(2026, 3, 3),
        sehri: "05:02",
        iftar: "18:09"),
    RamadanDay(
        ramadan: 15,
        date: DateTime(2026, 3, 4),
        sehri: "05:01",
        iftar: "18:09"),
    RamadanDay(
        ramadan: 16,
        date: DateTime(2026, 3, 5),
        sehri: "05:00",
        iftar: "18:10"),
    RamadanDay(
        ramadan: 17,
        date: DateTime(2026, 3, 6),
        sehri: "04:59",
        iftar: "18:10"),
    RamadanDay(
        ramadan: 18,
        date: DateTime(2026, 3, 7),
        sehri: "04:58",
        iftar: "18:11"),
    RamadanDay(
        ramadan: 19,
        date: DateTime(2026, 3, 8),
        sehri: "04:57",
        iftar: "18:11"),
    RamadanDay(
        ramadan: 20,
        date: DateTime(2026, 3, 9),
        sehri: "04:56",
        iftar: "18:12"),
    RamadanDay(
        ramadan: 21,
        date: DateTime(2026, 3, 10),
        sehri: "04:55",
        iftar: "18:12"),
    RamadanDay(
        ramadan: 22,
        date: DateTime(2026, 3, 11),
        sehri: "04:54",
        iftar: "18:13"),
    RamadanDay(
        ramadan: 23,
        date: DateTime(2026, 3, 12),
        sehri: "04:53",
        iftar: "18:13"),
    RamadanDay(
        ramadan: 24,
        date: DateTime(2026, 3, 13),
        sehri: "04:52",
        iftar: "18:14"),
    RamadanDay(
        ramadan: 25,
        date: DateTime(2026, 3, 14),
        sehri: "04:51",
        iftar: "18:14"),
    RamadanDay(
        ramadan: 26,
        date: DateTime(2026, 3, 15),
        sehri: "04:50",
        iftar: "18:15"),
    RamadanDay(
        ramadan: 27,
        date: DateTime(2026, 3, 16),
        sehri: "04:49",
        iftar: "18:15"),
    RamadanDay(
        ramadan: 28,
        date: DateTime(2026, 3, 17),
        sehri: "04:48",
        iftar: "18:16"),
    RamadanDay(
        ramadan: 29,
        date: DateTime(2026, 3, 18),
        sehri: "04:47",
        iftar: "18:16"),
    RamadanDay(
        ramadan: 30,
        date: DateTime(2026, 3, 19),
        sehri: "04:46",
        iftar: "18:17"),
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
      textBn:
          "আমার বান্দারা যখন আমার সম্পর্কে তোমাকে জিজ্ঞাসা করে, আমি তো তাদের নিকটেই আছি।",
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
      textEn:
          "Allah does not charge a soul except [with that within] its capacity.",
      referenceBn: "সূরা আল-বাকারা: ২৮৬",
      referenceEn: "Surah Al-Baqarah: 286",
    ),
    QuranVerse(
      textBn:
          "আর তারা চক্রান্ত করে এবং আল্লাহও কৌশল করেন, আর আল্লাহই শ্রেষ্ঠ কৌশলী।",
      textEn:
          "And they planned, and Allah planned. And Allah is the best of planners.",
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
      textEn:
          "And that there is not for man except that [good] for which he strives.",
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
      textEn:
          "Whoever comes [on the Day of Judgment] with a good deed will have ten times the like thereof.",
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
      textEn:
          "Our Lord, give us in this world [that which is] good and in the Hereafter [that which is] good.",
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
      textEn:
          "And whoever fears Allah - He will make for him of his matter ease.",
      referenceBn: "সূরা আত-তালাক: ৪",
      referenceEn: "Surah At-Talaq: 4",
    ),
    QuranVerse(
      textBn: "আল্লাহর কাছে সবচেয়ে প্রিয় আমল হলো যা নিয়মিত করা হয়।",
      textEn:
          "The most beloved of deeds to Allah are those that are most consistent.",
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

    // Get First Day of Ramadan
    final DateTime firstRamadanDate = _ramadanData.first.date;
    // রমজান শুরুর ৩ দিন আগে
    final DateTime countdownStartDate = firstRamadanDate.subtract(const Duration(days: 3));
    final DateTime firstSehriTime = _parseTime(firstRamadanDate, _ramadanData.first.sehri, adj);

    // Get Last Day of Ramadan
    final RamadanDay lastRamadanData = _ramadanData.last;
    final DateTime lastIftarTime = _parseTime(lastRamadanData.date, lastRamadanData.iftar, adj);

    // CASE 1: Before Countdown (More than 3 days away)
    if (now.isBefore(countdownStartDate)) {
      _showCountdown = false;
      _nextEvent = widget.isBangla ? "রমজান শুরু হয়নি" : "Ramadan not started";
      _timeLeft = Duration.zero;
      return;
    }

    // CASE 2: Countdown Period (3 days before 1st Ramadan)
    if (now.isBefore(firstSehriTime)) {
      _showCountdown = true;
      _nextEvent = widget.isBangla ? "পবিত্র রমজানের বাকি" : "Ramadan Starts In";
      _timeLeft = firstSehriTime.difference(now);
      return;
    }

    // CASE 3: During Ramadan
    if (now.isBefore(lastIftarTime)) {
      _showCountdown = true;
      RamadanDay? todayData = _getTodayData();
      
      if (todayData != null) {
        DateTime sehriTime = _parseTime(todayData.date, todayData.sehri, adj);
        DateTime iftarTime = _parseTime(todayData.date, todayData.iftar, adj);

        if (now.isBefore(sehriTime)) {
          _nextEvent = widget.isBangla ? "সেহরির বাকি" : "Sehri Ends In";
          _timeLeft = sehriTime.difference(now);
        } else if (now.isBefore(iftarTime)) {
          _nextEvent = widget.isBangla ? "ইফতারের বাকি" : "Iftar Begins In";
          _timeLeft = iftarTime.difference(now);
        } else {
          // After Iftar, show countdown to tomorrow's Sehri
          final tomorrow = now.add(const Duration(days: 1));
          try {
            final tomorrowData = _ramadanData.firstWhere((d) =>
                d.date.year == tomorrow.year &&
                d.date.month == tomorrow.month &&
                d.date.day == tomorrow.day);
            DateTime nextSehri = _parseTime(tomorrowData.date, tomorrowData.sehri, adj);
            _nextEvent = widget.isBangla ? "সেহরির বাকি" : "Next Sehri In";
            _timeLeft = nextSehri.difference(now);
          } catch (_) {
            _nextEvent = widget.isBangla ? "রমজান শেষ" : "Ramadan Ended";
            _timeLeft = Duration.zero;
          }
        }
      }
      return;
    }

    // CASE 4: After Last Iftar (Eid)
    _showCountdown = true;
    _nextEvent = widget.isBangla ? "ঈদ মোবারক!" : "Eid Mubarak!";
    _timeLeft = Duration.zero;
  }

  RamadanDay? _getTodayData() {
    final now = DateTime.now();
    try {
      return _ramadanData.firstWhere((d) =>
          d.date.year == now.year &&
          d.date.month == now.month &&
          d.date.day == now.day);
    } catch (_) {
      return null;
    }
  }

  DateTime _parseTime(DateTime date, String timeStr, int adjMinutes) {
    final parts = timeStr.split(':');
    return DateTime(date.year, date.month, date.day, int.parse(parts[0]),
            int.parse(parts[1]))
        .add(Duration(minutes: adjMinutes));
  }

  String _toBn(String input) {
    if (!widget.isBangla) return input;
    final Map<String, String> conversionMap = {
      '0': '০',
      '1': '১',
      '2': '২',
      '3': '৩',
      '4': '৪',
      '5': '৫',
      '6': '৬',
      '7': '৭',
      '8': '৮',
      '9': '৯',
    };
    String output = input;
    for (var key in conversionMap.keys) {
      output = output.replaceAll(key, conversionMap[key]!);
    }
    return output;
  }

  String _formatDuration(Duration d) {
    if (d == Duration.zero && (_nextEvent.contains("Eid") || _nextEvent.contains("ঈদ"))) return "";
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
      backgroundColor:
          widget.isDarkMode ? const Color(0xFF0F172A) : Colors.white,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(24))),
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
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: 20),
              Flexible(
                child: LayoutBuilder(builder: (context, constraints) {
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
                            color: widget.selectedCity == city
                                ? Colors.green.shade600
                                : (widget.isDarkMode
                                    ? Colors.white10
                                    : Colors.grey.shade100),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          alignment: Alignment.center,
                          child: Text(
                            widget.isBangla ? _cityNamesBn[city]! : city,
                            style: TextStyle(
                                color: widget.selectedCity == city
                                    ? Colors.white
                                    : (widget.isDarkMode
                                        ? Colors.white70
                                        : Colors.black87),
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      );
                    }).toList(),
                  );
                }),
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
    final surfaceColor =
        widget.isDarkMode ? const Color(0xFF1E293B) : Colors.white;
    final textColor = widget.isDarkMode ? Colors.white : Colors.black87;
    final subtextColor = widget.isDarkMode ? Colors.white70 : Colors.black54;

    return LayoutBuilder(builder: (context, constraints) {
      final double maxWidth = constraints.maxWidth;
      final double horizontalPadding = (maxWidth * 0.05).clamp(16.0, 100.0);

      return Scaffold(
        backgroundColor: Colors.transparent,
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          padding:
              EdgeInsets.symmetric(horizontal: horizontalPadding, vertical: 16),
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 1000),
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
                            widget.isBangla
                                ? "আসসালামু আলাইকুম"
                                : "Assalamu Alaikum",
                            style: TextStyle(
                              color: primaryGreen,
                              fontSize: (maxWidth * 0.035).clamp(11.0, 14.0),
                              fontWeight: FontWeight.w600,
                              letterSpacing: 0.5,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            _getGreeting(),
                            style: TextStyle(
                              color: textColor,
                              fontSize: (maxWidth * 0.065).clamp(18.0, 24.0),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      InkWell(
                        onTap: _showLocationPicker,
                        child: Container(
                          padding: EdgeInsets.all((maxWidth * 0.025).clamp(8.0, 12.0)),
                          decoration: BoxDecoration(
                            color: primaryGreen.withOpacity(0.1),
                            shape: BoxShape.circle,
                          ),
                          child: Icon(Icons.location_on_outlined,
                              color: primaryGreen, size: (maxWidth * 0.055).clamp(18.0, 24.0)),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: (maxWidth * 0.04).clamp(10.0, 20.0)),

                  // Ramadan Card (Conditionally shown)
                  if (_showCountdown) ...[
                    _buildModernCountdownCard(primaryGreen, maxWidth),
                    SizedBox(height: (maxWidth * 0.04).clamp(10.0, 20.0)),
                  ],

                  // Today's Timing Section
                  _buildTodayScheduleSection(primaryGreen, surfaceColor, textColor, maxWidth),

                  SizedBox(height: (maxWidth * 0.05).clamp(12.0, 24.0)),

                  // Daily Inspiration Section
                  _buildDailyInspiration(
                      primaryGreen, surfaceColor, textColor, subtextColor, maxWidth),

                  SizedBox(height: (maxWidth * 0.05).clamp(12.0, 24.0)),

                  // Feature Grid Label
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        widget.isBangla
                            ? "প্রয়োজনীয় সেবা"
                            : "Essential Services",
                        style: TextStyle(
                          fontSize: (maxWidth * 0.04).clamp(14.0, 18.0),
                          fontWeight: FontWeight.bold,
                          color: textColor,
                        ),
                      ),
                      Icon(Icons.grid_view_rounded,
                          size: (maxWidth * 0.04).clamp(18.0, 22.0), color: subtextColor),
                    ],
                  ),
                  const SizedBox(height: 10),

                  // Responsive Feature Grid (3 columns as requested)
                  GridView.count(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    crossAxisCount: 3,
                    mainAxisSpacing: (maxWidth * 0.025).clamp(6.0, 10.0),
                    crossAxisSpacing: (maxWidth * 0.025).clamp(6.0, 10.0),
                    childAspectRatio: 0.95,
                    children: [
                      _buildModernFeatureCard(
                        widget.isBangla ? "নামাজের সময়" : "Prayer Times",
                        Icons.access_time_filled_rounded,
                        Colors.blue.shade700,
                        surfaceColor,
                        textColor,
                        () => widget.onNavigate(3),
                        maxWidth,
                      ),
                      _buildModernFeatureCard(
                        widget.isBangla
                            ? "রমজান ক্যালেন্ডার"
                            : "Ramadan Calendar",
                        Icons.calendar_month_rounded,
                        Colors.orange.shade700,
                        surfaceColor,
                        textColor,
                        () => widget.onNavigate(2),
                        maxWidth,
                      ),
                      _buildModernFeatureCard(
                        widget.isBangla ? "ডিজিটাল তাসবিহ" : "Digital Tasbih",
                        Icons.fingerprint_rounded,
                        primaryGreen,
                        surfaceColor,
                        textColor,
                        () => widget.onNavigate(1),
                        maxWidth,
                      ),
                      _buildModernFeatureCard(
                        widget.isBangla
                            ? "যাকাত ক্যালকুলেটর"
                            : "Zakat Calculator",
                        Icons.calculate_rounded,
                        Colors.teal.shade700,
                        surfaceColor,
                        textColor,
                        () => widget.onNavigate(5),
                        maxWidth,
                      ),
                      _buildModernFeatureCard(
                        widget.isBangla ? "ছোট দোয়া" : "Short Dua",
                        Icons.menu_book_rounded,
                        Colors.purple.shade700,
                        surfaceColor,
                        textColor,
                        () => widget.onNavigate(6),
                        maxWidth,
                      ),
                      _buildModernFeatureCard(
                        widget.isBangla ? "আল্লাহর নাম" : "99 Names",
                        Icons.auto_awesome_rounded,
                        Colors.amber.shade700,
                        surfaceColor,
                        textColor,
                        () => widget.onNavigate(4),
                        maxWidth,
                      ),
                    ],
                  ),
                  SizedBox(height: (maxWidth * 0.05).clamp(12.0, 24.0)),

                  // Ramadan Dua Section
                  _buildRamadanDuaSection(
                      primaryGreen, surfaceColor, textColor, subtextColor, maxWidth),

                  const SizedBox(height: 10),
                ],
              ),
            ),
          ),
        ),
      );
    });
  }

  Widget _buildModernCountdownCard(Color primaryGreen, double maxWidth) {
    final double cardPadding = (maxWidth * 0.045).clamp(12.0, 28.0);
    final double titleSize = (maxWidth * 0.03).clamp(9.0, 12.0);
    final double eventSize = (maxWidth * 0.035).clamp(13.0, 18.0);
    final double timeSize = (maxWidth * 0.09).clamp(26.0, 40.0);
    final double footerSize = (maxWidth * 0.03).clamp(9.0, 13.0);
    final double bgIconSize = (maxWidth * 0.3).clamp(70.0, 140.0);

    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        gradient: LinearGradient(
          colors: [primaryGreen, Colors.green.shade800],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        boxShadow: [
          BoxShadow(
            color: primaryGreen.withOpacity(0.2),
            blurRadius: 12,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Stack(
        children: [
          Positioned(
            right: -12,
            top: -12,
            child: Icon(
              _nextEvent.contains("Eid") || _nextEvent.contains("ঈদ") 
                  ? Icons.celebration_rounded 
                  : Icons.dark_mode_outlined,
              size: bgIconSize,
              color: Colors.white.withOpacity(0.1),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(cardPadding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                      decoration: BoxDecoration(
                        color: Colors.white10,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        widget.isBangla ? "রমজান ২০২৬" : "Ramadan 2026",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: titleSize,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: cardPadding * 0.4),
                Text(
                  _nextEvent,
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.9),
                    fontSize: eventSize,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 2),
                if (!_nextEvent.contains("Eid") && !_nextEvent.contains("ঈদ"))
                  FittedBox(
                    fit: BoxFit.scaleDown,
                    child: Text(
                      _formatDuration(_timeLeft),
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: timeSize,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.0,
                      ),
                    ),
                  )
                else
                  Text(
                    widget.isBangla ? "ঈদ মোবারক!" : "Eid Mubarak!",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: timeSize * 0.65,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                SizedBox(height: cardPadding * 0.4),
                InkWell(
                  onTap: _showLocationPicker,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        widget.isBangla
                            ? "${_cityNamesBn[widget.selectedCity]!}, বাংলাদেশ"
                            : "${widget.selectedCity}, Bangladesh",
                        style: TextStyle(
                          color: Colors.white.withOpacity(0.7),
                          fontSize: footerSize,
                        ),
                      ),
                      Icon(Icons.edit_location_alt_rounded,
                          color: Colors.white.withOpacity(0.7),
                          size: footerSize + 2),
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

  Widget _buildTodayScheduleSection(Color primaryGreen, Color surfaceColor, Color textColor, double maxWidth) {
    final today = _getTodayData();
    if (today == null) return const SizedBox.shrink();

    int adj = _cityAdjustments[widget.selectedCity] ?? 0;
    DateTime sehriTime = _parseTime(today.date, today.sehri, adj);
    DateTime iftarTime = _parseTime(today.date, today.iftar, adj);

    final String sehriStr = "${sehriTime.hour.toString().padLeft(2, '0')}:${sehriTime.minute.toString().padLeft(2, '0')}";
    final String iftarStr = "${iftarTime.hour.toString().padLeft(2, '0')}:${iftarTime.minute.toString().padLeft(2, '0')}";

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.isBangla ? "আজকের সময়সূচী" : "Today's Schedule",
          style: TextStyle(
            fontSize: (maxWidth * 0.04).clamp(15.0, 20.0),
            fontWeight: FontWeight.bold,
            color: textColor,
          ),
        ),
        const SizedBox(height: 10),
        Row(
          children: [
            Expanded(
              child: _buildTimeCard(
                widget.isBangla ? "সেহরির শেষ" : "Sehri Ends",
                _toBn(sehriStr),
                Icons.wb_twilight_rounded,
                Colors.orange.shade700,
                surfaceColor,
                textColor,
                maxWidth,
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: _buildTimeCard(
                widget.isBangla ? "ইফতার শুরু" : "Iftar Begins",
                _toBn(iftarStr),
                Icons.wb_sunny_rounded,
                Colors.deepOrange.shade700,
                surfaceColor,
                textColor,
                maxWidth,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildTimeCard(String label, String time, IconData icon, Color color, Color surface, Color text, double maxWidth) {
    final double padding = (maxWidth * 0.035).clamp(10.0, 18.0);
    final double iconSize = (maxWidth * 0.06).clamp(22.0, 28.0);
    final double labelSize = (maxWidth * 0.03).clamp(10.0, 13.0);
    final double timeSize = (maxWidth * 0.05).clamp(16.0, 22.0);

    return Container(
      padding: EdgeInsets.all(padding),
      decoration: BoxDecoration(
        color: surface,
        borderRadius: BorderRadius.circular(14),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(widget.isDarkMode ? 0.1 : 0.03),
            blurRadius: 8,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        children: [
          Icon(icon, color: color, size: iconSize),
          const SizedBox(height: 4),
          Text(label, 
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: labelSize, color: text.withOpacity(0.7))),
          const SizedBox(height: 1),
          FittedBox(
            fit: BoxFit.scaleDown,
            child: Text(time, style: TextStyle(fontSize: timeSize, fontWeight: FontWeight.bold, color: text)),
          ),
        ],
      ),
    );
  }

  Widget _buildDailyInspiration(Color primaryGreen, Color surfaceColor,
      Color textColor, Color subtextColor, double maxWidth) {
    final int dayIndex = (DateTime.now().day - 1) % _dailyVerses.length;
    final QuranVerse currentVerse = _dailyVerses[dayIndex];
    
    final double padding = (maxWidth * 0.045).clamp(14.0, 24.0);
    final double titleSize = (maxWidth * 0.035).clamp(12.0, 16.0);
    final double contentSize = (maxWidth * 0.04).clamp(13.0, 20.0);
    final double iconSize = (maxWidth * 0.065).clamp(22.0, 32.0);

    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(padding),
      decoration: BoxDecoration(
        color: surfaceColor,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: widget.isDarkMode
              ? Colors.white10
              : Colors.black.withOpacity(0.05),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(widget.isDarkMode ? 0.1 : 0.03),
            blurRadius: 10,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.format_quote_rounded, color: primaryGreen, size: iconSize),
              const SizedBox(width: 6),
              Text(
                widget.isBangla ? "আজকের অনুপ্রেরণা" : "Daily Inspiration",
                style: TextStyle(
                  color: primaryGreen,
                  fontSize: titleSize,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          SizedBox(height: padding * 0.4),
          Text(
            widget.isBangla
                ? "“${currentVerse.textBn}”"
                : "“${currentVerse.textEn}”",
            style: TextStyle(
              color: textColor,
              fontSize: contentSize,
              height: 1.3,
              fontWeight: FontWeight.w500,
              fontStyle: FontStyle.italic,
            ),
          ),
          const SizedBox(height: 6),
          Align(
            alignment: Alignment.centerRight,
            child: Text(
              widget.isBangla
                  ? currentVerse.referenceBn
                  : currentVerse.referenceEn,
              style: TextStyle(
                color: subtextColor,
                fontSize: titleSize * 0.8,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRamadanDuaSection(Color primaryGreen, Color surfaceColor,
      Color textColor, Color subtextColor, double maxWidth) {
    final bool isWide = maxWidth > 800;
    
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.isBangla ? "রমজানের দোয়া" : "Ramadan Dua",
          style: TextStyle(
            fontSize: (maxWidth * 0.04).clamp(15.0, 20.0),
            fontWeight: FontWeight.bold,
            color: textColor,
          ),
        ),
        const SizedBox(height: 10),
        if (isWide)
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: _buildDuaCard(
                    widget.isBangla ? "সেহরির দোয়া" : "Sehri Dua",
                    "নাওয়াইতু আন আছুমা গাদাম মিন শাহরি রামাদ্বানাল মুবারাকি ফারদাল্লাকা ইয়া আল্লাহু ফাতাক্বাব্বাল মিন্নি ইন্নাকা আনতাস সামিউল আলিম।",
                    widget.isBangla
                        ? "হে আল্লাহ! আমি আগামীকাল পবিত্র রমজান মাসের রোজা রাখার নিয়ত করলাম, যা আপনার পক্ষ থেকে ফরজ। সুতরাং আমার পক্ষ থেকে তা কবুল করুন। নিশ্চয়ই আপনি সর্বশ্রোতা ও সর্বজ্ঞ।"
                        : "O Allah! I intend to keep the fast tomorrow for the month of Ramadan, which is obligatory from You. So accept it from me. Indeed, You are the All-Hearing, the All-Knowing.",
                    primaryGreen,
                    surfaceColor,
                    textColor,
                    subtextColor,
                    maxWidth),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: _buildDuaCard(
                    widget.isBangla ? "ইফতারের দোয়া" : "Iftar Dua",
                    "আল্লাহুম্মা লাকা ছুমতু ওয়া তা'ওয়াক্কালতু আ'লা রিজকিকা ওয়া আফতারতু বি রাহমাতিকা ইয়া আর হামার রা-হিমীন।",
                    widget.isBangla
                        ? "হে আল্লাহ! আমি আপনার সন্তুষ্টির জন্য রোজা রেখেছি এবং আপনার ওপর ভরসা করেছি, আপনার দেওয়া রিজিক দিয়েই ইফতার করছি। আপনার দয়ার উসিলায়, হে শ্রেষ্ঠ দয়ালু।"
                        : "O Allah! I fasted for You and I put my trust in Your provision and I break my fast with Your mercy, O Most Merciful of the merciful.",
                    primaryGreen,
                    surfaceColor,
                    textColor,
                    subtextColor,
                    maxWidth),
              ),
            ],
          )
        else
          Column(
            children: [
              _buildDuaCard(
                  widget.isBangla ? "সেহরির দোয়া" : "Sehri Dua",
                  "নাওয়াইতু আন আছুমা গাদাম মিন শাহরি রামাদ্বানাল মুবারাকি ফারদাল্লাকা ইয়া আল্লাহু ফাতাক্বাব্বাল মিন্নি ইন্নাকা আনতাস সামিউল আলিম।",
                  widget.isBangla
                      ? "হে আল্লাহ! আমি আগামীকাল পবিত্র রমজান মাসের রোজা রাখার নিয়ত করলাম, যা আপনার পক্ষ থেকে ফরজ। সুতরাং আমার পক্ষ থেকে তা কবুল করুন। নিশ্চয়ই আপনি সর্বশ্রোতা ও সর্বজ্ঞ।"
                      : "O Allah! I intend to keep the fast tomorrow for the month of Ramadan, which is obligatory from You. So accept it from me. Indeed, You are the All-Hearing, the All-Knowing.",
                  primaryGreen,
                  surfaceColor,
                  textColor,
                  subtextColor,
                  maxWidth),
              const SizedBox(height: 10),
              _buildDuaCard(
                  widget.isBangla ? "ইফতারের দোয়া" : "Iftar Dua",
                  "আল্লাহুম্মা লাকা ছুমতু ওয়া তা'ওয়াক্কালতু আ'লা রিজকিকা ওয়া আফতারতু বি রাহমাতিকা ইয়া আর হামার রা-হিমীন।",
                  widget.isBangla
                      ? "হে আল্লাহ! আমি আপনার সন্তুষ্টির জন্য রোজা রেখেছি এবং আপনার ওপর ভরসা করেছি, আপনার দেওয়া রিজিক দিয়েই ইফতার করছি। আপনার দয়ার উসিলায়, হে শ্রেষ্ঠ দয়ালু।"
                      : "O Allah! I fasted for You and I put my trust in Your provision and I break my fast with Your mercy, O Most Merciful of the merciful.",
                  primaryGreen,
                  surfaceColor,
                  textColor,
                  subtextColor,
                  maxWidth),
            ],
          ),
      ],
    );
  }

  Widget _buildDuaCard(String title, String uccharon,
      String meaning, Color primary, Color surface, Color text, Color subtext, double maxWidth) {
    return LayoutBuilder(builder: (context, constraints) {
      final double cardWidth = constraints.maxWidth;
      final double padding = (cardWidth * 0.055).clamp(12.0, 22.0);
      final double labelSize = (cardWidth * 0.045).clamp(12.0, 16.0);

      return Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: surface,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
              color: widget.isDarkMode
                  ? Colors.white10
                  : Colors.black.withOpacity(0.05)),
          boxShadow: [
            BoxShadow(
                color: Colors.black.withOpacity(widget.isDarkMode ? 0.1 : 0.03),
                blurRadius: 8,
                offset: const Offset(0, 3)),
          ],
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            borderRadius: BorderRadius.circular(16),
            onTap: () => _showFullDuaDetail(
                context, title, meaning, primary, surface, text),
            child: Padding(
              padding: EdgeInsets.all(padding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                  color: primary.withOpacity(0.1),
                                  shape: BoxShape.circle),
                              child: Icon(Icons.star_rounded,
                                  color: primary, size: (cardWidth * 0.055).clamp(14.0, 20.0)),
                            ),
                            const SizedBox(width: 8),
                            Flexible(
                              child: Text(title,
                                  style: TextStyle(
                                      fontSize: labelSize,
                                      fontWeight: FontWeight.bold,
                                      color: primary)),
                            ),
                          ],
                        ),
                      ),
                      Icon(Icons.open_in_full_rounded, color: primary.withOpacity(0.5), size: 14),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Text(
                    uccharon,
                    style: TextStyle(
                      color: text.withOpacity(0.85),
                      fontSize: labelSize * 0.85,
                      height: 1.3,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        widget.isBangla ? "পুরো দোয়া ও অর্থ" : "Full Dua & Meaning",
                        style: TextStyle(
                          color: primary,
                          fontSize: labelSize * 0.7,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Icon(Icons.arrow_forward_ios_rounded, size: 9, color: primary),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    });
  }

  void _showFullDuaDetail(BuildContext context, String title, String meaning,
      Color primary, Color surface, Color text) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: surface,
        insetPadding: const EdgeInsets.all(20),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        titlePadding: const EdgeInsets.fromLTRB(16, 14, 6, 6),
        title: Row(
          children: [
            Icon(Icons.info_outline_rounded, color: primary, size: 20),
            const SizedBox(width: 8),
            Expanded(child: Text(title, style: TextStyle(color: text, fontWeight: FontWeight.bold, fontSize: 17))),
            IconButton(
              icon: const Icon(Icons.close, size: 18),
              onPressed: () => Navigator.pop(context),
            ),
          ],
        ),
        content: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildDetailSection(widget.isBangla ? "অর্থ" : "Meaning", meaning, primary, text),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildDetailSection(String label, String content, Color primary, Color text) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
          decoration: BoxDecoration(
            color: primary.withOpacity(0.1),
            borderRadius: BorderRadius.circular(5),
          ),
          child: Text(
            label,
            style: TextStyle(
              color: primary,
              fontWeight: FontWeight.bold,
              fontSize: 10,
              letterSpacing: 0.7,
            ),
          ),
        ),
        const SizedBox(height: 8),
        Text(
          content,
          style: TextStyle(
            color: text.withOpacity(0.9),
            fontSize: 14,
            height: 1.4,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }

  Widget _buildModernFeatureCard(
    String title,
    IconData icon,
    Color accentColor,
    Color surfaceColor,
    Color textColor,
    VoidCallback onTap,
    double maxWidth,
  ) {
    final double padding = (maxWidth * 0.025).clamp(6.0, 12.0);
    final double iconSize = (maxWidth * 0.06).clamp(22.0, 28.0);
    final double labelSize = (maxWidth * 0.03).clamp(10.0, 13.0);

    return Container(
      decoration: BoxDecoration(
        color: surfaceColor,
        borderRadius: BorderRadius.circular(14),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(widget.isDarkMode ? 0.1 : 0.03),
            blurRadius: 6,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(14),
          child: Padding(
            padding: EdgeInsets.all(padding),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Flexible(
                  child: Container(
                    padding: EdgeInsets.all(padding * 0.6),
                    decoration: BoxDecoration(
                      color: accentColor.withOpacity(0.1),
                      shape: BoxShape.circle,
                    ),
                    child: FittedBox(
                      child: Icon(icon, color: accentColor, size: iconSize),
                    ),
                  ),
                ),
                SizedBox(height: padding * 0.4),
                Text(
                  title,
                  textAlign: TextAlign.center,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: labelSize,
                    fontWeight: FontWeight.bold,
                    color: textColor,
                    height: 1.15,
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
