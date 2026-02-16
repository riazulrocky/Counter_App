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
    AllahName(nameEn: "Al-Malik", nameBn: "আল-মালিক", arabic: "الملك", meaningEn: "The King and Owner of Dominion", meaningBn: "রাজত্ব ও সার্বভৌমত্বের অধিকারী"),
    AllahName(nameEn: "Al-Quddus", nameBn: "আল-কুদ্দুস", arabic: "القدوس", meaningEn: "The Absolutely Pure", meaningBn: "পরম পবিত্র"),
    AllahName(nameEn: "As-Salam", nameBn: "আস-সালাম", arabic: "السلام", meaningEn: "The Giver of Peace", meaningBn: "শান্তির দাতা"),
    AllahName(nameEn: "Al-Mu'min", nameBn: "আল-মু'মিন", arabic: "المؤمن", meaningEn: "The Giver of Faith", meaningBn: "বিশ্বাস ও নিরাপত্তার দাতা"),
    AllahName(nameEn: "Al-Muhaymin", nameBn: "আল-মুহাইমিন", arabic: "المهيمن", meaningEn: "The Overseer", meaningBn: "রক্ষক ও তত্ত্বাবধায়ক"),
    AllahName(nameEn: "Al-Aziz", nameBn: "আল-আযীয", arabic: "العزيز", meaningEn: "The Almighty", meaningBn: "পরাক্রমশালী"),
    AllahName(nameEn: "Al-Jabbar", nameBn: "আল-জাব্বার", arabic: "الجبار", meaningEn: "The Compeller", meaningBn: "প্রবল"),
    AllahName(nameEn: "Al-Mutakabbir", nameBn: "Al-Mutakabbir", arabic: "المتكبر", meaningEn: "The Supreme", meaningBn: "সর্বোচ্চ ও মহিমাময়"),
    AllahName(nameEn: "Al-Khaliq", nameBn: "Al-Khaliq", arabic: "الخالق", meaningEn: "The Creator", meaningBn: "সৃষ্টিকর্তা"),
    AllahName(nameEn: "Al-Bari", nameBn: "Al-Bari", arabic: "البارئ", meaningEn: "The Originator", meaningBn: "উদ্ভাবক"),
    AllahName(nameEn: "Al-Musawwir", nameBn: "Al-Musawwir", arabic: "المصور", meaningEn: "The Fashioner", meaningBn: "আকৃতি দানকারী"),
    AllahName(nameEn: "Al-Ghaffar", nameBn: "Al-Ghaffar", arabic: "الغفار", meaningEn: "The Great Forgiver", meaningBn: "মহান ক্ষমাকারী"),
    AllahName(nameEn: "Al-Qahhar", nameBn: "Al-Qahhar", arabic: "القهار", meaningEn: "The Subduer", meaningBn: "পরাক্রমশালী দমনকারী"),
    AllahName(nameEn: "Al-Wahhab", nameBn: "Al-Wahhab", arabic: "الوهاب", meaningEn: "The Bestower", meaningBn: "দাতা"),
    AllahName(nameEn: "Ar-Razzaq", nameBn: "Ar-Razzaq", arabic: "الرزاق", meaningEn: "The Provider", meaningBn: "রিজিক দাতা"),
    AllahName(nameEn: "Al-Fattah", nameBn: "Al-Fattah", arabic: "الفتاح", meaningEn: "The Opener", meaningBn: "উন্মুক্তকারী"),
    AllahName(nameEn: "Al-Alim", nameBn: "Al-Alim", arabic: "العليم", meaningEn: "The All-Knowing", meaningBn: "সর্বজ্ঞ"),
    AllahName(nameEn: "Al-Qabid", nameBn: "Al-Qabid", arabic: "القابض", meaningEn: "The Withholder", meaningBn: "সংকুচিতকারী"),
    AllahName(nameEn: "Al-Basit", nameBn: "Al-Basit", arabic: "الباسط", meaningEn: "The Extender", meaningBn: "প্রসারকারী"),
    AllahName(nameEn: "Al-Khafid", nameBn: "Al-Khafid", arabic: "الخافض", meaningEn: "The Abaser", meaningBn: "নিচুকারী"),
    AllahName(nameEn: "Ar-Rafi", nameBn: "Ar-Rafi'", arabic: "الরাفع", meaningEn: "The Exalter", meaningBn: "উন্নয়নকারী"),
    AllahName(nameEn: "Al-Mu'iz", nameBn: "Al-Mu'iz", arabic: "المعز", meaningEn: "The Honorer", meaningBn: "সম্মান দাতা"),
    AllahName(nameEn: "Al-Mudhill", nameBn: "Al-Mudhill", arabic: "المذل", meaningEn: "The Humiliator", meaningBn: "লাঞ্ছনাকারী"),
    AllahName(nameEn: "As-Sami", nameBn: "As-Sami'", arabic: "السميع", meaningEn: "The All-Hearing", meaningBn: "সর্বশ্রোতা"),
    AllahName(nameEn: "Al-Basir", nameBn: "Al-Basir", arabic: "البصير", meaningEn: "The All-Seeing", meaningBn: "সর্বদ্রষ্টা"),
    AllahName(nameEn: "Al-Hakam", nameBn: "Al-Hakam", arabic: "الحكم", meaningEn: "The Judge", meaningBn: "বিচারক"),
    AllahName(nameEn: "Al-Adl", nameBn: "Al-Adl", arabic: "العدل", meaningEn: "The Just", meaningBn: "ন্যায়বান"),
    AllahName(nameEn: "Al-Latif", nameBn: "Al-Latif", arabic: "اللطيف", meaningEn: "The Subtle", meaningBn: "কোমল"),
    AllahName(nameEn: "Al-Khabir", nameBn: "Al-Khabir", arabic: "الخبير", meaningEn: "The All-Aware", meaningBn: "সবকিছু জানেন"),
    AllahName(nameEn: "Al-Halim", nameBn: "Al-Halim", arabic: "الحليم", meaningEn: "The Forbearing", meaningBn: "ধৈর্যশীল"),
    AllahName(nameEn: "Al-Azim", nameBn: "Al-Azim", arabic: "العظيم", meaningEn: "The Most Great", meaningBn: "মহান"),
    AllahName(nameEn: "Al-Ghafur", nameBn: "Al-Ghafur", arabic: "الغفور", meaningEn: "The Ever-Forgiving", meaningBn: "ক্ষমাশীল"),
    AllahName(nameEn: "Ash-Shakur", nameBn: "Ash-Shakur", arabic: "الشكور", meaningEn: "The Appreciative", meaningBn: "কৃতজ্ঞতাপ্রদর্শনকারী"),
    AllahName(nameEn: "Al-Ali", nameBn: "Al-Ali", arabic: "العلي", meaningEn: "The Most High", meaningBn: "সর্বোচ্চ"),
    AllahName(nameEn: "Al-Kabir", nameBn: "Al-Kabir", arabic: "الكبير", meaningEn: "The Great", meaningBn: "মহান"),
    AllahName(nameEn: "Al-Hafiz", nameBn: "Al-Hafiz", arabic: "الحفيظ", meaningEn: "The Preserver", meaningBn: "রক্ষক"),
    AllahName(nameEn: "Al-Muqit", nameBn: "Al-Muqit", arabic: "المقيت", meaningEn: "The Nourisher", meaningBn: "পালনকর্তা"),
    AllahName(nameEn: "Al-Hasib", nameBn: "Al-Hasib", arabic: "الحسيب", meaningEn: "The Reckoner", meaningBn: "হিসাব গ্রহণকারী"),
    AllahName(nameEn: "Al-Jalil", nameBn: "Al-Jalil", arabic: "الجليل", meaningEn: "The Majestic", meaningBn: "মহিমাময়"),
    AllahName(nameEn: "Al-Karim", nameBn: "Al-Karim", arabic: "الكريم", meaningEn: "The Generous", meaningBn: "উদার"),
    AllahName(nameEn: "Ar-Raqib", nameBn: "Ar-Raqib", arabic: "الرقيب", meaningEn: "The Watchful", meaningBn: "প্রহরী"),
    AllahName(nameEn: "Al-Mujib", nameBn: "Al-Mujib", arabic: "المجيب", meaningEn: "The Responsive", meaningBn: "প্রতিক্রিয়াশীল"),
    AllahName(nameEn: "Al-Wasi", nameBn: "Al-Wasi'", arabic: "الواسع", meaningEn: "The All-Encompassing", meaningBn: "সর্বব্যাপী"),
    AllahName(nameEn: "Al-Hakim", nameBn: "Al-Hakim", arabic: "الحكيم", meaningEn: "The Wise", meaningBn: "প্রজ্ঞাময়"),
    AllahName(nameEn: "Al-Wadud", nameBn: "Al-Wadud", arabic: "الودود", meaningEn: "The Loving", meaningBn: "প্রেমময়"),
    AllahName(nameEn: "Al-Majid", nameBn: "Al-Majid", arabic: "المجيد", meaningEn: "The Glorious", meaningBn: "মহিমান্বিত"),
    AllahName(nameEn: "Al-Ba'ith", nameBn: "Al-Ba'ith", arabic: "الباعث", meaningEn: "The Resurrector", meaningBn: "পুনরুত্থানকারী"),
    AllahName(nameEn: "Ash-Shahid", nameBn: "Ash-Shahid", arabic: "الشهيد", meaningEn: "The Witness", meaningBn: "সাক্ষী"),
    AllahName(nameEn: "Al-Haqq", nameBn: "Al-Haqq", arabic: "الحق", meaningEn: "The Truth", meaningBn: "সত্য"),
    AllahName(nameEn: "Al-Wakil", nameBn: "Al-Wakil", arabic: "الوكيل", meaningEn: "The Trustee", meaningBn: "বিচারকর্তা"),
    AllahName(nameEn: "Al-Qawi", nameBn: "Al-Qawi", arabic: "القوي", meaningEn: "The Strong", meaningBn: "শক্তিশালী"),
    AllahName(nameEn: "Al-Matin", nameBn: "Al-Matin", arabic: "المتين", meaningEn: "The Firm", meaningBn: "দৃঢ়"),
    AllahName(nameEn: "Al-Wali", nameBn: "Al-Wali", arabic: "الولي", meaningEn: "The Protecting Friend", meaningBn: "রক্ষাকারী বন্ধু"),
    AllahName(nameEn: "Al-Hamid", nameBn: "Al-Hamid", arabic: "الحميد", meaningEn: "The Praiseworthy", meaningBn: "প্রশংসনীয়"),
    AllahName(nameEn: "Al-Muhsi", nameBn: "Al-Muhsi", arabic: "المحصي", meaningEn: "The Accounter", meaningBn: "গণনাকারী"),
    AllahName(nameEn: "Al-Mubdi", nameBn: "Al-Mubdi", arabic: "المبدئ", meaningEn: "The Originator", meaningBn: "উৎপাদক"),
    AllahName(nameEn: "Al-Mu'id", nameBn: "Al-Mu'id", arabic: "المعيد", meaningEn: "The Restorer", meaningBn: "পুনরুদ্ধারকারী"),
    AllahName(nameEn: "Al-Muhyi", nameBn: "Al-Muhyi", arabic: "المحيي", meaningEn: "The Giver of Life", meaningBn: "জীবন দাতা"),
    AllahName(nameEn: "Al-Mumit", nameBn: "Al-Mumit", arabic: "المميت", meaningEn: "The Bringer of Death", meaningBn: "মৃত্যু দাতা"),
    AllahName(nameEn: "Al-Hayy", nameBn: "Al-Hayy", arabic: "الحي", meaningEn: "The Ever-Living", meaningBn: "চিরঞ্জীব"),
    AllahName(nameEn: "Al-Qayyum", nameBn: "Al-Qayyum", arabic: "القيوم", meaningEn: "The Self-Subsisting", meaningBn: "স্বয়ংসম্পূর্ণ"),
    AllahName(nameEn: "Al-Wajid", nameBn: "Al-Wajid", arabic: "الواجد", meaningEn: "The Finder", meaningBn: "অন্বেষক"),
    AllahName(nameEn: "Al-Majid", nameBn: "Al-Majid", arabic: "الماجد", meaningEn: "The Noble", meaningBn: "মহান"),
    AllahName(nameEn: "Al-Wahid", nameBn: "Al-Wahid", arabic: "الواحد", meaningEn: "The One", meaningBn: "একক"),
    AllahName(nameEn: "Al-Ahad", nameBn: "Al-Ahad", arabic: "الأحد", meaningEn: "The Unique", meaningBn: "অদ্বিতীয়"),
    AllahName(nameEn: "As-Samad", nameBn: "As-Samad", arabic: "الصمد", meaningEn: "The Self-Sufficient", meaningBn: "অনন্য"),
    AllahName(nameEn: "Al-Qadir", nameBn: "Al-Qadir", arabic: "القادر", meaningEn: "The Capable", meaningBn: "সক্ষম"),
    AllahName(nameEn: "Al-Muqtadir", nameBn: "Al-Muqtadir", arabic: "المقتدر", meaningEn: "The Powerful", meaningBn: "পরাক্রমশালী"),
    AllahName(nameEn: "Al-Muqaddim", nameBn: "Al-Muqaddim", arabic: "المقدم", meaningEn: "The Expediter", meaningBn: "অগ্রগামী"),
    AllahName(nameEn: "Al-Mu'akhkhir", nameBn: "Al-Mu'akhkhir", arabic: "المؤخر", meaningEn: "The Delayer", meaningBn: "বিলম্বকারী"),
    AllahName(nameEn: "Al-Awwal", nameBn: "Al-Awwal", arabic: "الأول", meaningEn: "The First", meaningBn: "প্রথম"),
    AllahName(nameEn: "Al-Akhir", nameBn: "Al-Akhir", arabic: "الآخر", meaningEn: "The Last", meaningBn: "শেষ"),
    AllahName(nameEn: "Az-Zahir", nameBn: "Az-Zahir", arabic: "الظاهر", meaningEn: "The Apparent", meaningBn: "প্রকাশ্য"),
    AllahName(nameEn: "Al-Batin", nameBn: "Al-Batin", arabic: "الباطن", meaningEn: "The Hidden", meaningBn: "গুপ্ত"),
    AllahName(nameEn: "Al-Wali", nameBn: "Al-Wali", arabic: "الوالي", meaningEn: "The Governor", meaningBn: "শাসক"),
    AllahName(nameEn: "Al-Muta'ali", nameBn: "Al-Muta'ali", arabic: "المتعالي", meaningEn: "The Most Exalted", meaningBn: "সর্বোচ্চ"),
    AllahName(nameEn: "Al-Barr", nameBn: "Al-Barr", arabic: "البر", meaningEn: "The Source of Goodness", meaningBn: "কল্যাণের উৎস"),
    AllahName(nameEn: "At-Tawwab", nameBn: "At-Tawwab", arabic: "التواب", meaningEn: "The Accepting of Repentance", meaningBn: "তওবা গ্রহণকারী"),
    AllahName(nameEn: "Al-Muntaqim", nameBn: "Al-Muntaqim", arabic: "المنتقم", meaningEn: "The Avenger", meaningBn: "প্রতিশোধ নেওয়ার মতো"),
    AllahName(nameEn: "Al-Afuw", nameBn: "Al-Afuw", arabic: "العفو", meaningEn: "The Pardoner", meaningBn: "ক্ষমাকারী"),
    AllahName(nameEn: "Ar-Ra'uf", nameBn: "Ar-Ra'uf", arabic: "الرؤوف", meaningEn: "The Kind", meaningBn: "দয়ালু"),
    AllahName(nameEn: "Malik ul-Mulk", nameBn: "Malik ul-Mulk", arabic: "مالك الملك", meaningEn: "Owner of Sovereignty", meaningBn: "রাজত্বের মালিক"),
    AllahName(nameEn: "Dhul-Jalali wal-Ikram", nameBn: "Dhul-Jalali wal-Ikram", arabic: "ذو الجلال والإكرام", meaningEn: "Possessor of Majesty and Honor", meaningBn: "মহিমা ও সম্মানের অধিকারী"),
    AllahName(nameEn: "Al-Muqsit", nameBn: "Al-Muqsit", arabic: "المقسط", meaningEn: "The Equitable", meaningBn: "ন্যায়পরায়ণ"),
    AllahName(nameEn: "Al-Jami", nameBn: "Al-Jami'", arabic: "الجامع", meaningEn: "The Gatherer", meaningBn: "সমাবেশকারী"),
    AllahName(nameEn: "Al-Ghani", nameBn: "Al-Ghani", arabic: "الغني", meaningEn: "The Self-Sufficient", meaningBn: "অনন্য"),
    AllahName(nameEn: "Al-Mughni", nameBn: "Al-Mughni", arabic: "المغني", meaningEn: "The Enricher", meaningBn: "সমৃদ্ধকারী"),
    AllahName(nameEn: "Al-Mani", nameBn: "Al-Mani'", arabic: "الমানع", meaningEn: "The Withholder", meaningBn: "নিবারক"),
    AllahName(nameEn: "Ad-Darr", nameBn: "Ad-Darr", arabic: "الضار", meaningEn: "The Harmful", meaningBn: "ক্ষতিসাধক"),
    AllahName(nameEn: "An-Nafi", nameBn: "An-Nafi'", arabic: "النافع", meaningEn: "The Beneficent", meaningBn: "কল্যাণকারী"),
    AllahName(nameEn: "An-Nur", nameBn: "An-Nur", arabic: "النور", meaningEn: "The Light", meaningBn: "আলো"),
    AllahName(nameEn: "Al-Hadi", nameBn: "Al-Hadi", arabic: "الهادي", meaningEn: "The Guide", meaningBn: "পথপ্রদর্শক"),
    AllahName(nameEn: "Al-Badi", nameBn: "Al-Badi'", arabic: "البديع", meaningEn: "The Incomparable", meaningBn: "অতুলনীয়"),
    AllahName(nameEn: "Al-Baqi", nameBn: "Al-Baqi", arabic: "الباقی", meaningEn: "The Everlasting", meaningBn: "চিরস্থায়ী"),
    AllahName(nameEn: "Al-Warith", nameBn: "Al-Warith", arabic: "الوارث", meaningEn: "The Inheritor", meaningBn: "উত্তরাধিকারী"),
    AllahName(nameEn: "Ar-Rashid", nameBn: "Ar-Rashid", arabic: "الرشيد", meaningEn: "The Rightly Guided", meaningBn: "সঠিক পথপ্রদর্শক"),
    AllahName(nameEn: "As-Sabur", nameBn: "As-Sabur", arabic: "الصبور", meaningEn: "The Patient", meaningBn: "ধৈর্যশীল"),
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
          final double maxWidth = constraints.maxWidth;
          final crossAxisCount = maxWidth > 900 ? 3 : (maxWidth > 600 ? 2 : 1);
          final double padding = (maxWidth * 0.035).clamp(10.0, 16.0);

          return GridView.builder(
            padding: EdgeInsets.all(padding),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: crossAxisCount,
              mainAxisSpacing: 8,
              crossAxisSpacing: 8,
              mainAxisExtent: (maxWidth * 0.22).clamp(70.0, 85.0),
            ),
            itemCount: _names.length,
            itemBuilder: (context, index) {
              final n = _names[index];
              return Container(
                decoration: BoxDecoration(
                  color: surfaceColor,
                  borderRadius: BorderRadius.circular(14),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(isDarkMode ? 0.15 : 0.03),
                      blurRadius: 6,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  child: Row(
                    children: [
                      Container(
                        width: (maxWidth * 0.07).clamp(28.0, 36.0),
                        height: (maxWidth * 0.07).clamp(28.0, 36.0),
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
                            fontSize: (maxWidth * 0.03).clamp(10.0, 12.0),
                          ),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              n.arabic,
                              style: TextStyle(
                                color: primaryGreen,
                                fontSize: (maxWidth * 0.042).clamp(15.0, 19.0),
                                fontWeight: FontWeight.bold,
                                fontFamily: 'serif',
                              ),
                            ),
                            const SizedBox(height: 1),
                            Text(
                              isBangla ? n.nameBn : n.nameEn,
                              style: TextStyle(
                                color: textColor,
                                fontSize: (maxWidth * 0.032).clamp(11.0, 13.0),
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            const SizedBox(height: 1),
                            Text(
                              isBangla ? n.meaningBn : n.meaningEn,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                color: subtextColor,
                                fontSize: (maxWidth * 0.028).clamp(9.0, 11.0),
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        }
      ),
    );
  }
}
