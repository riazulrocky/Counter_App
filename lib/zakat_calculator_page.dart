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
          final double horizontalPadding = maxWidth > 600 ? maxWidth * 0.15 : 20.0;

          return GestureDetector(
            onTap: () => FocusScope.of(context).unfocus(),
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              padding: EdgeInsets.symmetric(horizontal: horizontalPadding, vertical: 16),
              child: Center(
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 600),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildSectionTitle(widget.isBangla ? "আর্থিক সম্পদ" : "Financial Assets", Icons.account_balance_wallet_rounded, primaryGreen),
                      _buildCard([
                        _buildField(_cashController, widget.isBangla ? "নগদ টাকা (হাতে/ব্যাংকে)" : "Cash in hand / Bank", Icons.payments_rounded, primaryGreen),
                        _buildField(_goldController, widget.isBangla ? "স্বর্ণের বাজারমূল্য" : "Gold Market Value", Icons.brightness_high_rounded, primaryGreen),
                        _buildField(_silverController, widget.isBangla ? "রুপার বাজারমূল্য" : "Silver Market Value", Icons.brightness_medium_rounded, primaryGreen),
                        _buildField(_investmentController, widget.isBangla ? "অন্যান্য বিনিয়োগ" : "Investments & Others", Icons.trending_up_rounded, primaryGreen),
                      ], surfaceColor),
                      const SizedBox(height: 24),
                      _buildSectionTitle(widget.isBangla ? "ঋণ ও দায়" : "Liabilities & Debts", Icons.remove_circle_outline_rounded, Colors.redAccent),
                      _buildCard([
                        _buildField(_debtController, widget.isBangla ? "মোট ঋণের পরিমাণ" : "Total Outstanding Debts", Icons.money_off_rounded, Colors.redAccent),
                      ], surfaceColor),
                      const SizedBox(height: 32),
                      Row(
                        children: [
                          Expanded(
                            flex: 2,
                            child: Container(
                              height: 56,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16),
                                gradient: LinearGradient(colors: [primaryGreen, Colors.green.shade800]),
                                boxShadow: [
                                  BoxShadow(
                                    color: primaryGreen.withOpacity(0.3),
                                    blurRadius: 12,
                                    offset: const Offset(0, 6),
                                  )
                                ],
                              ),
                              child: ElevatedButton(
                                onPressed: _calculateZakat,
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.transparent,
                                  shadowColor: Colors.transparent,
                                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                                ),
                                child: Text(
                                  widget.isBangla ? "হিসাব করুন" : "Calculate",
                                  style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            flex: 1,
                            child: SizedBox(
                              height: 56,
                              child: OutlinedButton(
                                onPressed: _resetFields,
                                style: OutlinedButton.styleFrom(
                                  side: BorderSide(color: widget.isDarkMode ? Colors.white24 : Colors.grey.shade300),
                                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                                ),
                                child: Text(
                                  widget.isBangla ? "রিসেট" : "Reset",
                                  style: TextStyle(color: textColor.withOpacity(0.7)),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 32),
                      if (_showResult) 
                        _buildResultCard(primaryGreen),
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

  Widget _buildSectionTitle(String title, IconData icon, Color color) {
    return Padding(
      padding: const EdgeInsets.only(left: 4, bottom: 12),
      child: Row(
        children: [
          Icon(icon, size: 18, color: color),
          const SizedBox(width: 8),
          Text(
            title,
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
              color: color,
              letterSpacing: 0.5,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCard(List<Widget> children, Color bgColor) {
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
        padding: const EdgeInsets.all(20),
        child: Column(children: children),
      ),
    );
  }

  Widget _buildField(TextEditingController controller, String label, IconData icon, Color accentColor) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: TextField(
        controller: controller,
        keyboardType: TextInputType.number,
        style: TextStyle(
          color: widget.isDarkMode ? Colors.white : Colors.black87,
          fontSize: 15,
        ),
        decoration: InputDecoration(
          prefixIcon: Icon(icon, color: accentColor.withOpacity(0.7), size: 20),
          labelText: label,
          labelStyle: TextStyle(
            color: widget.isDarkMode ? Colors.white60 : Colors.black45,
            fontSize: 14,
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

  Widget _buildResultCard(Color primaryGreen) {
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
              size: 120,
              color: Colors.white.withOpacity(0.1),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(28),
            child: Column(
              children: [
                if (_isEligible) ...[
                  Text(
                    widget.isBangla ? "আপনার প্রদেয় যাকাত" : "Total Payable Zakat",
                    style: const TextStyle(color: Colors.white70, fontSize: 16, fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(height: 12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(
                        _toBn(_zakatAmount.toStringAsFixed(2)),
                        style: const TextStyle(color: Colors.white, fontSize: 42, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(width: 8),
                      const Text("৳", style: TextStyle(color: Colors.white70, fontSize: 24, fontWeight: FontWeight.bold)),
                    ],
                  ),
                ] else ...[
                  const Icon(Icons.info_outline_rounded, color: Colors.white, size: 48),
                  const SizedBox(height: 16),
                  Text(
                    widget.isBangla ? "আপনি যাকাত প্রদানের জন্য উপযুক্ত নন" : "Not Eligible for Zakat",
                    textAlign: TextAlign.center,
                    style: const TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    widget.isBangla 
                      ? "আপনার মোট সম্পদ নিসাব (৳${_nisabThreshold.toInt()}) পরিমাণ নয়" 
                      : "Your wealth is below the Nisab (৳${_nisabThreshold.toInt()}) threshold.",
                    textAlign: TextAlign.center,
                    style: const TextStyle(color: Colors.white70, fontSize: 13, height: 1.4),
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
