import 'package:flutter/material.dart';

class DoaData {
  final String titleBn;
  final String titleEn;
  final String arabic;
  final String meaningBn;
  final String meaningEn;
  final String category;

  const DoaData({
    required this.titleBn,
    required this.titleEn,
    required this.arabic,
    required this.meaningBn,
    required this.meaningEn,
    required this.category,
  });
}

class DoaPage extends StatelessWidget {
  final bool isDarkMode;
  final bool isBangla;

  const DoaPage({
    super.key,
    required this.isDarkMode,
    required this.isBangla,
  });

  static const List<DoaData> _doas = [
    DoaData(
      titleBn: "ঘুম থেকে ওঠার দোয়া",
      titleEn: "Dua after waking up",
      arabic: "الْحَمْدُ للهِ الَّذِي أَحْيَانَا بَعْدَ مَا أَمَاتَنَا وَإِلَيْهِ النُّشُورُ",
      meaningBn: "সব প্রশংসা আল্লাহর জন্য, যিনি আমাদের মৃত (নিদ্রা) হওয়ার পর জীবিত করলেন এবং তাঁর দিকেই পুনরুত্থান।",
      meaningEn: "All praise is for Allah who gave us life after causing us to die and to Him is the resurrection.",
      category: "Daily",
    ),
    DoaData(
      titleBn: "খাওয়ার আগের দোয়া",
      titleEn: "Dua before eating",
      arabic: "بِسْمِ اللهِ",
      meaningBn: "আল্লাহর নামে (শুরু করছি)।",
      meaningEn: "In the name of Allah.",
      category: "Food",
    ),
    DoaData(
      titleBn: "মসজিদে প্রবেশের দোয়া",
      titleEn: "Dua for entering Mosque",
      arabic: "اللَّهُمَّ افْتَحْ لِي أَبْوَابَ رَحْمَتِكَ",
      meaningBn: "হে আল্লাহ! আমার জন্য আপনার রহমতের দরজাগুলো খুলে দিন।",
      meaningEn: "O Allah, open the gates of Your mercy for me.",
      category: "Mosque",
    ),
    DoaData(
      titleBn: "পিতা-মাতার জন্য দোয়া",
      titleEn: "Dua for Parents",
      arabic: "رَّبِّ ارْحَمْهُمَا كَمَا رَبَّيَانِي صَغِيرًا",
      meaningBn: "হে আমার পালনকর্তা! তাদের উভয়ের প্রতি রহম করুন, যেমন তারা আমাকে শৈশবে লালন-পালন করেছেন।",
      meaningEn: "My Lord, have mercy upon them as they brought me up [when I was] small.",
      category: "Family",
    ),
    DoaData(
      titleBn: "ক্ষমা প্রার্থনার দোয়া",
      titleEn: "Dua for Forgiveness",
      arabic: "رَبَّنَا ظَلَمْنَا أَنفُسَنَا وَإِن لَّمْ تَغْفِرْ لَنَا وَتَرْحَمْنَا لَنَكُونَنَّ مِنَ الْخَاسِرِينَ",
      meaningBn: "হে আমাদের পালনকর্তা! আমরা নিজেদের প্রতি জুলুম করেছি। যদি আপনি আমাদের ক্ষমা না করেন এবং আমাদের প্রতি রহম না করেন, তবে আমরা অবশ্যই ক্ষতিগ্রস্তদের অন্তর্ভুক্ত হব।",
      meaningEn: "Our Lord, we have wronged ourselves, and if You do not forgive us and have mercy upon us, we will surely be among the losers.",
      category: "Repentance",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final primaryGreen = Colors.green.shade600;
    final surfaceColor = isDarkMode ? const Color(0xFF1E293B) : Colors.white;
    final textColor = isDarkMode ? Colors.white : Colors.black87;
    final subtextColor = isDarkMode ? Colors.white70 : Colors.black54;

    return Scaffold(
      backgroundColor: isDarkMode ? const Color(0xFF0F172A) : const Color(0xFFF8FAFC),
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: Colors.transparent,
        iconTheme: IconThemeData(color: isDarkMode ? Colors.white : primaryGreen),
        title: Text(
          isBangla ? "প্রয়োজনীয় দোয়া" : "Essential Doas",
          style: TextStyle(
            color: isDarkMode ? Colors.white : primaryGreen,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: _doas.length,
        itemBuilder: (context, index) {
          final doa = _doas[index];
          return Container(
            margin: const EdgeInsets.only(bottom: 16),
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
            child: Theme(
              data: Theme.of(context).copyWith(
                dividerColor: Colors.transparent,
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
              ),
              child: ExpansionTile(
                leading: Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: primaryGreen.withOpacity(0.1),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(Icons.menu_book_rounded, color: primaryGreen, size: 24),
                ),
                title: Text(
                  isBangla ? doa.titleBn : doa.titleEn,
                  style: TextStyle(
                    color: textColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                subtitle: Text(
                  doa.category,
                  style: TextStyle(color: subtextColor, fontSize: 12),
                ),
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        const Divider(),
                        const SizedBox(height: 12),
                        Text(
                          doa.arabic,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: primaryGreen,
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'serif',
                          ),
                        ),
                        const SizedBox(height: 16),
                        Text(
                          isBangla ? "অর্থ:" : "Meaning:",
                          style: TextStyle(color: textColor, fontWeight: FontWeight.bold, fontSize: 14),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          isBangla ? doa.meaningBn : doa.meaningEn,
                          style: TextStyle(
                            color: subtextColor,
                            fontSize: 15,
                            height: 1.5,
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
      ),
    );
  }
}
