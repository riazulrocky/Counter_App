import 'package:flutter/material.dart';

class DoaData {
  final String titleBn;
  final String titleEn;
  final String arabic;
  final String uccharonBn;
  final String uccharonEn;
  final String meaningBn;
  final String meaningEn;
  final String categoryBn;
  final String categoryEn;

  const DoaData({
    required this.titleBn,
    required this.titleEn,
    required this.arabic,
    required this.uccharonBn,
    required this.uccharonEn,
    required this.meaningBn,
    required this.meaningEn,
    required this.categoryBn,
    required this.categoryEn,
  });
}

class DoaPage extends StatefulWidget {
  final bool isDarkMode;
  final bool isBangla;

  const DoaPage({
    super.key,
    required this.isDarkMode,
    required this.isBangla,
  });

  @override
  State<DoaPage> createState() => _DoaPageState();
}

class _DoaPageState extends State<DoaPage> {
  String _searchQuery = "";
  String _selectedCategory = "All";

  static const List<DoaData> _allDoas = [
    DoaData(
      titleBn: "সাইয়্যেদুল ইস্তিগফার",
      titleEn: "Sayyid al-Istighfar",
      arabic: "اللَّهُمَّ أَنْتَ رَبِّي لَا إِلَهَ إِلَّا أَنْتَ خَلَقْتَنِي وَأَنَا عَبْدُكَ وَأَنَا عَلَى عَهْدِكَ وَوَعْدِكَ مَا اسْتَطَعْتُ أَعُوذُ بِكَ مِنْ شَرِّ مَا صَنَعْتُ أَبُوءُ لَكَ بِنِعْمَتِكَ عَلَيَّ وَأَبُوءُ لَكَ بِذَنْبِي فَاغْفِرْ لِي فَإِنَّهُ لَا يَغْفِرُ الذُّنُوبَ إِلَّا أَنْتَ",
      uccharonBn: "আল্লাহুম্মা আনতা রাব্বি লা ইলাহা ইল্লা আনতা খালাক্কতানী ওয়া আনা আব্দুকা ওয়া আনা আলা আহদিকা ওয়া ওয়া’দিকা মাসতাত্বা’তু আ’উযুবিকা মিন শাররি মা সানা’তু আবুউলাকা বিনি’মাতিকা আলাইয়্যা ওয়া আবুউলাকা বিযাম্বী ফাগফিরলী ফা ইন্নাহু লা ইয়াগফিরুয যুনুবা ইল্লা আনতা।",
      uccharonEn: "Allahumma anta Rabbi la ilaha illa anta, khalaqtani wa ana 'abduka, wa ana 'ala 'ahdika wa wa'dika mastata'tu, a'udhu bika min sharri ma sana'tu, abu'u laka bini'matika 'alayya, wa abu'u bidhanbi faghfir li fa innahu la yaghfirudh-dhunuba illa anta.",
      meaningBn: "হে আল্লাহ! আপনি আমার প্রতিপালক, আপনি ছাড়া আর কোনো উপাস্য নেই। আপনি আমাকে সৃষ্টি করেছেন এবং আমি আপনার বান্দা। আমি আমার সাধ্যমতো আপনার সঙ্গে ওয়াদা ও অঙ্গীকারের ওপর দৃঢ় আছি। আমি আমার কৃতকর্মের অনিষ্ট থেকে আপনার কাছে আশ্রয় চাই। আমি আমার ওপর আপনার অনুগ্রহকে স্বীকার করছি এবং আমি আমার পাপকেও স্বীকার করছি। অতএব আপনি আমাকে ক্ষমা করুন। নিশ্চয়ই আপনি ছাড়া পাপরাশি ক্ষমা করার আর কেউ নেই।",
      meaningEn: "O Allah, You are my Lord, there is no god but You. You created me and I am Your servant. I am committed to Your covenant and Your promise as much as I can. I seek refuge in You from the evil of what I have done. I acknowledge Your favor upon me, and I acknowledge my sin, so forgive me, for verily no one forgives sins but You.",
      categoryBn: "ক্ষমা",
      categoryEn: "Forgiveness",
    ),
    DoaData(
      titleBn: "ঘুমানোর পূর্বে দোয়া",
      titleEn: "Dua before sleeping",
      arabic: "اللَّهُمَّ بِاسْمِكَ أَمُوتُ وَأَحْيَا",
      uccharonBn: "আল্লাহুম্মা বিসমিকা আমুতু ওয়া আহইয়া",
      uccharonEn: "Allahumma bismika amutu wa ahya",
      meaningBn: "হে আল্লাহ! আপনার নামেই আমি মরি এবং আপনার নামেই জীবিত হই।",
      meaningEn: "O Allah, in Your name I die and I live.",
      categoryBn: "দৈনন্দিন",
      categoryEn: "Daily",
    ),
    DoaData(
      titleBn: "ঘুম থেকে ওঠার দোয়া",
      titleEn: "Dua after waking up",
      arabic: "الْحَمْدُ للهِ الَّذِي أَحْيَانَا بَعْدَ مَا أَمَاتَنَا وَإِلَيْهِ النُّشُورُ",
      uccharonBn: "আলহামদুলিল্লাহিল্লাজি আহইয়ানা বা’দা মা আমাতানা ওয়া ইলাইহিন নুশুর",
      uccharonEn: "Alhamdu lillahil-ladhi ahyana ba'da ma amatana wa ilayhin-nushur",
      meaningBn: "সব প্রশংসা আল্লাহর জন্য, যিনি আমাদের মৃত (নিদ্রা) হওয়ার পর জীবিত করলেন এবং তাঁর দিকেই পুনরুত্থান।",
      meaningEn: "All praise is for Allah who gave us life after causing us to die and to Him is the resurrection.",
      categoryBn: "দৈনন্দিন",
      categoryEn: "Daily",
    ),
    DoaData(
      titleBn: "কবরের আজাব থেকে মুক্তির দোয়া",
      titleEn: "Dua for protection from grave's punishment",
      arabic: "اللَّهُمَّ إِنِّي أَعُوذُ بِكَ مِنْ عَذَابِ الْقَبْرِ",
      uccharonBn: "আল্লাহুম্মা ইন্নি আ'উযুবিকা মিন আ'যাবিল ক্ববর",
      uccharonEn: "Allahumma inni a'udhu bika min 'adhabi-l-qabr",
      meaningBn: "হে আল্লাহ! আমি আপনার কাছে কবরের শাস্তি থেকে আশ্রয় চাই।",
      meaningEn: "O Allah, I seek refuge in You from the punishment of the grave.",
      categoryBn: "ক্ষমা",
      categoryEn: "Forgiveness",
    ),
    DoaData(
      titleBn: "রিজিক বৃদ্ধির দোয়া",
      titleEn: "Dua for Increase in Sustenance",
      arabic: "اللَّهُمَّ اكْفِنِي بِحَلاَلِكَ عَنْ حَرَامِكَ وَأَغْنِنِي بِفَضْلِكَ عَمَّنْ سِوَاكَ",
      uccharonBn: "আল্লাহুম্মা, ইকফিনী বি-হালালিকা 'আন হারামিক, ওয়া আগনিনী বি-ফাদলিকা 'আম্মান সিওয়াক।",
      uccharonEn: "Allahumma, ikfini bi-halalika 'an haramik, wa aghnini bi-fadlika 'amman siwak.",
      meaningBn: "হে আল্লাহ! হারামের পরিবর্তে আপনার হালাল রুজি আমার জন্য যথেষ্ট করে দিন। আর আপনাকে ছাড়া যেনো অন্য কারো মুখাপেক্ষী না হতে হয়, আপনার অনুগ্রহ দিয়ে আমাকে সেই সচ্ছলতা দান করুন।",
      meaningEn: "O Allah! Suffice me with Your lawful provision so I may stay away from Your unlawful provision, and make me independent of all others besides You.",
      categoryBn: "রিজিক",
      categoryEn: "Sustenance",
    ),
    DoaData(
      titleBn: "অসুস্থতা থেকে সুস্থতার দোয়া",
      titleEn: "Dua for Recovery from Illness",
      arabic: "اللَّهُمَّ رَبَّ النَّاسِ أَذْهِبِ الْبَأْسَ اشْفِ أَنْتَ الشَّافِي لَا شِفَاءَ إِلَّا شِفَاؤُكَ شِفَاءً لَا يُغَادِرُ سَقَمًا",
      uccharonBn: "আল্লাহুম্মা রাব্বান নাসি আযহিবিল বা’সা ইশফি আনতাশ শাফি, লা শিফাআ ইল্লা শিফাউকা শিফাআন লা ইয়ুগাদিরু সাক্বামা",
      uccharonEn: "Allahumma Rabban-nasi adhhibil-ba'sa, ishfi antash-shafi, la shifa'a illa shifa'uka shifa'an la yughadiru saqama",
      meaningBn: "হে আল্লাহ, মানুষের প্রতিপালক! আপনি কষ্ট দূর করে দিন এবং আরোগ্য দান করুন। আপনিই আরোগ্য দানকারী, আপনার আরোগ্য ছাড়া কোনো আরোগ্য নেই। এমন আরোগ্য দান করুন যা কোনো রোগ অবশিষ্ট রাখে না।",
      meaningEn: "O Allah, Lord of mankind, remove the hardship and grant healing. You are the Healer, there is no healing but Your healing, a healing that leaves no disease behind.",
      categoryBn: "দৈনন্দিন",
      categoryEn: "Daily",
    ),
    DoaData(
      titleBn: "সু-সন্তান লাভের দোয়া",
      titleEn: "Dua for Pious Children",
      arabic: "رَبِّ هَبْ لِي مِن لَّدُنكَ ذُرِّيَّةً طَيِّبَةً ۖ إِنَّكَ سَمِيعُ الدُّعَاءِ",
      uccharonBn: "রাব্বি হাবলী মিল্লাদুনকা যুররিয়্যাতান ত্বাইয়্যিবাতান, ইন্নাকা সামিউদ দুআ",
      uccharonEn: "Rabbi hab li mil ladunka dhurriyyatan tayyibatan, innaka sami'ud-du'a",
      meaningBn: "হে আমার প্রতিপালক! আপনার নিকট থেকে আমাকে সৎ বংশধর দান করুন। নিশ্চয়ই আপনি প্রার্থনা শ্রবণকারী।",
      meaningEn: "My Lord, grant me from Yourself a good offspring. Indeed, You are the Hearer of supplication.",
      categoryBn: "পরিবার",
      categoryEn: "Family",
    ),
    DoaData(
      titleBn: "ক্ষমা প্রার্থনার দোয়া",
      titleEn: "Dua for Forgiveness",
      arabic: "رَبَّنَا ظَلَمْنَا أَنفু্সَنَا وَإِن لَّমْ تَগْفِرْ لَنَا وَতَرْحَمْنَا لَنَكُونَنَّ مِنَ الْখাসিরীন",
      uccharonBn: "রাব্বানা যালামনা আনফুসানা ওয়া ইনলাম তাগফির লানা ওয়া তারহামনা লানাকুনান্না মিনাল খাসিরীন",
      uccharonEn: "Rabbana zalamna anfusana wa il-lam taghfir lana wa tarhamna lanakunanna minal-khasireen",
      meaningBn: "হে আমাদের পালনকর্তা! আমরা নিজেদের প্রতি জুলুম করেছি। যদি আপনি আমাদের ক্ষমা না করেন এবং আমাদের প্রতি রহম না করেন, তবে আমরা অবশ্যই ক্ষতিগ্রস্তদের অন্তর্ভুক্ত হব।",
      meaningEn: "Our Lord, we have wronged ourselves, and if You do not forgive us and have mercy upon us, we will surely be among the losers.",
      categoryBn: "ক্ষমা",
      categoryEn: "Forgiveness",
    ),
    DoaData(
      titleBn: "খাওয়ার আগের দোয়া",
      titleEn: "Dua before eating",
      arabic: "بِسْمِ اللهِ",
      uccharonBn: "বিসমিল্লাহ",
      uccharonEn: "Bismillah",
      meaningBn: "আল্লাহর নামে (শুরু করছি)।",
      meaningEn: "In the name of Allah.",
      categoryBn: "খাবার",
      categoryEn: "Food",
    ),
    DoaData(
      titleBn: "খাওয়ার পরের দোয়া",
      titleEn: "Dua after eating",
      arabic: "الْحَمْدُ لِلَّهِ الَّذِي أَطْعَمَنَا وَسَقَانَا وَجَعَلَنَا مُسْلِمِينَ",
      uccharonBn: "আলহামদুলিল্লাহিল্লাজি আতআমানা ওয়া সাকানা ওয়া জাআলানা মুসলিমীন",
      uccharonEn: "Alhamdu lillahil-ladhi at'amana wa saqana wa ja'alana muslimeen",
      meaningBn: "সব প্রশংসা আল্লাহর জন্য, যিনি আমাদের আহার করিয়েছেন, পান করিয়েছেন এবং মুসলিম বানিয়েছেন।",
      meaningEn: "All praise is for Allah who fed us, gave us drink, and made us Muslims.",
      categoryBn: "খাবার",
      categoryEn: "Food",
    ),
    DoaData(
      titleBn: "মসজিদে প্রবেশের দোয়া",
      titleEn: "Dua for entering Mosque",
      arabic: "اللَّهُمَّ افْتَحْ لِي أَبْوَابَ رَحْمَتِكَ",
      uccharonBn: "আল্লাহুম্মাফ তাহলী আবওয়াবা রাহমাতিক",
      uccharonEn: "Allahummaf-tah li abwaba rahmatik",
      meaningBn: "হে আল্লাহ! আমার জন্য আপনার রহমতের দরজাগুলো খুলে দিন।",
      meaningEn: "O Allah, open the gates of Your mercy for me.",
      categoryBn: "মসজিদ",
      categoryEn: "Mosque",
    ),
    DoaData(
      titleBn: "মসজিদ থেকে বের হওয়ার দোয়া",
      titleEn: "Dua for leaving Mosque",
      arabic: "اللَّهُمَّ إِنِّي أَسْأَلُكَ مِنْ فَضْلِكَ",
      uccharonBn: "আল্লাহুম্মা ইন্নি আসআলুকা মিন ফাদলিক",
      uccharonEn: "Allahumma inni as'aluka min fadlik",
      meaningBn: "হে আল্লাহ! আমি আপনার কাছে আপনার অনুগ্রহ প্রার্থনা করছি।",
      meaningEn: "O Allah, I ask You from Your favor.",
      categoryBn: "মসজিদ",
      categoryEn: "Mosque",
    ),
    DoaData(
      titleBn: "টয়লেটে প্রবেশের দোয়া",
      titleEn: "Dua before entering Toilet",
      arabic: "اللَّهُمَّ إِنِّي أَعُوذُ بِكَ مِنَ الْخُبُثِ وَالْخَبَائِثِ",
      uccharonBn: "আল্লাহুম্মা ইন্নি আউযুবিকা মিনাল খুবুছি ওয়াল খাবাইছ",
      uccharonEn: "Allahumma inni auzubika minal khubuthi wal khabaith",
      meaningBn: "হে আল্লাহ! আমি আপনার কাছে অপবিত্র জিন ও জিননীদের অনিষ্ট থেকে আশ্রয় চাই।",
      meaningEn: "O Allah, I seek refuge with You from all offensive and wicked things.",
      categoryBn: "দৈনন্দিন",
      categoryEn: "Daily",
    ),
    DoaData(
      titleBn: "টয়লেট থেকে বের হওয়ার দোয়া",
      titleEn: "Dua after leaving Toilet",
      arabic: "غُفْرَانَكَ",
      uccharonBn: "গুফরাণাকা",
      uccharonEn: "Ghufranaka",
      meaningBn: "(হে আল্লাহ!) আমি আপনার ক্ষমা প্রার্থনা করছি।",
      meaningEn: "(O Allah!) I ask for Your forgiveness.",
      categoryBn: "দৈনন্দিন",
      categoryEn: "Daily",
    ),
    DoaData(
      titleBn: "পিতা-মাতার জন্য দোয়া",
      titleEn: "Dua for Parents",
      arabic: "رَّبِّ ارْحَمْهُمَا كَمَا رَبَّيَانِي صَغِيرًا",
      uccharonBn: "রাব্বির হামহুমা কামা রাব্বায়ানি সাগিরা",
      uccharonEn: "Rabbir-hamhuma kama rabbayani saghira",
      meaningBn: "হে আমার পালনকর্তা! তাদের উভয়ের প্রতি রহম করুন, যেমন তারা আমাকে শৈশবে লালন-পালন করেছেন।",
      meaningEn: "My Lord, have mercy upon them as they brought me up [when I was] small.",
      categoryBn: "পরিবার",
      categoryEn: "Family",
    ),
    DoaData(
      titleBn: "বিপদ-আপদে পড়ার দোয়া",
      titleEn: "Dua during distress",
      arabic: "إِنَّا لِلَّهِ وَإِنَّا إِلَيْهِ رَاجِعُونَ",
      uccharonBn: "ইন্না লিল্লাহি ওয়া ইন্না ইলাইহি রাজিউন",
      uccharonEn: "Inna lillahi wa inna ilayhi raji'un",
      meaningBn: "নিশ্চয়ই আমরা আল্লাহর জন্য এবং নিশ্চয়ই আমরা তাঁরই দিকে প্রত্যাবর্তনকারী।",
      meaningEn: "Indeed we belong to Allah, and indeed to Him we will return.",
      categoryBn: "বিপদ",
      categoryEn: "Distress",
    ),
    DoaData(
      titleBn: "জ্ঞান বৃদ্ধির দোয়া",
      titleEn: "Dua for Knowledge",
      arabic: "رَّبِّ زِدْنِي عِلْمًا",
      uccharonBn: "রাব্বি জিদনি ইলমা",
      uccharonEn: "Rabbi zidni 'ilma",
      meaningBn: "হে আমার পালনকর্তা! আমার জ্ঞান বৃদ্ধি করে দিন।",
      meaningEn: "My Lord, increase me in knowledge.",
      categoryBn: "শিক্ষা",
      categoryEn: "Education",
    ),
  ];

  List<DoaData> get _filteredDoas {
    return _allDoas.where((doa) {
      final matchesSearch = (widget.isBangla ? doa.titleBn : doa.titleEn)
          .toLowerCase()
          .contains(_searchQuery.toLowerCase());
      final matchesCategory = _selectedCategory == "All" || 
          doa.categoryEn == _selectedCategory;
      return matchesSearch && matchesCategory;
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    final primaryGreen = Colors.green.shade600;
    final surfaceColor = widget.isDarkMode ? const Color(0xFF1E293B) : Colors.white;
    final textColor = widget.isDarkMode ? Colors.white : Colors.black87;
    final subtextColor = widget.isDarkMode ? Colors.white70 : Colors.black54;
    final scaffoldBg = widget.isDarkMode ? const Color(0xFF0F172A) : const Color(0xFFF8FAFC);

    final categories = ["All", "Daily", "Food", "Mosque", "Family", "Forgiveness", "Distress", "Education", "Sustenance"];

    return Scaffold(
      backgroundColor: scaffoldBg,
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
            child: Container(
              decoration: BoxDecoration(
                color: surfaceColor,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: TextField(
                onChanged: (value) => setState(() => _searchQuery = value),
                style: TextStyle(color: textColor),
                decoration: InputDecoration(
                  hintText: widget.isBangla ? "দোয়া খুঁজুন..." : "Search Doa...",
                  hintStyle: TextStyle(color: subtextColor),
                  prefixIcon: Icon(Icons.search, color: primaryGreen),
                  border: InputBorder.none,
                  contentPadding: const EdgeInsets.symmetric(vertical: 12),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 50,
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              scrollDirection: Axis.horizontal,
              itemCount: categories.length,
              itemBuilder: (context, index) {
                final cat = categories[index];
                final isSelected = _selectedCategory == cat;
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4),
                  child: FilterChip(
                    label: Text(
                      cat == "All" ? (widget.isBangla ? "সব" : "All") : 
                      (widget.isBangla ? _getCategoryBn(cat) : cat),
                      style: TextStyle(
                        color: isSelected ? Colors.white : (widget.isDarkMode ? Colors.white70 : Colors.black87),
                        fontSize: 12,
                        fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                      ),
                    ),
                    selected: isSelected,
                    onSelected: (selected) {
                      setState(() => _selectedCategory = cat);
                    },
                    backgroundColor: surfaceColor,
                    selectedColor: primaryGreen,
                    checkmarkColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                      side: BorderSide(
                        color: isSelected ? Colors.transparent : (widget.isDarkMode ? Colors.white10 : Colors.grey.shade200),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: _filteredDoas.length,
              itemBuilder: (context, index) {
                final doa = _filteredDoas[index];
                return Container(
                  margin: const EdgeInsets.only(bottom: 12),
                  decoration: BoxDecoration(
                    color: surfaceColor,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(widget.isDarkMode ? 0.2 : 0.05),
                        blurRadius: 10,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                      borderRadius: BorderRadius.circular(20),
                      onTap: () => _showDoaDetail(context, doa, index + 1, primaryGreen, surfaceColor, textColor, subtextColor),
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: Row(
                          children: [
                            Container(
                              width: 44,
                              height: 44,
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
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    widget.isBangla ? doa.titleBn : doa.titleEn,
                                    style: TextStyle(
                                      color: textColor,
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(height: 4),
                                  Text(
                                    widget.isBangla ? doa.categoryBn : doa.categoryEn,
                                    style: TextStyle(
                                      color: primaryGreen,
                                      fontSize: 11,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Icon(Icons.arrow_forward_ios_rounded, size: 14, color: subtextColor.withOpacity(0.3)),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  String _getCategoryBn(String cat) {
    switch (cat) {
      case "Daily": return "দৈনন্দিন";
      case "Food": return "খাবার";
      case "Mosque": return "মসজিদ";
      case "Family": return "পরিবার";
      case "Forgiveness": return "ক্ষমা";
      case "Distress": return "বিপদ";
      case "Education": return "শিক্ষা";
      case "Sustenance": return "রিজিক";
      default: return cat;
    }
  }

  void _showDoaDetail(BuildContext context, DoaData doa, int index, Color primary, Color surface, Color text, Color subtext) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: surface,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
        contentPadding: const EdgeInsets.all(24),
        content: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Text(
                  widget.isBangla ? doa.titleBn : doa.titleEn,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: text,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: primary.withOpacity(0.05),
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: primary.withOpacity(0.1)),
                ),
                child: Text(
                  doa.arabic,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: primary,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'serif',
                    height: 1.6,
                  ),
                ),
              ),
              const SizedBox(height: 24),
              _buildSection(widget.isBangla ? "উচ্চারণ:" : "Pronunciation:", widget.isBangla ? doa.uccharonBn : doa.uccharonEn, primary, text),
              const SizedBox(height: 16),
              _buildSection(widget.isBangla ? "অর্থ:" : "Meaning:", widget.isBangla ? doa.meaningBn : doa.meaningEn, primary, text),
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
                    elevation: 0,
                  ),
                  child: Text(widget.isBangla ? "বন্ধ করুন" : "Close"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSection(String label, String content, Color primary, Color text) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(color: primary, fontWeight: FontWeight.bold, fontSize: 14, letterSpacing: 0.5),
        ),
        const SizedBox(height: 8),
        Text(
          content,
          style: TextStyle(
            color: text,
            fontSize: 16,
            height: 1.5,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
