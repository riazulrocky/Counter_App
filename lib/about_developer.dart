import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutDeveloperPage extends StatelessWidget {
  final bool isDarkMode;

  const AboutDeveloperPage({super.key, required this.isDarkMode});

  Future<void> _launchLinkedIn() async {
    final Uri url = Uri.parse('https://www.linkedin.com/in/riazulrocky2/');
    if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
      throw Exception('Could not launch $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    final primaryGreen = Colors.green.shade600;

    return Scaffold(
      backgroundColor: isDarkMode ? const Color(0xFF020617) : const Color(0xFFF8FAFC),
      appBar: AppBar(
        title: const Text("About Developer"),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        foregroundColor: isDarkMode ? Colors.white : primaryGreen,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Center(
          child: Column(
            children: [
              const SizedBox(height: 20),
              // Developer Image
              Container(
                width: 180,
                height: 180,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: primaryGreen, width: 4),
                  boxShadow: [
                    BoxShadow(
                      color: primaryGreen.withOpacity(0.2),
                      blurRadius: 20,
                      spreadRadius: 5,
                    )
                  ],
                  image: const DecorationImage(
                    image: AssetImage('assets/developer.png'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(height: 24),
              // Name
              Text(
                "Riazul Hasan Rocky",
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  color: isDarkMode ? Colors.white : Colors.black87,
                ),
              ),
              const SizedBox(height: 4),
              // Profession/Status
              Text(
                "Software Engineer",
                style: TextStyle(
                  fontSize: 18,
                  color: primaryGreen,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 12),
              // LinkedIn Button
              ElevatedButton.icon(
                onPressed: _launchLinkedIn,
                icon: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: const Text(
                    "in",
                    style: TextStyle(
                      color: Color(0xFF0077B5),
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                      fontFamily: 'Arial',
                    ),
                  ),
                ),
                label: const Text("LinkedIn Profile"),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF0077B5),
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
              const SizedBox(height: 24),
              const Divider(),
              const SizedBox(height: 24),
              // Education Section Label
              Row(
                children: [
                  Icon(Icons.school_rounded, size: 20, color: primaryGreen),
                  const SizedBox(width: 8),
                  Text(
                    "Education",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: isDarkMode ? Colors.white : Colors.black87,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              // University Info
              _buildInfoTile(
                icon: Icons.account_balance,
                title: "University",
                value: "Northern University Bangladesh",
                isDarkMode: isDarkMode,
                primaryColor: primaryGreen,
              ),
              _buildInfoTile(
                icon: Icons.computer,
                title: "Department",
                value: "Computer Science & Engineering",
                isDarkMode: isDarkMode,
                primaryColor: primaryGreen,
              ),
              const SizedBox(height: 40),
              Text(
                "Thank you for using Noorify!",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: isDarkMode ? Colors.white54 : Colors.grey,
                  fontStyle: FontStyle.italic,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInfoTile({
    required IconData icon,
    required String title,
    required String value,
    required bool isDarkMode,
    required Color primaryColor,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: primaryColor.withOpacity(0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(icon, color: primaryColor),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 14,
                    color: isDarkMode ? Colors.white54 : Colors.grey,
                  ),
                ),
                Text(
                  value,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: isDarkMode ? Colors.white : Colors.black87,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
