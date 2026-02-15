import 'package:flutter/material.dart';

class AllahName {
  final String nameEn;
  final String nameBn;
  final String uccharonEn;
  final String uccharonBn;
  final String meaningEn;
  final String meaningBn;

  const AllahName({
    required this.nameEn,
    required this.nameBn,
    required this.uccharonEn,
    required this.uccharonBn,
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
    AllahName(nameEn: "Ar-Rahman", nameBn: "আর-রাহমান", uccharonEn: "Ar-Rahmān", uccharonBn: "আর-রাহমান", meaningEn: "The Most Merciful", meaningBn: "পরম দয়াময়"),
    AllahName(nameEn: "Ar-Rahim", nameBn: "আর-রাহীম", uccharonEn: "Ar-Rahīm", uccharonBn: "আর-রাহীম", meaningEn: "The Especially Merciful", meaningBn: "অতি দয়ালু"),
    AllahName(nameEn: "Al-Malik", nameBn: "আল-মালিক", uccharonEn: "Al-Malik", uccharonBn: "আল-মালিক", meaningEn: "The King and Owner of Dominion", meaningBn: "রাজা ও সার্বভৌম"),
    AllahName(nameEn: "Al-Quddus", nameBn: "আল-কুদ্দুস", uccharonEn: "Al-Quddūs", uccharonBn: "আল-কুদ্দুস", meaningEn: "The Absolutely Pure", meaningBn: "পরম পবিত্র"),
    AllahName(nameEn: "As-Salam", nameBn: "আস-সালাম", uccharonEn: "As-Salām", uccharonBn: "আস-সালাম", meaningEn: "The Perfection and Giver of Peace", meaningBn: "শান্তির দাতা"),
    AllahName(nameEn: "Al-Mu'min", nameBn: "আল-মু'মিন", uccharonEn: "Al-Mu'min", uccharonBn: "আল-মু'মিন", meaningEn: "The Granter of Security and Faith", meaningBn: "বিশ্বাস ও নিরাপত্তার দাতা"),
    AllahName(nameEn: "Al-Muhaymin", nameBn: "আল-মুহাইমিন", uccharonEn: "Al-Muhaymin", uccharonBn: "আল-মুহাইমিন", meaningEn: "The Guardian and Overseer", meaningBn: "রক্ষক ও তত্ত্বাবধায়ক"),
    AllahName(nameEn: "Al-Aziz", nameBn: "আল-আযীয", uccharonEn: "Al-ʿAzīz", uccharonBn: "আল-আযীয", meaningEn: "The Almighty", meaningBn: "পরাক্রমশালী"),
    AllahName(nameEn: "Al-Jabbar", nameBn: "আল-জাব্বার", uccharonEn: "Al-Jabbār", uccharonBn: "আল-জাব্বার", meaningEn: "The Compeller", meaningBn: "প্রবল"),
    AllahName(nameEn: "Al-Mutakabbir", nameBn: "আল-মুতাকাব্বির", uccharonEn: "Al-Mutakabbir", uccharonBn: "আল-মুতাকাব্বির", meaningEn: "The Supreme and Majestic", meaningBn: "সর্বোচ্চ ও মহিমাময়"),
    AllahName(nameEn: "Al-Khaliq", nameBn: "আল-খালিক", uccharonEn: "Al-Khāliq", uccharonBn: "আল-খালিক", meaningEn: "The Creator", meaningBn: "সৃষ্টিকর্তা"),
    AllahName(nameEn: "Al-Bari", nameBn: "আল-বারী", uccharonEn: "Al-Bāri'", uccharonBn: "আল-বারী", meaningEn: "The Originator", meaningBn: "উদ্ভাবক"),
    AllahName(nameEn: "Al-Musawwir", nameBn: "আল-মুসাওওয়ির", uccharonEn: "Al-Muṣawwir", uccharonBn: "আল-মুসাওওয়ির", meaningEn: "The Fashioner", meaningBn: "আকৃতি দানকারী"),
    AllahName(nameEn: "Al-Ghaffar", nameBn: "আল-গাফফার", uccharonEn: "Al-Ghaffār", uccharonBn: "আল-গাফফার", meaningEn: "The Great Forgiver", meaningBn: "মহান ক্ষমাকারী"),
    AllahName(nameEn: "Al-Qahhar", nameBn: "আল-কাহহার", uccharonEn: "Al-Qahhār", uccharonBn: "আল-কাহহার", meaningEn: "The Subduer", meaningBn: "পরাক্রমশালী দমনকারী"),
    AllahName(nameEn: "Al-Wahhab", nameBn: "আল-ওয়াহহাব", uccharonEn: "Al-Wahhāb", uccharonBn: "আল-ওয়াহহাব", meaningEn: "The Bestower", meaningBn: "দাতা"),
    AllahName(nameEn: "Ar-Razzaq", nameBn: "আর-রাযযাক", uccharonEn: "Ar-Razzāq", uccharonBn: "আর-রাযযাক", meaningEn: "The Provider", meaningBn: "রিজিক দাতা"),
    AllahName(nameEn: "Al-Fattah", nameBn: "আল-ফাত্তাহ", uccharonEn: "Al-Fattāḥ", uccharonBn: "আল-ফাত্তাহ", meaningEn: "The Opener", meaningBn: "উন্মুক্তকারী"),
    AllahName(nameEn: "Al-Alim", nameBn: "আল-আলীম", uccharonEn: "Al-ʿAlīm", uccharonBn: "আল-আলীম", meaningEn: "The All-Knowing", meaningBn: "সর্বজ্ঞ"),
    AllahName(nameEn: "Al-Qabid", nameBn: "আল-কাবিদ", uccharonEn: "Al-Qābiḍ", uccharonBn: "আল-কাবিদ", meaningEn: "The Withholder", meaningBn: "সংকুচিতকারী"),
    AllahName(nameEn: "Al-Basit", nameBn: "আল-বাসিত", uccharonEn: "Al-Bāsiṭ", uccharonBn: "আল-বাসিত", meaningEn: "The Extender", meaningBn: "প্রসারকারী"),
    AllahName(nameEn: "Al-Khafid", nameBn: "আল-খাফিদ", uccharonEn: "Al-Khāfiḍ", uccharonBn: "আল-খাফিদ", meaningEn: "The Abaser", meaningBn: "নিচুকারী"),
    AllahName(nameEn: "Ar-Rafi", nameBn: "আর-রাফি'", uccharonEn: "Ar-Rāfi'", uccharonBn: "আর-রাফি'", meaningEn: "The Exalter", meaningBn: "উন্নয়নকারী"),
    AllahName(nameEn: "Al-Mu'izz", nameBn: "আল-মু'ইয্য", uccharonEn: "Al-Mu'izz", uccharonBn: "আল-মু'ইয্য", meaningEn: "The Honorer", meaningBn: "সম্মান দাতা"),
    AllahName(nameEn: "Al-Mudhill", nameBn: "আল-মুযিল্ল", uccharonEn: "Al-Mudhill", uccharonBn: "আল-মুযিল্ল", meaningEn: "The Humiliator", meaningBn: "লাঞ্ছনাকারী"),
    AllahName(nameEn: "As-Sami", nameBn: "আস-সামী'", uccharonEn: "As-Samī'", uccharonBn: "আস-সামী'", meaningEn: "The All-Hearing", meaningBn: "সর্বশ্রোতা"),
    AllahName(nameEn: "Al-Basir", nameBn: "আল-বাসির", uccharonEn: "Al-Baṣīr", uccharonBn: "আল-বাসির", meaningEn: "The All-Seeing", meaningBn: "সর্বদ্রষ্টা"),
    AllahName(nameEn: "Al-Hakam", nameBn: "আল-হাকাম", uccharonEn: "Al-Ḥakam", uccharonBn: "আল-হাকাম", meaningEn: "The Judge", meaningBn: "বিচারক"),
    AllahName(nameEn: "Al-Adl", nameBn: "আল-আদল", uccharonEn: "Al-ʿAdl", uccharonBn: "আল-আদল", meaningEn: "The Just", meaningBn: "ন্যায়বান"),
    AllahName(nameEn: "Al-Latif", nameBn: "আল-লাতীফ", uccharonEn: "Al-Laṭīf", uccharonBn: "আল-লাতীফ", meaningEn: "The Subtle", meaningBn: "কোমল"),
    AllahName(nameEn: "Al-Khabir", nameBn: "আল-খাবীর", uccharonEn: "Al-Khabīr", uccharonBn: "আল-খাবীর", meaningEn: "The All-Aware", meaningBn: "সবকিছু জানেন"),
    AllahName(nameEn: "Al-Halim", nameBn: "আল-হালীম", uccharonEn: "Al-Ḥalīm", uccharonBn: "আল-হালীম", meaningEn: "The Forbearing", meaningBn: "ধৈর্যশীল"),
    AllahName(nameEn: "Al-Azim", nameBn: "আল-আযীম", uccharonEn: "Al-ʿAẓīm", uccharonBn: "আল-আযীম", meaningEn: "The Most Great", meaningBn: "মহান"),
    AllahName(nameEn: "Al-Ghafur", nameBn: "আল-গাফুর", uccharonEn: "Al-Ghafūr", uccharonBn: "আল-গাফুর", meaningEn: "The Ever-Forgiving", meaningBn: "ক্ষমাশীল"),
    AllahName(nameEn: "Ash-Shakur", nameBn: "আশ-শাকুর", uccharonEn: "Ash-Shakūr", uccharonBn: "আশ-শাকুর", meaningEn: "The Appreciative", meaningBn: "কৃতজ্ঞতাপ্রদর্শনকারী"),
    AllahName(nameEn: "Al-Ali", nameBn: "আল-আলী", uccharonEn: "Al-ʿAliyy", uccharonBn: "আল-আলী", meaningEn: "The Most High", meaningBn: "সর্বোচ্চ"),
    AllahName(nameEn: "Al-Kabir", nameBn: "আল-কাবীর", uccharonEn: "Al-Kabīr", uccharonBn: "আল-কাবীর", meaningEn: "The Great", meaningBn: "মহান"),
    AllahName(nameEn: "Al-Hafiz", nameBn: "আল-হাফিয", uccharonEn: "Al-Ḥafīẓ", uccharonBn: "আল-হাফিয", meaningEn: "The Preserver", meaningBn: "রক্ষক"),
    AllahName(nameEn: "Al-Muqit", nameBn: "আল-মুকীত", uccharonEn: "Al-Muqīt", uccharonBn: "আল-মুকীত", meaningEn: "The Nourisher", meaningBn: "পালনকর্তা"),
    AllahName(nameEn: "Al-Hasib", nameBn: "আল-হাসীব", uccharonEn: "Al-Ḥasīb", uccharonBn: "আল-হাসীব", meaningEn: "The Reckoner", meaningBn: "হিসাব নেওয়ার মতো"),
    AllahName(nameEn: "Al-Jalil", nameBn: "আল-জালীল", uccharonEn: "Al-Jalīl", uccharonBn: "আল-জালীল", meaningEn: "The Majestic", meaningBn: "মহিমাময়"),
    AllahName(nameEn: "Al-Karim", nameBn: "আল-কারীম", uccharonEn: "Al-Karīm", uccharonBn: "আল-কারীম", meaningEn: "The Generous", meaningBn: "উদার"),
    AllahName(nameEn: "Ar-Raqib", nameBn: "আর-রাকীব", uccharonEn: "Ar-Raqīb", uccharonBn: "আর-রাকীব", meaningEn: "The Watchful", meaningBn: "প্রহরী"),
    AllahName(nameEn: "Al-Mujib", nameBn: "আল-মুজীব", uccharonEn: "Al-Mujīb", uccharonBn: "আল-মুজীব", meaningEn: "The Responsive", meaningBn: "প্রতিক্রিয়াশীল"),
    AllahName(nameEn: "Al-Wasi", nameBn: "আল-ওয়াসি'", uccharonEn: "Al-Wāsi'", uccharonBn: "আল-ওয়াসি'", meaningEn: "The All-Encompassing", meaningBn: "সর্বব্যাপী"),
    AllahName(nameEn: "Al-Hakim", nameBn: "আল-হাকীম", uccharonEn: "Al-Ḥakīm", uccharonBn: "আল-হাকীম", meaningEn: "The Wise", meaningBn: "প্রজ্ঞাময়"),
    AllahName(nameEn: "Al-Wadud", nameBn: "আল-ওয়াদুদ", uccharonEn: "Al-Wadūd", uccharonBn: "আল-ওয়াদুদ", meaningEn: "The Loving", meaningBn: "প্রেমময়"),
    AllahName(nameEn: "Al-Majid", nameBn: "আল-মাজীদ", uccharonEn: "Al-Majīd", uccharonBn: "আল-মাজীদ", meaningEn: "The Glorious", meaningBn: "মহিমান্বিত"),
    AllahName(nameEn: "Al-Ba'ith", nameBn: "আল-বায়িস", uccharonEn: "Al-Bā'ith", uccharonBn: "আল-বায়িস", meaningEn: "The Resurrector", meaningBn: "পুনরুত্থানকারী"),
    AllahName(nameEn: "Ash-Shahid", nameBn: "আশ-শাহীদ", uccharonEn: "Ash-Shahīd", uccharonBn: "আশ-শাহীদ", meaningEn: "The Witness", meaningBn: "সাক্ষী"),
    AllahName(nameEn: "Al-Haqq", nameBn: "আল-হক্ক", uccharonEn: "Al-Ḥaqq", uccharonBn: "আল-হক্ক", meaningEn: "The Truth", meaningBn: "সত্য"),
    AllahName(nameEn: "Al-Wakil", nameBn: "আল-ওয়াকীল", uccharonEn: "Al-Wakīl", uccharonBn: "আল-ওয়াকীল", meaningEn: "The Trustee", meaningBn: "বিচারকর্তা"),
    AllahName(nameEn: "Al-Qawi", nameBn: "আল-ক্বাবী", uccharonEn: "Al-Qawiyy", uccharonBn: "আল-ক্বাবী", meaningEn: "The Strong", meaningBn: "শক্তিশালী"),
    AllahName(nameEn: "Al-Matin", nameBn: "আল-মাতীন", uccharonEn: "Al-Matīn", uccharonBn: "আল-মাতীন", meaningEn: "The Firm", meaningBn: "দৃঢ়"),
    AllahName(nameEn: "Al-Wali", nameBn: "আল-ওয়ালী", uccharonEn: "Al-Waliyy", uccharonBn: "আল-ওয়ালী", meaningEn: "The Protecting Friend", meaningBn: "রক্ষাকারী বন্ধু"),
    AllahName(nameEn: "Al-Hamid", nameBn: "আল-হামীদ", uccharonEn: "Al-Ḥamīd", uccharonBn: "আল-হামীদ", meaningEn: "The Praiseworthy", meaningBn: "প্রশংসনীয়"),
    AllahName(nameEn: "Al-Muhsi", nameBn: "আল-মুহসী", uccharonEn: "Al-Muḥṣī", uccharonBn: "আল-মুহসী", meaningEn: "The Accounter", meaningBn: "গণনাকারী"),
    AllahName(nameEn: "Al-Mubdi", nameBn: "আল-মুবদী", uccharonEn: "Al-Mubdi'", uccharonBn: "আল-মুবদী", meaningEn: "The Originator", meaningBn: "উৎপাদক"),
    AllahName(nameEn: "Al-Mu'id", nameBn: "আল-মু'ঈদ", uccharonEn: "Al-Mu'īd", uccharonBn: "আল-মু'ঈদ", meaningEn: "The Restorer", meaningBn: "পুনরুদ্ধারকারী"),
    AllahName(nameEn: "Al-Muhyi", nameBn: "আল-মুহ্যী", uccharonEn: "Al-Muḥyī", uccharonBn: "আল-মুহ্যী", meaningEn: "The Giver of Life", meaningBn: "জীবন দাতা"),
    AllahName(nameEn: "Al-Mumit", nameBn: "আল-মুমীত", uccharonEn: "Al-Mumīt", uccharonBn: "আল-মুমীত", meaningEn: "The Bringer of Death", meaningBn: "মৃত্যু দাতা"),
    AllahName(nameEn: "Al-Hayy", nameBn: "আল-হাইয়্য", uccharonEn: "Al-Ḥayy", uccharonBn: "আল-হাইয়্য", meaningEn: "The Ever-Living", meaningBn: "চিরঞ্জীব"),
    AllahName(nameEn: "Al-Qayyum", nameBn: "আল-ক্বাইয়্যুম", uccharonEn: "Al-Qayyūm", uccharonBn: "আল-ক্বাইয়্যুম", meaningEn: "The Self-Subsisting", meaningBn: "স্বয়ংসম্পূর্ণ"),
    AllahName(nameEn: "Al-Wajid", nameBn: "আল-ওয়াজিদ", uccharonEn: "Al-Wājid", uccharonBn: "আল-ওয়াজিদ", meaningEn: "The Finder", meaningBn: "অন্বেষক"),
    AllahName(nameEn: "Al-Majid", nameBn: "আল-মাজীদ", uccharonEn: "Al-Majīd", uccharonBn: "আল-মাজীদ", meaningEn: "The Noble", meaningBn: "মহান"),
    AllahName(nameEn: "Al-Wahid", nameBn: "আল-ওয়াহিদ", uccharonEn: "Al-Wāḥid", uccharonBn: "আল-ওয়াহিদ", meaningEn: "The One", meaningBn: "একক"),
    AllahName(nameEn: "Al-Ahad", nameBn: "আল-আহাদ", uccharonEn: "Al-Aḥad", uccharonBn: "আল-আহাদ", meaningEn: "The Unique", meaningBn: "অদ্বিতীয়"),
    AllahName(nameEn: "As-Samad", nameBn: "আস-সামাদ", uccharonEn: "Aṣ-Ṣamad", uccharonBn: "আস-সামাদ", meaningEn: "The Self-Sufficient", meaningBn: "অনন্য"),
    AllahName(nameEn: "Al-Qadir", nameBn: "আল-ক্বাদির", uccharonEn: "Al-Qādir", uccharonBn: "আল-ক্বাদির", meaningEn: "The Capable", meaningBn: "সক্ষম"),
    AllahName(nameEn: "Al-Muqtadir", nameBn: "আল-মুকতাদির", uccharonEn: "Al-Muqtadir", uccharonBn: "আল-মুকতাদির", meaningEn: "The Powerful", meaningBn: "পরাক্রমশালী"),
    AllahName(nameEn: "Al-Muqaddim", nameBn: "আল-মুকাদ্দিম", uccharonEn: "Al-Muqaddim", uccharonBn: "আল-মুকাদ্দিম", meaningEn: "The Expediter", meaningBn: "অগ্রগামী"),
    AllahName(nameEn: "Al-Mu'akhkhir", nameBn: "আল-মু'আখখির", uccharonEn: "Al-Mu'akhkhir", uccharonBn: "আল-মু'আখখির", meaningEn: "The Delayer", meaningBn: "বিলম্বকারী"),
    AllahName(nameEn: "Al-Awwal", nameBn: "আল-আওয়াল", uccharonEn: "Al-Awwal", uccharonBn: "আল-আওয়াল", meaningEn: "The First", meaningBn: "প্রথম"),
    AllahName(nameEn: "Al-Akhir", nameBn: "আল-আখির", uccharonEn: "Al-Ākhir", uccharonBn: "আল-আখির", meaningEn: "The Last", meaningBn: "শেষ"),
    AllahName(nameEn: "Az-Zahir", nameBn: "আয-যাহির", uccharonEn: "Aẓ-Ẓāhir", uccharonBn: "আয-যাহির", meaningEn: "The Apparent", meaningBn: "প্রকাশ্য"),
    AllahName(nameEn: "Al-Batin", nameBn: "আল-বাতিন", uccharonEn: "Al-Bāṭin", uccharonBn: "আল-বাতিন", meaningEn: "The Hidden", meaningBn: "গুপ্ত"),
    AllahName(nameEn: "Al-Wali", nameBn: "আল-ওয়ালী", uccharonEn: "Al-Wālī", uccharonBn: "আল-ওয়ালী", meaningEn: "The Governor", meaningBn: "শাসক"),
    AllahName(nameEn: "Al-Muta'ali", nameBn: "আল-মুতাআলী", uccharonEn: "Al-Muta'ālī", uccharonBn: "আল-মুতাআলী", meaningEn: "The Most Exalted", meaningBn: "সর্বোচ্চ"),
    AllahName(nameEn: "Al-Barr", nameBn: "আল-বার্র", uccharonEn: "Al-Barr", uccharonBn: "আল-বার্র", meaningEn: "The Source of Goodness", meaningBn: "কল্যাণের উৎস"),
    AllahName(nameEn: "At-Tawwab", nameBn: "আত-তাওয়াব", uccharonEn: "At-Tawwāb", uccharonBn: "আত-তাওয়াব", meaningEn: "The Accepting of Repentance", meaningBn: "তওবা গ্রহণকারী"),
    AllahName(nameEn: "Al-Muntaqim", nameBn: "আল-মুনতাকিম", uccharonEn: "Al-Muntaqim", uccharonBn: "আল-মুনতাকিম", meaningEn: "The Avenger", meaningBn: "প্রতিশোধ নেওয়ার মতো"),
    AllahName(nameEn: "Al-Afuw", nameBn: "আল-আফুও", uccharonEn: "Al-ʿAfūw", uccharonBn: "আল-আফুও", meaningEn: "The Pardoner", meaningBn: "ক্ষমাকারী"),
    AllahName(nameEn: "Ar-Ra'uf", nameBn: "আর-রাউফ", uccharonEn: "Ar-Ra'ūf", uccharonBn: "আর-রাউফ", meaningEn: "The Kind", meaningBn: "দয়ালু"),
    AllahName(nameEn: "Malik ul-Mulk", nameBn: "মালিকুল মুলক", uccharonEn: "Mālik ul-Mulk", uccharonBn: "মালিকুল মুলক", meaningEn: "Owner of Sovereignty", meaningBn: "রাজত্বের মালিক"),
    AllahName(nameEn: "Dhul-Jalali wal-Ikram", nameBn: "যুল জালালি ওয়াল ইকরাম", uccharonEn: "Dhūl-Jalāli wal-Ikrām", uccharonBn: "যুল জালালি ওয়াল ইকরাম", meaningEn: "Possessor of Majesty and Honor", meaningBn: "মহিমা ও সম্মানের অধিকারী"),
    AllahName(nameEn: "Al-Muqsit", nameBn: "আল-মুকসিত", uccharonEn: "Al-Muqsiṭ", uccharonBn: "আল-মুকসিত", meaningEn: "The Equitable", meaningBn: "ন্যায়পরায়ণ"),
    AllahName(nameEn: "Al-Jami", nameBn: "আল-জামি'", uccharonEn: "Al-Jāmi'", uccharonBn: "আল-জামি'", meaningEn: "The Gatherer", meaningBn: "সমাবেশকারী"),
    AllahName(nameEn: "Al-Ghani", nameBn: "আল-গানী", uccharonEn: "Al-Ghanīyy", uccharonBn: "আল-গানী", meaningEn: "The Self-Sufficient", meaningBn: "অনন্য"),
    AllahName(nameEn: "Al-Mughni", nameBn: "আল-মুগনী", uccharonEn: "Al-Mughnī", uccharonBn: "আল-মুগনী", meaningEn: "The Enricher", meaningBn: "সমৃদ্ধকারী"),
    AllahName(nameEn: "Al-Mani", nameBn: "আল-মানি'", uccharonEn: "Al-Māni'", uccharonBn: "আল-মানি'", meaningEn: "The Withholder", meaningBn: "নিবারক"),
    AllahName(nameEn: "Ad-Darr", nameBn: "আদ-দার্র", uccharonEn: "Aḍ-Ḍārr", uccharonBn: "আদ-দার্র", meaningEn: "The Harmful", meaningBn: "ক্ষতিসাধক"),
    AllahName(nameEn: "An-Nafi", nameBn: "আন-নাফি'", uccharonEn: "An-Nāfi'", uccharonBn: "আন-নাফি'", meaningEn: "The Beneficent", meaningBn: "কল্যাণকারী"),
    AllahName(nameEn: "An-Nur", nameBn: "আন-নুর", uccharonEn: "An-Nūr", uccharonBn: "আন-নুর", meaningEn: "The Light", meaningBn: "আলো"),
    AllahName(nameEn: "Al-Hadi", nameBn: "আল-হাদী", uccharonEn: "Al-Hādī", uccharonBn: "আল-হাদী", meaningEn: "The Guide", meaningBn: "পথপ্রদর্শক"),
    AllahName(nameEn: "Al-Badi", nameBn: "আল-বাদি'", uccharonEn: "Al-Badī'", uccharonBn: "আল-বাদি'", meaningEn: "The Incomparable", meaningBn: "অতুলনীয়"),
    AllahName(nameEn: "Al-Baqi", nameBn: "আল-বাকী", uccharonEn: "Al-Bāqī", uccharonBn: "আল-বাকী", meaningEn: "The Everlasting", meaningBn: "চিরস্থায়ী"),
    AllahName(nameEn: "Al-Warith", nameBn: "আল-ওয়ারিস", uccharonEn: "Al-Wārith", uccharonBn: "আল-ওয়ারিস", meaningEn: "The Inheritor", meaningBn: "উত্তরাধিকারী"),
    AllahName(nameEn: "Ar-Rashid", nameBn: "আর-রশীদ", uccharonEn: "Ar-Rashīd", uccharonBn: "আর-রশীদ", meaningEn: "The Rightly Guided", meaningBn: "সঠিক পথপ্রদর্শক"),
    AllahName(nameEn: "As-Sabur", nameBn: "আস-সাবুর", uccharonEn: "Aṣ-Ṣabūr", uccharonBn: "আস-সাবুর", meaningEn: "The Patient", meaningBn: "ধৈর্যশীল"),
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
        backgroundColor: Colors.transparent,
        iconTheme: IconThemeData(color: isDarkMode ? Colors.white : primaryGreen),
        title: Text(
          isBangla ? "আল্লাহর ৯৯টি নাম" : "99 Names of Allah",
          style: TextStyle(
            color: isDarkMode ? Colors.white : primaryGreen,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
        itemCount: _names.length,
        itemBuilder: (context, index) {
          final n = _names[index];
          final name = isBangla ? n.nameBn : n.nameEn;
          final uccharon = isBangla ? n.uccharonBn : n.uccharonEn;
          final meaning = isBangla ? n.meaningBn : n.meaningEn;

          return Card(
            margin: const EdgeInsets.only(bottom: 8),
            color: surfaceColor,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
            elevation: isDarkMode ? 0 : 2,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        width: 28,
                        height: 28,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: primaryGreen.withOpacity(0.15),
                          borderRadius: BorderRadius.circular(7),
                        ),
                        child: Text(
                          "${index + 1}",
                          style: TextStyle(
                            color: primaryGreen,
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: Text(
                          name,
                          style: TextStyle(
                            color: textColor,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 5),
                  Text(
                    isBangla ? "উচ্চারণ: $uccharon" : "Pronunciation: $uccharon",
                    style: TextStyle(color: subtextColor, fontSize: 12),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    isBangla ? "অর্থ: $meaning" : "Meaning: $meaning",
                    style: TextStyle(
                      color: primaryGreen,
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
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
