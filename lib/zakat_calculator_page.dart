import 'package:flutter/material.dart';

class ZakatCalculatorPage extends StatefulWidget {
  final bool isDarkMode;
  final bool isBangla;

  const ZakatCalculatorPage({super.key, required this.isDarkMode, required this.isBangla});

  @override
  State<ZakatCalculatorPage> createState() => _ZakatCalculatorPageState();
}

class _ZakatCalculatorPageState extends State<ZakatCalculatorPage> {
  final TextEditingController _cashController = TextEditingController();
  final TextEditingController _goldController = TextEditingController();
  final TextEditingController _silverController = TextEditingController();
  final TextEditingController _investmentController = TextEditingController();
  final TextEditingController _debtController = TextEditingController();

  double _zakatAmount = 0.0;
  bool _showResult = false;
  bool _isEligible = true;

  final double _nisabThreshold = 85000.0; 

  void _calculateZakat() {
    FocusScope.of(context).unfocus();
    double cash = double.tryParse(_cashController.text) ?? 0;
    double gold = double.tryParse(_goldController.text) ?? 0;
    double silver = double.tryParse(_silverController.text) ?? 0;
    double investment = double.tryParse(_investmentController.text) ?? 0;
    double debt = double.tryParse(_debtController.text) ?? 0;

    double netAssets = (cash + gold + silver + investment) - debt;
    
    setState(() {
      if (netAssets >= _nisabThreshold) {
        _zakatAmount = netAssets * 0.025;
        _isEligible = true;
      } else {
        _zakatAmount = 0;
        _isEligible = false;
      }
      _showResult = true;
    });
  }

  void _resetFields() {
    setState(() {
      _cashController.clear();
      _goldController.clear();
      _silverController.clear();
      _investmentController.clear();
      _debtController.clear();
      _showResult = false;
    });
  }

  String _toBn(String input) {
    if (!widget.isBangla) return input;
    const eng = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9'];
    const bng = ['০', '১', '২', '৩', '৪', '৫', '৬', '৭', '৮', '৯'];
    for (int i = 0; i < eng.length; i++) {
      input = input.replaceAll(eng[i], bng[i]);
    }
    return input;
  }

  @override
  Widget build(BuildContext context) {
    final primaryGreen = Colors.green.shade600;
    final surfaceColor = widget.isDarkMode ? const Color(0xFF1E293B) : Colors.white;
    final textColor = widget.isDarkMode ? Colors.white : Colors.black87;
    final scaffoldBg = widget.isDarkMode ? const Color(0xFF0F172A) : const Color(0xFFF8FAFC);

    return Scaffold(
      backgroundColor: scaffoldBg,
      body: LayoutBuilder(
        builder: (context, constraints) {
          final double maxWidth = constraints.maxWidth;
          final double horizontalPadding = (maxWidth * 0.05).clamp(16.0, 100.0);

          return GestureDetector(
            onTap: () => FocusScope.of(context).unfocus(),
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              padding: EdgeInsets.symmetric(horizontal: horizontalPadding, vertical: 16),
              child: Center(
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 800),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildSectionTitle(widget.isBangla ? "আর্থিক সম্পদ" : "Financial Assets", Icons.account_balance_wallet_rounded, primaryGreen, maxWidth),
                      _buildCard([
                        _buildField(_cashController, widget.isBangla ? "নগদ টাকা (হাতে/ব্যাংকে)" : "Cash in hand / Bank", Icons.payments_rounded, primaryGreen, maxWidth),
                        _buildField(_goldController, widget.isBangla ? "স্বর্ণের বাজারমূল্য" : "Gold Market Value", Icons.brightness_high_rounded, primaryGreen, maxWidth),
                        _buildField(_silverController, widget.isBangla ? "রুপার বাজারমূল্য" : "Silver Market Value", Icons.brightness_medium_rounded, primaryGreen, maxWidth),
                        _buildField(_investmentController, widget.isBangla ? "অন্যান্য বিনিয়োগ" : "Investments & Others", Icons.trending_up_rounded, primaryGreen, maxWidth),
                      ], surfaceColor, maxWidth),
                      const SizedBox(height: 24),
                      _buildSectionTitle(widget.isBangla ? "ঋণ ও দায়" : "Liabilities & Debts", Icons.remove_circle_outline_rounded, Colors.redAccent, maxWidth),
                      _buildCard([
                        _buildField(_debtController, widget.isBangla ? "মোট ঋণের পরিমাণ" : "Total Outstanding Debts", Icons.money_off_rounded, Colors.redAccent, maxWidth),
                      ], surfaceColor, maxWidth),
                      const SizedBox(height: 32),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            height: (maxWidth * 0.1).clamp(40.0, 50.0),
                            width: (maxWidth * 0.35).clamp(120.0, 160.0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              gradient: LinearGradient(colors: [primaryGreen, Colors.green.shade800]),
                              boxShadow: [
                                BoxShadow(
                                  color: primaryGreen.withOpacity(0.3),
                                  blurRadius: 8,
                                  offset: const Offset(0, 4),
                                )
                              ],
                            ),
                            child: ElevatedButton(
                              onPressed: _calculateZakat,
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.transparent,
                                shadowColor: Colors.transparent,
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                                padding: EdgeInsets.zero,
                              ),
                              child: Text(
                                widget.isBangla ? "হিসাব করুন" : "Calculate",
                                style: TextStyle(fontSize: (maxWidth * 0.035).clamp(13.0, 15.0), fontWeight: FontWeight.bold, color: Colors.white),
                              ),
                            ),
                          ),
                          const SizedBox(width: 16),
                          SizedBox(
                            height: (maxWidth * 0.1).clamp(40.0, 50.0),
                            width: (maxWidth * 0.25).clamp(80.0, 110.0),
                            child: OutlinedButton(
                              onPressed: _resetFields,
                              style: OutlinedButton.styleFrom(
                                side: BorderSide(color: widget.isDarkMode ? Colors.white24 : Colors.grey.shade300, width: 1.5),
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                                padding: EdgeInsets.zero,
                              ),
                              child: Text(
                                widget.isBangla ? "রিসেট" : "Reset",
                                style: TextStyle(fontSize: (maxWidth * 0.035).clamp(13.0, 15.0), fontWeight: FontWeight.w600, color: textColor.withOpacity(0.7)),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 32),
                      if (_showResult) 
                        _buildResultCard(primaryGreen, maxWidth),
                      const SizedBox(height: 40),
                    ],
                  ),
                ),
              ),
            ),
          );
        }
      ),
    );
  }

  Widget _buildSectionTitle(String title, IconData icon, Color color, double maxWidth) {
    return Padding(
      padding: const EdgeInsets.only(left: 4, bottom: 12),
      child: Row(
        children: [
          Icon(icon, size: (maxWidth * 0.045).clamp(16.0, 20.0), color: color),
          const SizedBox(width: 8),
          Text(
            title,
            style: TextStyle(
              fontSize: (maxWidth * 0.04).clamp(14.0, 18.0),
              fontWeight: FontWeight.bold,
              color: color,
              letterSpacing: 0.5,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCard(List<Widget> children, Color bgColor, double maxWidth) {
    return Container(
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(widget.isDarkMode ? 0.2 : 0.04),
            blurRadius: 15,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Padding(
        padding: EdgeInsets.all((maxWidth * 0.05).clamp(16.0, 24.0)),
        child: Column(children: children),
      ),
    );
  }

  Widget _buildField(TextEditingController controller, String label, IconData icon, Color accentColor, double maxWidth) {
    final double fontSize = (maxWidth * 0.038).clamp(13.0, 16.0);
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: TextField(
        controller: controller,
        keyboardType: TextInputType.number,
        style: TextStyle(
          color: widget.isDarkMode ? Colors.white : Colors.black87,
          fontSize: fontSize,
        ),
        decoration: InputDecoration(
          prefixIcon: Icon(icon, color: accentColor.withOpacity(0.7), size: (maxWidth * 0.05).clamp(18.0, 22.0)),
          labelText: label,
          labelStyle: TextStyle(
            color: widget.isDarkMode ? Colors.white60 : Colors.black45,
            fontSize: fontSize * 0.9,
          ),
          hintText: "0.00",
          hintStyle: TextStyle(color: widget.isDarkMode ? Colors.white10 : Colors.black12),
          filled: true,
          fillColor: widget.isDarkMode ? Colors.white.withOpacity(0.03) : Colors.grey.shade50,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(14),
            borderSide: BorderSide.none,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(14),
            borderSide: BorderSide.none,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(14),
            borderSide: BorderSide(color: accentColor.withOpacity(0.5), width: 1.5),
          ),
          contentPadding: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
        ),
      ),
    );
  }

  Widget _buildResultCard(Color primaryGreen, double maxWidth) {
    final double padding = (maxWidth * 0.07).clamp(20.0, 32.0);
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(28),
        gradient: LinearGradient(
          colors: _isEligible 
              ? [primaryGreen, Colors.green.shade800] 
              : [Colors.orange.shade700, Colors.deepOrange.shade900],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        boxShadow: [
          BoxShadow(
            color: (_isEligible ? primaryGreen : Colors.orange).withOpacity(0.3),
            blurRadius: 20,
            offset: const Offset(0, 10),
          )
        ],
      ),
      child: Stack(
        children: [
          Positioned(
            right: -20,
            bottom: -20,
            child: Icon(
              _isEligible ? Icons.check_circle_outline : Icons.info_outline,
              size: (maxWidth * 0.3).clamp(100.0, 150.0),
              color: Colors.white10,
            ),
          ),
          Padding(
            padding: EdgeInsets.all(padding),
            child: Column(
              children: [
                if (_isEligible) ...[
                  Text(
                    widget.isBangla ? "আপনার প্রদেয় যাকাত" : "Total Payable Zakat",
                    style: TextStyle(color: Colors.white70, fontSize: (maxWidth * 0.04).clamp(14.0, 18.0), fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(height: 12),
                  FittedBox(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        Text(
                          _toBn(_zakatAmount.toStringAsFixed(2)),
                          style: TextStyle(color: Colors.white, fontSize: (maxWidth * 0.1).clamp(32.0, 48.0), fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(width: 8),
                        Text("৳", style: TextStyle(color: Colors.white70, fontSize: (maxWidth * 0.06).clamp(20.0, 28.0), fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ),
                ] else ...[
                  Icon(Icons.info_outline_rounded, color: Colors.white, size: (maxWidth * 0.12).clamp(40.0, 56.0)),
                  const SizedBox(height: 16),
                  Text(
                    widget.isBangla ? "আপনি যাকাত প্রদানের জন্য উপযুক্ত নন" : "Not Eligible for Zakat",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white, fontSize: (maxWidth * 0.045).clamp(16.0, 20.0), fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    widget.isBangla 
                      ? "আপনার মোট সম্পদ নিসাব (৳${_nisabThreshold.toInt()}) পরিমাণ নয়" 
                      : "Your wealth is below the Nisab (৳${_nisabThreshold.toInt()}) threshold.",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white70, fontSize: (maxWidth * 0.035).clamp(12.0, 14.0), height: 1.4),
                  ),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }
}
