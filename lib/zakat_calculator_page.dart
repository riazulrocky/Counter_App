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

  // Approximate Nisab threshold (52.5 tola silver price)
  final double _nisabThreshold = 85000.0; 

  void _calculateZakat() {
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

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          children: [
            const SizedBox(height: 10),
            _buildInputCard(primaryGreen),
            if (_showResult) ...[
              const SizedBox(height: 20),
              _buildResultCard(primaryGreen),
            ],
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

  Widget _buildInputCard(Color primaryGreen) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      color: widget.isDarkMode ? const Color(0xFF1E293B) : Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(widget.isBangla ? "সম্পদের হিসাব দিন" : "Asset Details", style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const Divider(height: 30),
            _buildField(_cashController, widget.isBangla ? "নগদ টাকা" : "Cash in hand", Icons.money),
            _buildField(_goldController, widget.isBangla ? "স্বর্ণের মূল্য" : "Gold Value", Icons.brightness_high),
            _buildField(_silverController, widget.isBangla ? "রুপার মূল্য" : "Silver Value", Icons.brightness_medium),
            _buildField(_investmentController, widget.isBangla ? "বিনিয়োগ" : "Investments", Icons.trending_up),
            _buildField(_debtController, widget.isBangla ? "ঋণ (বাদ যাবে)" : "Debt (Deduction)", Icons.remove_circle_outline, isRed: true),
            const SizedBox(height: 10),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: _calculateZakat,
                style: ElevatedButton.styleFrom(
                  backgroundColor: primaryGreen,
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                ),
                child: Text(widget.isBangla ? "হিসাব করুন" : "Calculate", style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildField(TextEditingController controller, String label, IconData icon, {bool isRed = false}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: TextField(
        controller: controller,
        keyboardType: TextInputType.number,
        style: TextStyle(color: widget.isDarkMode ? Colors.white : Colors.black87),
        decoration: InputDecoration(
          prefixIcon: Icon(icon, color: isRed ? Colors.redAccent : Colors.green),
          labelText: label,
          labelStyle: const TextStyle(fontSize: 14),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
        ),
      ),
    );
  }

  Widget _buildResultCard(Color primaryGreen) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: _isEligible 
              ? [primaryGreen, Colors.green.shade800] 
              : [Colors.red.shade400, Colors.red.shade700],
        ),
        borderRadius: BorderRadius.circular(24),
        boxShadow: [BoxShadow(color: Colors.black26, blurRadius: 15, offset: const Offset(0, 8))],
      ),
      child: Column(
        children: [
          if (_isEligible) ...[
            Text(widget.isBangla ? "আপনার প্রদেয় যাকাত" : "Your Payable Zakat", style: const TextStyle(color: Colors.white70, fontSize: 16)),
            const SizedBox(height: 10),
            Text("${_toBn(_zakatAmount.toStringAsFixed(2))} ৳", style: const TextStyle(color: Colors.white, fontSize: 36, fontWeight: FontWeight.bold)),
          ] else ...[
            const Icon(Icons.info_outline, color: Colors.white, size: 40),
            const SizedBox(height: 10),
            Text(
              widget.isBangla ? "আপনি যাকাত প্রদানের জন্য উপযুক্ত নন" : "You are not eligible for Zakat",
              textAlign: TextAlign.center,
              style: const TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 5),
            Text(
              widget.isBangla ? "(সম্পদ নিসাব পরিমাণ নয়)" : "(Wealth is below Nisab threshold)",
              style: const TextStyle(color: Colors.white70, fontSize: 12),
            ),
          ],
        ],
      ),
    );
  }
}
