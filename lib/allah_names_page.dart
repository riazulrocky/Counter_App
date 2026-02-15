import 'package:flutter/material.dart';

class AllahName {
  final String nameEn;
  final String nameBn;
  final String arabic;
  final String meaningEn;
  final String meaningBn;

  const AllahName({
    required this.nameEn,
    required this.nameBn,
    required this.arabic,
    required this.meaningEn,
    required this.meaningBn,
  });
}

class AllahNamesPage extends StatelessWidget {
  final bool isDarkMode;
  final bool isBangla;

  const AllahNamesPage({
    super.key,
    required this.isDarkMode,
    required this.isBangla,
  });

  static const List<AllahName> _names = [
    AllahName(nameEn: "Ar-Rahman", nameBn: "আর-রাহমান", arabic: "الرحمن", meaningEn: "The Most Merciful", meaningBn: "পরম দয়াময়"),
    AllahName(nameEn: "Ar-Rahim", nameBn: "আর-রাহীম", arabic: "الرحيم", meaningEn: "The Especially Merciful", meaningBn: "অতি দয়ালু"),
    AllahName(nameEn: "Al-Malik", nameBn: "আল-মালিক", arabic: "الملك", meaningEn: "The King and Owner of Dominion", meaningBn: "রাজা ও সার্বভৌম"),
    AllahName(nameEn: "Al-Quddus", nameBn: "আল-কুদ্দুস", arabic: "القدوس", meaningEn: "The Absolutely Pure", meaningBn: "পরম পবিত্র"),
    AllahName(nameEn: "As-Salam", nameBn: "আস-সালাম", arabic: "السلام", meaningEn: "The Perfection and Giver of Peace", meaningBn: "শান্তির দাতা"),
    AllahName(nameEn: "Al-Mu'min", nameBn: "আল-মু'মিন", arabic: "المؤمن", meaningEn: "The Granter of Security and Faith", meaningBn: "বিশ্বাস ও নিরাপত্তার দাতা"),
    AllahName(nameEn: "Al-Muhaymin", nameBn: "আল-মুহাইমিন", arabic: "المهيمن", meaningEn: "The Guardian and Overseer", meaningBn: "রক্ষক ও তত্ত্বাবধায়ক"),
    AllahName(nameEn: "Al-Aziz", nameBn: "আল-আযীয", arabic: "العزيز", meaningEn: "The Almighty", meaningBn: "পরাক্রমশালী"),
    AllahName(nameEn: "Al-Jabbar", nameBn: "আল-জাব্বার", arabic: "الجبار", meaningEn: "The Compeller", meaningBn: "প্রবল"),
    AllahName(nameEn: "Al-Mutakabbir", nameBn: "আল-মুতাকাব্বির", arabic: "المتكبر", meaningEn: "The Supreme and Majestic", meaningBn: "সর্বোচ্চ ও মহিমাময়"),
    AllahName(nameEn: "Al-Khaliq", nameBn: "আল-খালিক", arabic: "الخالق", meaningEn: "The Creator", meaningBn: "সৃষ্টিকর্তা"),
    AllahName(nameEn: "Al-Bari", nameBn: "আল-বারী", arabic: "البارئ", meaningEn: "The Originator", meaningBn: "উদ্ভাবক"),
    AllahName(nameEn: "Al-Musawwir", nameBn: "আল-মুসাওওয়ির", arabic: "المصور", meaningEn: "The Fashioner", meaningBn: "আকৃতি দানকারী"),
    AllahName(nameEn: "Al-Ghaffar", nameBn: "আল-গাফফার", arabic: "الغفار", meaningEn: "The Great Forgiver", meaningBn: "মহান ক্ষমাকারী"),
    AllahName(nameEn: "Al-Qahhar", nameBn: "আল-কাহহার", arabic: "القهار", meaningEn: "The Subduer", meaningBn: "পরাক্রমশালী দমনকারী"),
    AllahName(nameEn: "Al-Wahhab", nameBn: "আল-ওয়াহহাব", arabic: "الوهاب", meaningEn: "The Bestower", meaningBn: "দাতা"),
    AllahName(nameEn: "Ar-Razzaq", nameBn: "আর-রাযযাক", arabic: "الرزاق", meaningEn: "The Provider", meaningBn: "রিজিক দাতা"),
    AllahName(nameEn: "Al-Fattah", nameBn: "আল-ফাত্তাহ", arabic: "الفتاح", meaningEn: "The Opener", meaningBn: "উন্মুক্তকারী"),
    AllahName(nameEn: "Al-Alim", nameBn: "আল-আলীম", arabic: "العليم", meaningEn: "The All-Knowing", meaningBn: "সর্বজ্ঞ"),
    AllahName(nameEn: "Al-Qabid", nameBn: "আল-কাবিদ", arabic: "القابض", meaningEn: "The Withholder", meaningBn: "সংকুচিতকারী"),
    AllahName(nameEn: "Al-Basit", nameBn: "আল-বাসিত", arabic: "الباسط", meaningEn: "The Extender", meaningBn: "প্রসারকারী"),
    AllahName(nameEn: "Al-Khafid", nameBn: "আল-খাফিদ", arabic: "الخافض", meaningEn: "The Abaser", meaningBn: "নিচুকারী"),
    AllahName(nameEn: "Ar-Rafi", nameBn: "আর-রাফি'", arabic: "الরাفع", meaningEn: "The Exalter", meaningBn: "উন্নয়নকারী"),
    AllahName(nameEn: "Al-Mu'izz", nameBn: "আল-মু'ইয্য", arabic: "المعز", meaningEn: "The Honorer", meaningBn: "সম্মান দাতা"),
    AllahName(nameEn: "Al-Mudhill", nameBn: "আল-মুযিল্ল", arabic: "المذل", meaningEn: "The Humiliator", meaningBn: "লাঞ্ছনাকারী"),
    AllahName(nameEn: "As-Sami", nameBn: "আস-সামী'", arabic: "السميع", meaningEn: "The All-Hearing", meaningBn: "সর্বশ্রোতা"),
    AllahName(nameEn: "Al-Basir", nameBn: "আল-বাসির", arabic: "البصير", meaningEn: "The All-Seeing", meaningBn: "সর্বদ্রষ্টা"),
    AllahName(nameEn: "Al-Hakam", nameBn: "আল-হাকাম", arabic: "الحكم", meaningEn: "The Judge", meaningBn: "বিচারক"),
    AllahName(nameEn: "Al-Adl", nameBn: "আল-আদল", arabic: "العدل", meaningEn: "The Just", meaningBn: "ন্যায়বান"),
    AllahName(nameEn: "Al-Latif", nameBn: "আল-লাতীফ", arabic: "اللطيف", meaningEn: "The Subtle", meaningBn: "কোমল"),
    AllahName(nameEn: "Al-Khabir", nameBn: "আল-খাবীর", arabic: "الخبير", meaningEn: "The All-Aware", meaningBn: "সবকিছু জানেন"),
    AllahName(nameEn: "Al-Halim", nameBn: "আল-হালীম", arabic: "الحليم", meaningEn: "The Forbearing", meaningBn: "ধৈর্যশীল"),
    AllahName(nameEn: "Al-Azim", nameBn: "আল-আযীম", arabic: "العظيم", meaningEn: "The Most Great", meaningBn: "মহান"),
    AllahName(nameEn: "Al-Ghafur", nameBn: "আল-গাফুর", arabic: "الغفور", meaningEn: "The Ever-Forgiving", meaningBn: "ক্ষমাশীল"),
    AllahName(nameEn: "Ash-Shakur", nameBn: "আশ-শাকুর", arabic: "الشكور", meaningEn: "The Appreciative", meaningBn: "কৃতজ্ঞতাপ্রদর্শনকারী"),
    AllahName(nameEn: "Al-Ali", nameBn: "আল-আলী", arabic: "العلي", meaningEn: "The Most High", meaningBn: "সর্বোচ্চ"),
    AllahName(nameEn: "Al-Kabir", nameBn: "আল-কাবীর", arabic: "الكبير", meaningEn: "The Great", meaningBn: "মহান"),
    AllahName(nameEn: "Al-Hafiz", nameBn: "আল-হাফিয", arabic: "الحفيظ", meaningEn: "The Preserver", meaningBn: "রক্ষক"),
    AllahName(nameEn: "Al-Muqit", nameBn: "আল-মুকীত", arabic: "المقيت", meaningEn: "The Nourisher", meaningBn: "পালনকর্তা"),
    AllahName(nameEn: "Al-Hasib", nameBn: "আল-হাসীব", arabic: "الحسيب", meaningEn: "The Reckoner", meaningBn: "হিসাব নেওয়ার মতো"),
    AllahName(nameEn: "Al-Jalil", nameBn: "আল-জালীল", arabic: "الجليل", meaningEn: "The Majestic", meaningBn: "মহিমাময়"),
    AllahName(nameEn: "Al-Karim", nameBn: "আল-কারীম", arabic: "الكريم", meaningEn: "The Generous", meaningBn: "উদার"),
    AllahName(nameEn: "Ar-Raqib", nameBn: "আর-রাকীব", arabic: "الرقيب", meaningEn: "The Watchful", meaningBn: "প্রহরী"),
    AllahName(nameEn: "Al-Mujib", nameBn: "আল-মুজীব", arabic: "المجيب", meaningEn: "The Responsive", meaningBn: "প্রতিক্রিয়াশীল"),
    AllahName(nameEn: "Al-Wasi", nameBn: "আল-ওয়াসি'", arabic: "الواسع", meaningEn: "The All-Encompassing", meaningBn: "সর্বব্যাপী"),
    AllahName(nameEn: "Al-Hakim", nameBn: "আল-হাকীম", arabic: "الحكيم", meaningEn: "The Wise", meaningBn: "প্রজ্ঞাময়"),
    AllahName(nameEn: "Al-Wadud", nameBn: "আল-ওয়াদুদ", arabic: "الودود", meaningEn: "The Loving", meaningBn: "প্রেমময়"),
    AllahName(nameEn: "Al-Majid", nameBn: "আল-মাজীদ", arabic: "المجيد", meaningEn: "The Glorious", meaningBn: "মহিমান্বিত"),
    AllahName(nameEn: "Al-Ba'ith", nameBn: "আল-বায়িস", arabic: "الباعث", meaningEn: "The Resurrector", meaningBn: "পুনরুত্থানকারী"),
    AllahName(nameEn: "Ash-Shahid", nameBn: "আশ-শাহীদ", arabic: "الشهيد", meaningEn: "The Witness", meaningBn: "সাক্ষী"),
    AllahName(nameEn: "Al-Haqq", nameBn: "আল-হক্ক", arabic: "الحق", meaningEn: "The Truth", meaningBn: "সত্য"),
    AllahName(nameEn: "Al-Wakil", nameBn: "আল-ওয়াকীল", arabic: "الوكيل", meaningEn: "The Trustee", meaningBn: "বিচারকর্তা"),
    AllahName(nameEn: "Al-Qawi", nameBn: "আল-ক্বাবী", arabic: "القوي", meaningEn: "The Strong", meaningBn: "শক্তিশালী"),
    AllahName(nameEn: "Al-Matin", nameBn: "আল-মাতীন", arabic: "المتين", meaningEn: "The Firm", meaningBn: "দৃঢ়"),
    AllahName(nameEn: "Al-Wali", nameBn: "আল-ওয়ালী", arabic: "الولي", meaningEn: "The Protecting Friend", meaningBn: "রক্ষাকারী বন্ধু"),
    AllahName(nameEn: "Al-Hamid", nameBn: "আল-হামীদ", arabic: "الحميد", meaningEn: "The Praiseworthy", meaningBn: "প্রশংসনীয়"),
    AllahName(nameEn: "Al-Muhsi", nameBn: "আল-মুহসী", arabic: "المحصي", meaningEn: "The Accounter", meaningBn: "গণনাকারী"),
    AllahName(nameEn: "Al-Mubdi", nameBn: "আল-মুবদী", arabic: "المبدئ", meaningEn: "The Originator", meaningBn: "উৎপাদক"),
    AllahName(nameEn: "Al-Mu'id", nameBn: "আল-মু'ঈদ", arabic: "المعيد", meaningEn: "The Restorer", meaningBn: "পুনরুদ্ধারকারী"),
    AllahName(nameEn: "Al-Muhyi", nameBn: "আল-মুহ্যী", arabic: "المحيي", meaningEn: "The Giver of Life", meaningBn: "জীবন দাতা"),
    AllahName(nameEn: "Al-Mumit", nameBn: "আল-মুমীত", arabic: "المميت", meaningEn: "The Bringer of Death", meaningBn: "মৃত্যু দাতা"),
    AllahName(nameEn: "Al-Hayy", nameBn: "আল-হাইয়্য", arabic: "الحي", meaningEn: "The Ever-Living", meaningBn: "চিরঞ্জীব"),
    AllahName(nameEn: "Al-Qayyum", nameBn: "আল-ক্বাইয়্যুম", arabic: "القيوم", meaningEn: "The Self-Subsisting", meaningBn: "স্বয়ংসম্পূর্ণ"),
    AllahName(nameEn: "Al-Wajid", nameBn: "আল-ওয়াজিদ", arabic: "الواجد", meaningEn: "The Finder", meaningBn: "অন্বেষক"),
    AllahName(nameEn: "Al-Majid", nameBn: "আল-মাজীদ", arabic: "الماجد", meaningEn: "The Noble", meaningBn: "মহান"),
    AllahName(nameEn: "Al-Wahid", nameBn: "আল-ওয়াহিদ", arabic: "الواحد", meaningEn: "The One", meaningBn: "একক"),
    AllahName(nameEn: "Al-Ahad", nameBn: "আল-আহাদ", arabic: "الأحد", meaningEn: "The Unique", meaningBn: "অদ্বিতীয়"),
    AllahName(nameEn: "As-Samad", nameBn: "আস-সামাদ", arabic: "الصمد", meaningEn: "The Self-Sufficient", meaningBn: "অনন্য"),
    AllahName(nameEn: "Al-Qadir", nameBn: "আল-ক্বাদির", arabic: "القادر", meaningEn: "The Capable", meaningBn: "সক্ষম"),
    AllahName(nameEn: "Al-Muqtadir", nameBn: "আল-মুকতাদির", arabic: "المقتدر", meaningEn: "The Powerful", meaningBn: "পরাক্রমশালী"),
    AllahName(nameEn: "Al-Muqaddim", nameBn: "আল-মুকাদ্দিম", arabic: "المقدم", meaningEn: "The Expediter", meaningBn: "অগ্রগামী"),
    AllahName(nameEn: "Al-Mu'akhkhir", nameBn: "আল-মু'আখখির", arabic: "المؤخر", meaningEn: "The Delayer", meaningBn: "বিলম্বকারী"),
    AllahName(nameEn: "Al-Awwal", nameBn: "আল-আওয়াল", arabic: "الأول", meaningEn: "The First", meaningBn: "প্রথম"),
    AllahName(nameEn: "Al-Akhir", nameBn: "আল-আখির", arabic: "الآخر", meaningEn: "The Last", meaningBn: "শেষ"),
    AllahName(nameEn: "Az-Zahir", nameBn: "আয-যাহির", arabic: "الظاهر", meaningEn: "The Apparent", meaningBn: "প্রকাশ্য"),
    AllahName(nameEn: "Al-Batin", nameBn: "আল-বাতিন", arabic: "الباطন", meaningEn: "The Hidden", meaningBn: "গুপ্ত"),
    AllahName(nameEn: "Al-Wali", nameBn: "আল-ওয়ালী", arabic: "الوالي", meaningEn: "The Governor", meaningBn: "শাসক"),
    AllahName(nameEn: "Al-Muta'ali", nameBn: "আল-মুতাআলী", arabic: "المتعالي", meaningEn: "The Most Exalted", meaningBn: "সর্বোচ্চ"),
    AllahName(nameEn: "Al-Barr", nameBn: "আল-বার্র", arabic: "البر", meaningEn: "The Source of Goodness", meaningBn: "কল্যাণের উৎস"),
    AllahName(nameEn: "At-Tawwab", nameBn: "আত-তাওয়াব", arabic: "التواب", meaningEn: "The Accepting of Repentance", meaningBn: "তওবা গ্রহণকারী"),
    AllahName(nameEn: "Al-Muntaqim", nameBn: "আল-মুনতাকিম", arabic: "المنتقم", meaningEn: "The Avenger", meaningBn: "প্রতিশোধ নেওয়ার মতো"),
    AllahName(nameEn: "Al-Afuw", nameBn: "আল-আফুও", arabic: "العفو", meaningEn: "The Pardoner", meaningBn: "ক্ষমাকারী"),
    AllahName(nameEn: "Ar-Ra'uf", nameBn: "আর-রাউফ", arabic: "الرؤوف", meaningEn: "The Kind", meaningBn: "দয়ালু"),
    AllahName(nameEn: "Malik ul-Mulk", nameBn: "মালিকুল মুলক", arabic: "مالك الملك", meaningEn: "Owner of Sovereignty", meaningBn: "রাজত্বের মালিক"),
    AllahName(nameEn: "Dhul-Jalali wal-Ikram", nameBn: "যুল জালালি ওয়াল ইকরাম", arabic: "ذو الجلال والإكرام", meaningEn: "Possessor of Majesty and Honor", meaningBn: "মহিমা ও সম্মানের অধিকারী"),
    AllahName(nameEn: "Al-Muqsit", nameBn: "আল-মুকসিত", arabic: "المقسط", meaningEn: "The Equitable", meaningBn: "ন্যায়পরায়ণ"),
    AllahName(nameEn: "Al-Jami", nameBn: "আল-জামি'", arabic: "الجامع", meaningEn: "The Gatherer", meaningBn: "সমাবেশকারী"),
    AllahName(nameEn: "Al-Ghani", nameBn: "আল-গানী", arabic: "الغني", meaningEn: "The Self-Sufficient", meaningBn: "অনন্য"),
    AllahName(nameEn: "Al-Mughni", nameBn: "আল-মুগনী", arabic: "المغني", meaningEn: "The Enricher", meaningBn: "সমৃদ্ধকারী"),
    AllahName(nameEn: "Al-Mani", nameBn: "আল-মানি'", arabic: "المانع", meaningEn: "The Withholder", meaningBn: "নিবারক"),
    AllahName(nameEn: "Ad-Darr", nameBn: "আদ-দার্র", arabic: "الضار", meaningEn: "The Harmful", meaningBn: "ক্ষতিসাধক"),
    AllahName(nameEn: "An-Nafi", nameBn: "আন-নাফি'", arabic: "النافع", meaningEn: "The Beneficent", meaningBn: "কল্যাণকারী"),
    AllahName(nameEn: "An-Nur", nameBn: "আন-নুর", arabic: "النور", meaningEn: "The Light", meaningBn: "আলো"),
    AllahName(nameEn: "Al-Hadi", nameBn: "আল-হাদী", arabic: "الهادي", meaningEn: "The Guide", meaningBn: "পথপ্রদর্শক"),
    AllahName(nameEn: "Al-Badi", nameBn: "আল-বাদি'", arabic: "البديع", meaningEn: "The Incomparable", meaningBn: "অতুলনীয়"),
    AllahName(nameEn: "Al-Baqi", nameBn: "আল-বাকী", arabic: "الباقي", meaningEn: "The Everlasting", meaningBn: "চিরস্থায়ী"),
    AllahName(nameEn: "Al-Warith", nameBn: "আল-ওয়ারিস", arabic: "الوارث", meaningEn: "The Inheritor", meaningBn: "উত্তরাধিকারী"),
    AllahName(nameEn: "Ar-Rashid", nameBn: "আর-রশীদ", arabic: "الرشيد", meaningEn: "The Rightly Guided", meaningBn: "সঠিক পথপ্রদর্শক"),
    AllahName(nameEn: "As-Sabur", nameBn: "আস-সাবুর", arabic: "الصبور", meaningEn: "The Patient", meaningBn: "ধৈর্যশীল"),
  ];

  @override
  Widget build(BuildContext context) {
    final primaryGreen = Colors.green.shade600;
    final surfaceColor = isDarkMode ? const Color(0xFF1E293B) : Colors.white;
    final textColor = isDarkMode ? Colors.white : Colors.black87;
    final subtextColor = isDarkMode ? Colors.white70 : Colors.black54;
    final scaffoldBg = isDarkMode ? const Color(0xFF0F172A) : const Color(0xFFF8FAFC);

    return Scaffold(
      backgroundColor: scaffoldBg,
      body: LayoutBuilder(
        builder: (context, constraints) {
          final crossAxisCount = constraints.maxWidth > 900 ? 3 : (constraints.maxWidth > 600 ? 2 : 1);
          return GridView.builder(
            padding: const EdgeInsets.all(16),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: crossAxisCount,
              mainAxisSpacing: 12,
              crossAxisSpacing: 12,
              mainAxisExtent: 110,
            ),
            itemCount: _names.length,
            itemBuilder: (context, index) {
              final n = _names[index];
              return Container(
                decoration: BoxDecoration(
                  color: surfaceColor,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(isDarkMode ? 0.2 : 0.05),
                      blurRadius: 10,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                    borderRadius: BorderRadius.circular(20),
                    onTap: () => _showNameDetail(context, n, index + 1, primaryGreen, surfaceColor, textColor, subtextColor),
                    child: Padding(
                      padding: const EdgeInsets.all(12),
                      child: Row(
                        children: [
                          Container(
                            width: 40,
                            height: 40,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: primaryGreen.withOpacity(0.1),
                              shape: BoxShape.circle,
                            ),
                            child: Text(
                              "${index + 1}",
                              style: TextStyle(
                                color: primaryGreen,
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                              ),
                            ),
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  n.arabic,
                                  style: TextStyle(
                                    color: primaryGreen,
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'serif',
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  isBangla ? n.nameBn : n.nameEn,
                                  style: TextStyle(
                                    color: textColor,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Icon(Icons.arrow_forward_ios_rounded, size: 14, color: subtextColor.withOpacity(0.5)),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
          );
        }
      ),
    );
  }

  void _showNameDetail(BuildContext context, AllahName n, int index, Color primary, Color surface, Color text, Color subtext) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: surface,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
        contentPadding: const EdgeInsets.all(24),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: primary.withOpacity(0.1),
                shape: BoxShape.circle,
              ),
              child: Text(
                n.arabic,
                style: TextStyle(
                  color: primary,
                  fontSize: 48,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 20),
            Text(
              isBangla ? n.nameBn : n.nameEn,
              style: TextStyle(
                color: text,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 12),
            const Divider(),
            const SizedBox(height: 12),
            Text(
              isBangla ? "অর্থ:" : "Meaning:",
              style: TextStyle(color: primary, fontWeight: FontWeight.bold, fontSize: 16),
            ),
            const SizedBox(height: 8),
            Text(
              isBangla ? n.meaningBn : n.meaningEn,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: text,
                fontSize: 18,
                height: 1.5,
              ),
            ),
            const SizedBox(height: 24),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => Navigator.pop(context),
                style: ElevatedButton.styleFrom(
                  backgroundColor: primary,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                ),
                child: Text(isBangla ? "ঠিক আছে" : "Close"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
