import 'package:flutter/material.dart';
import 'about_developer.dart';
import 'home_page.dart';
import 'prayer_times_page.dart';
import 'ramadan_page.dart';
import 'zakat_calculator_page.dart';

class DhikrData {
  final String nameBn;
  final String nameEn;
  final String uccharonBn;
  final String uccharonEn;
  final String orthoBn;
  final String orthoEn;
  final int defaultCount;
  final bool isGeneral;

  const DhikrData({
    required this.nameBn,
    required this.nameEn,
    required this.uccharonBn,
    required this.uccharonEn,
    required this.orthoBn,
    required this.orthoEn,
    required this.defaultCount,
    this.isGeneral = false,
  });
}

class CounterPage extends StatefulWidget {
  final bool isDarkMode;
  final VoidCallback onToggleTheme;

  const CounterPage({
    super.key,
    required this.isDarkMode,
    required this.onToggleTheme,
  });

  @override
  State<CounterPage> createState() => _CounterPageState();
}

class _CounterPageState extends State<CounterPage> {
  int _counter = 0;
  bool _isBangla = true;
  int _selectedIndex = 0;
  String _selectedCity = 'Dhaka';

  final List<DhikrData> _allDhikrs = const [
    DhikrData(
      nameBn: "তাসবিহ",
      nameEn: "Tasbih",
      uccharonBn: "সুবহানাল্লাহ",
      uccharonEn: "Subhanallah",
      orthoBn: "আল্লাহ পবিত্র",
      orthoEn: "Allah is Holy",
      defaultCount: 33,
    ),
    DhikrData(
      nameBn: "তাহমিদ",
      nameEn: "Tahmid",
      uccharonBn: "আলহামদুলিল্লাহ",
      uccharonEn: "Alhamdulillah",
      orthoBn: "সমস্ত প্রশংসা আল্লাহর জন্য",
      orthoEn: "All praise is for Allah",
      defaultCount: 33,
    ),
    DhikrData(
      nameBn: "তাকবির",
      nameEn: "Takbir",
      uccharonBn: "আল্লাহু আকবার",
      uccharonEn: "Allahu Akbar",
      orthoBn: "আল্লাহ সর্বশ্রেষ্ঠ",
      orthoEn: "Allah is the Greatest",
      defaultCount: 34,
    ),
    DhikrData(
      nameBn: "ছোট তাহলিল",
      nameEn: "Short Tahleel",
      uccharonBn: "লা ইলাহা ইল্লাল্লাহ",
      uccharonEn: "La ilaha illallah",
      orthoBn: "আল্লাহ ছাড়া কোনো উপাস্য নেই",
      orthoEn: "There is no deity except Allah",
      defaultCount: 100,
    ),
    DhikrData(
      nameBn: "পূর্ণ তাহলিল",
      nameEn: "Full Tahleel",
      uccharonBn: "লা ইলাহা ইল্লাল্লাহু ওয়াহদাহু লা শারীকা লাহু",
      uccharonEn: "La ilaha illallahu wahdahu la sharika lahu",
      orthoBn: "আল্লাহ এক, তাঁর কোনো শরিক নেই, সবই তাঁর",
      orthoEn: "Allah is One, He has no partner, all belongs to Him",
      defaultCount: 100,
    ),
    DhikrData(
      nameBn: "ইস্তিগফার",
      nameEn: "Istighfar",
      uccharonBn: "আস্তাগফিরুল্লাহ",
      uccharonEn: "Astaghfirullah",
      orthoBn: "আমি আল্লাহর কাছে ক্ষমা চাই",
      orthoEn: "I seek forgiveness from Allah",
      defaultCount: 70,
    ),
    DhikrData(
      nameBn: "সুবহানাল্লাহিল আজীম",
      nameEn: "Subhanallahi Al-Azeem",
      uccharonBn: "সুবহানাল্লাহিল আজীম ওয়া বিহামদিহি",
      uccharonEn: "Subhanallahi al-azim wa bihamdihi",
      orthoBn: "মহান আল্লাহ পবিত্র ও তাঁর প্রশংসা",
      orthoEn: "Allah, the Great, is Holy and Praiseworthy",
      defaultCount: 100,
    ),
    DhikrData(
      nameBn: "দরূদ শরীফ",
      nameEn: "Durood Sharif",
      uccharonBn: "আল্লাহুম্মা সাল্লি আলা মুহাম্মাদ",
      uccharonEn: "Allahumma salli ala Muhammad",
      orthoBn: "নবী (সা.) এর উপর রহমত প্রেরণ করুন",
      orthoEn: "Send blessings upon the Prophet (PBUH)",
      defaultCount: 100,
    ),
    DhikrData(
      nameBn: "সাধারণ গণনা",
      nameEn: "General Count",
      uccharonBn: "",
      uccharonEn: "",
      orthoBn: "",
      orthoEn: "",
      defaultCount: 999999,
      isGeneral: true,
    ),
  ];

  late DhikrData _currentDhikr;
  late int _targetCount;

  @override
  void initState() {
    super.initState();
    _currentDhikr = _allDhikrs[0];
    _targetCount = _currentDhikr.defaultCount;
  }

  String _formatNumber(String input) {
    if (!_isBangla) return input;
    const english = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9'];
    const bengali = ['০', '১', '২', '৩', '৪', '৫', '৬', '৭', '৮', '৯'];
    for (int i = 0; i < english.length; i++) {
      input = input.replaceAll(english[i], bengali[i]);
    }
    return input;
  }

  void _toggleLanguage() {
    setState(() {
      _isBangla = !_isBangla;
    });
  }

  void _incrementCounter() {
    if (_counter >= _targetCount) return;
    setState(() {
      _counter++;
    });
  }

  void _decrementCounter() {
    if (_counter <= 0) return;
    setState(() {
      _counter--;
    });
  }

  void _resetCounter() {
    setState(() {
      _counter = 0;
    });
  }

  void _updateLocation(String newCity) {
    setState(() {
      _selectedCity = newCity;
    });
  }

  void _showDhikrPicker() {
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
                  _isBangla ? "যিকির নির্বাচন করুন" : "Select Dhikr",
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: 20),
              Expanded(
                child: ListView.builder(
                  itemCount: _allDhikrs.length,
                  itemBuilder: (context, index) {
                    final dhikr = _allDhikrs[index];
                    return ListTile(
                      title: Text(
                        _isBangla ? dhikr.nameBn : dhikr.nameEn,
                        style: TextStyle(
                          color: _currentDhikr == dhikr
                              ? Colors.green.shade600
                              : null,
                          fontWeight:
                              _currentDhikr == dhikr ? FontWeight.bold : null,
                        ),
                      ),
                      trailing: _currentDhikr == dhikr
                          ? Icon(Icons.check_circle,
                              color: Colors.green.shade600)
                          : null,
                      onTap: () {
                        setState(() {
                          _currentDhikr = dhikr;
                          _targetCount = dhikr.defaultCount;
                          _counter = 0;
                        });
                        Navigator.pop(context);
                      },
                    );
                  },
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
    const animationDuration = Duration(milliseconds: 400);
    final mediaQuery = MediaQuery.of(context);
    final double screenWidth = mediaQuery.size.width;

    Widget mainContent;
    switch (_selectedIndex) {
      case 0:
        mainContent = HomePage(
          isDarkMode: widget.isDarkMode,
          isBangla: _isBangla,
          selectedCity: _selectedCity,
          onLocationChanged: _updateLocation,
          onNavigate: (index) => setState(() => _selectedIndex = index),
        );
        break;
      case 1:
        mainContent =
            _buildCounterBody(primaryGreen, animationDuration, screenWidth);
        break;
      case 2:
        mainContent = RamadanPage(
          isDarkMode: widget.isDarkMode,
          isBangla: _isBangla,
          selectedCity: _selectedCity,
          onLocationChanged: _updateLocation,
        );
        break;
      case 3:
        mainContent = PrayerTimesPage(
          isDarkMode: widget.isDarkMode,
          isBangla: _isBangla,
          selectedCity: _selectedCity,
          onLocationChanged: _updateLocation,
        );
        break;
      default:
        mainContent = HomePage(
          isDarkMode: widget.isDarkMode,
          isBangla: _isBangla,
          selectedCity: _selectedCity,
          onLocationChanged: _updateLocation,
          onNavigate: (index) => setState(() => _selectedIndex = index),
        );
    }

    return AnimatedContainer(
      duration: animationDuration,
      decoration: BoxDecoration(
        color: widget.isDarkMode
            ? const Color(0xFF020617)
            : const Color(0xFFF8FAFC),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        extendBodyBehindAppBar: true,
        drawer: _buildDrawer(primaryGreen),
        appBar: _buildAppBar(primaryGreen, screenWidth),
        body: SafeArea(child: mainContent),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selectedIndex,
          onTap: (index) {
            setState(() {
              _selectedIndex = index;
            });
          },
          backgroundColor:
              widget.isDarkMode ? const Color(0xFF0F172A) : Colors.white,
          selectedItemColor: primaryGreen,
          unselectedItemColor: Colors.grey,
          showUnselectedLabels: true,
          type: BottomNavigationBarType.fixed,
          items: [
            BottomNavigationBarItem(
              icon: const Icon(Icons.home),
              label: _isBangla ? "হোম" : "Home",
            ),
            BottomNavigationBarItem(
              icon: const Icon(Icons.fingerprint),
              label: _isBangla ? "তাসবিহ" : "Tasbih",
            ),
            BottomNavigationBarItem(
              icon: const Icon(Icons.calendar_month),
              label: _isBangla ? "ক্যালেন্ডার" : "Calendar",
            ),
            BottomNavigationBarItem(
              icon: const Icon(Icons.access_time),
              label: _isBangla ? "নামাজ" : "Prayer",
            ),
          ],
        ),
      ),
    );
  }

  PreferredSizeWidget _buildAppBar(Color primaryGreen, double screenWidth) {
    String title;
    switch (_selectedIndex) {
      case 0:
        title = _isBangla ? "নূরিফাই" : "Noorify";
        break;
      case 1:
        title = _isBangla ? "ডিজিটাল তাসবিহ" : "Digital Tasbih";
        break;
      case 2:
        title = _isBangla ? "রমজান ক্যালেন্ডার" : "Ramadan Calendar";
        break;
      case 3:
        title = _isBangla ? "নামাজের সময়" : "Prayer Times";
        break;
      default:
        title = _isBangla ? "নূরিফাই" : "Noorify";
    }

    final bool isHome = _selectedIndex == 0;
    final titleColor = widget.isDarkMode ? Colors.white : primaryGreen;

    return AppBar(
      elevation: 0,
      centerTitle: true,
      backgroundColor: Colors.transparent,
      surfaceTintColor: Colors.transparent,
      iconTheme:
          IconThemeData(color: widget.isDarkMode ? Colors.white : primaryGreen),
      title: isHome
          ? Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text("🌙", style: TextStyle(fontSize: 22, color: titleColor)),
                const SizedBox(width: 8),
                Text(
                  title,
                  style: TextStyle(
                    color: titleColor,
                    fontSize: screenWidth < 360 ? 16 : 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            )
          : Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    color: titleColor,
                    fontSize: screenWidth < 360 ? 16 : 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Container(
                  height: 3,
                  width: 25,
                  margin: const EdgeInsets.only(top: 4),
                  decoration: BoxDecoration(
                    color: widget.isDarkMode
                        ? Colors.white.withOpacity(0.5)
                        : primaryGreen.withOpacity(0.4),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ],
            ),
    );
  }

  Widget _buildCounterBody(
      Color primaryGreen, Duration animationDuration, double screenWidth) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 10.0),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 400),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 5),
              InkWell(
                onTap: _showDhikrPicker,
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  decoration: BoxDecoration(
                    color: widget.isDarkMode
                        ? const Color(0xFF1E293B)
                        : Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black.withOpacity(0.05),
                          blurRadius: 10,
                          offset: const Offset(0, 4))
                    ],
                  ),
                  child: Row(
                    children: [
                      Icon(Icons.auto_awesome, color: primaryGreen),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(_isBangla ? "যিকির" : "Dhikr",
                                style: const TextStyle(
                                    fontSize: 12, color: Colors.grey)),
                            Text(
                                _isBangla
                                    ? _currentDhikr.nameBn
                                    : _currentDhikr.nameEn,
                                style: const TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold)),
                          ],
                        ),
                      ),
                      Icon(Icons.keyboard_arrow_down, color: primaryGreen),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 16),
              if (!_currentDhikr.isGeneral)
                _buildTargetCountSelector(primaryGreen),
              const SizedBox(height: 20),
              _buildCounterCard(primaryGreen, animationDuration),
              const SizedBox(height: 30),
              _buildModernActionButtons(primaryGreen),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTargetCountSelector(Color primaryGreen) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: widget.isDarkMode ? const Color(0xFF1E293B) : Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 10,
              offset: const Offset(0, 4))
        ],
      ),
      child: DropdownButtonFormField<int>(
        value: _targetCount > 200 ? 33 : _targetCount,
        isExpanded: true,
        decoration: InputDecoration(
          labelText: _isBangla ? "লক্ষ্য সংখ্যা" : "Target Count",
          labelStyle: const TextStyle(fontSize: 14),
          border: InputBorder.none,
        ),
        dropdownColor:
            widget.isDarkMode ? const Color(0xFF1E293B) : Colors.white,
        style: TextStyle(
            color: widget.isDarkMode ? Colors.white : Colors.black,
            fontSize: 15),
        items: List.generate(200, (index) => index + 1)
            .map((e) => DropdownMenuItem(
                  value: e,
                  child: Text(_formatNumber(e.toString())),
                ))
            .toList(),
        onChanged: (value) {
          if (value == null) return;
          setState(() {
            _targetCount = value;
            if (_counter > _targetCount) _counter = _targetCount;
          });
        },
      ),
    );
  }

  Widget _buildCounterCard(Color primaryGreen, Duration duration) {
    return AnimatedContainer(
      duration: duration,
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 20),
      decoration: BoxDecoration(
        color: widget.isDarkMode ? const Color(0xFF1E293B) : Colors.white,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: primaryGreen, width: 2),
        boxShadow: [
          BoxShadow(
              color: primaryGreen.withOpacity(0.2),
              blurRadius: 20,
              offset: const Offset(0, 10))
        ],
      ),
      child: Column(
        children: [
          if (!_currentDhikr.isGeneral) ...[
            FittedBox(
              fit: BoxFit.scaleDown,
              child: Text(
                _isBangla ? _currentDhikr.uccharonBn : _currentDhikr.uccharonEn,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: widget.isDarkMode ? Colors.white : Colors.black87,
                ),
              ),
            ),
            const SizedBox(height: 4),
            FittedBox(
              fit: BoxFit.scaleDown,
              child: Text(
                _isBangla ? _currentDhikr.orthoBn : _currentDhikr.orthoEn,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 14,
                  color: widget.isDarkMode ? Colors.white60 : Colors.black54,
                  fontStyle: FontStyle.italic,
                ),
              ),
            ),
            const SizedBox(height: 12),
            Text(
              "${_formatNumber(_counter.toString())} / ${_formatNumber(_targetCount.toString())}",
              style: TextStyle(
                  color: primaryGreen,
                  fontWeight: FontWeight.bold,
                  fontSize: 18),
            ),
          ] else
            Text(
              _isBangla ? "মোট গণনা" : "Total Count",
              style: TextStyle(
                  color: primaryGreen,
                  fontWeight: FontWeight.bold,
                  fontSize: 18),
            ),
          const SizedBox(height: 10),
          FittedBox(
            fit: BoxFit.scaleDown,
            child: Text(
              _formatNumber(_counter.toString()),
              style: TextStyle(
                fontSize: 90,
                fontWeight: FontWeight.bold,
                color: widget.isDarkMode ? Colors.white : Colors.black,
              ),
            ),
          ),
          const SizedBox(height: 10),
          Container(
            height: 6,
            width: 80,
            decoration: BoxDecoration(
                color: primaryGreen, borderRadius: BorderRadius.circular(10)),
          ),
        ],
      ),
    );
  }

  Widget _buildModernActionButtons(Color primaryGreen) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Flexible(
          child: _modernActionButton(
            icon: Icons.remove,
            colors: [Colors.red.shade400, Colors.red.shade700],
            onPressed: _decrementCounter,
            size: 48,
          ),
        ),
        const SizedBox(width: 20),
        Flexible(
          child: _modernActionButton(
            icon: Icons.add,
            colors: [primaryGreen, Colors.green.shade800],
            onPressed: _incrementCounter,
            size: 68,
            isLarge: true,
          ),
        ),
        const SizedBox(width: 20),
        Flexible(
          child: _modernActionButton(
            icon: Icons.refresh,
            colors: [Colors.orange.shade700, Colors.orange.shade900],
            onPressed: _resetCounter,
            size: 48,
          ),
        ),
      ],
    );
  }

  Widget _modernActionButton({
    required IconData icon,
    required List<Color> colors,
    required VoidCallback onPressed,
    required double size,
    bool isLarge = false,
  }) {
    return Container(
      width: size,
      height: size,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onPressed,
          customBorder: const CircleBorder(),
          child: Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: LinearGradient(
                colors: colors,
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: Icon(
              icon,
              color: Colors.white,
              size: isLarge ? 30 : 22,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildDrawer(Color primaryGreen) {
    return Drawer(
      backgroundColor:
          widget.isDarkMode ? const Color(0xFF0F172A) : Colors.white,
      child: Column(
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [primaryGreen, Colors.green.shade800],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.2),
                      shape: BoxShape.circle,
                    ),
                    child: const Text("🌙", style: TextStyle(fontSize: 40)),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    _isBangla ? "নূরিফাই" : "Noorify",
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.language, color: primaryGreen),
            title: Text(
              _isBangla ? "Switch to English" : "বাংলা ভাষা করুন",
              style: TextStyle(
                  color: widget.isDarkMode ? Colors.white : Colors.black87),
            ),
            onTap: () {
              _toggleLanguage();
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: Icon(
              widget.isDarkMode ? Icons.light_mode : Icons.dark_mode,
              color: primaryGreen,
            ),
            title: Text(
              _isBangla
                  ? (widget.isDarkMode ? "লাইট মোড" : "ডার্ক মোড")
                  : (widget.isDarkMode ? "Light Mode" : "Dark Mode"),
              style: TextStyle(
                  color: widget.isDarkMode ? Colors.white : Colors.black87),
            ),
            onTap: () {
              widget.onToggleTheme();
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: Icon(Icons.person, color: primaryGreen),
            title: Text(
              _isBangla ? "ডেভেলপার সম্পর্কে" : "About Developer",
              style: TextStyle(
                  color: widget.isDarkMode ? Colors.white : Colors.black87),
            ),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      AboutDeveloperPage(isDarkMode: widget.isDarkMode),
                ),
              );
            },
          ),
          const Divider(),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              "Version 1.0.0",
              style: TextStyle(
                  color: widget.isDarkMode ? Colors.white38 : Colors.grey,
                  fontSize: 12),
            ),
          )
        ],
      ),
    );
  }
}
