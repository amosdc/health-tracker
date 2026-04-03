import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfileWidget extends StatelessWidget {
  const ProfileWidget({super.key});

  static const String routeName = 'Profile';
  static const String routePath = '/profile';

  // Konfigurasi palet warna native (menggantikan FlutterFlowTheme)
  static const Color primaryColor = Color(0xFF6C63FF);
  static const Color backgroundColor = Color(0xFF0F1117);
  static const Color secondaryBackgroundColor = Color(0xFF1C1F2B);
  static const Color primaryTextColor = Colors.white;
  static const Color secondaryTextColor = Color(0xFF8A8FA8);
  static const Color dividerColor = Color(0xFF2A2D3E);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: backgroundColor,
        automaticallyImplyLeading: true, // Ubah ke true agar bisa kembali ke Home
        iconTheme: const IconThemeData(color: primaryTextColor),
        title: Text(
          'My Health Profile',
          style: GoogleFonts.interTight(
            fontWeight: FontWeight.bold,
            color: primaryTextColor,
            fontSize: 20,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: IconButton(
              icon: const Icon(Icons.edit_rounded, color: primaryColor, size: 24),
              onPressed: () {
                debugPrint('Edit Profile pressed ...');
              },
            ),
          ),
        ],
        centerTitle: false,
        elevation: 0,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              // HEADER BAGIAN FOTO PROFIL
              SizedBox(
                width: double.infinity,
                height: 200,
                child: Stack(
                  children: [
                    Container(
                      width: double.infinity,
                      height: 160,
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          colors: [primaryColor, Color(0xFF6A11CB)],
                          begin: Alignment.bottomRight,
                          end: Alignment.topLeft,
                        ),
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      height: 160,
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          colors: [Colors.transparent, Color(0x33000000)],
                          stops: [0.6, 1],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        width: 100,
                        height: 100,
                        decoration: BoxDecoration(
                          image: const DecorationImage(
                            fit: BoxFit.cover,
                            // Ganti dengan aset valid milikmu atau gunakan placeholder network
                            image: AssetImage('assets/images/WIN_20260213_10_31_33_Pro.jpg'),
                          ),
                          shape: BoxShape.circle,
                          border: Border.all(color: backgroundColor, width: 4),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              
              // NAMA DAN ID PATIENT
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 8, 16, 0),
                child: Column(
                  children: [
                    Text(
                      'Farras Iqbal', // Ganti dengan data dinamis jika perlu
                      style: GoogleFonts.interTight(
                        fontWeight: FontWeight.bold,
                        color: primaryTextColor,
                        fontSize: 22,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'Patient ID: #HP-20240115',
                      style: GoogleFonts.inter(
                        color: secondaryTextColor,
                        fontSize: 13,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 24),

              // RINGKASAN METRIK (UMUR, TINGGI, BERAT)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _buildMetricCard('21', 'Age', const [primaryColor, Color(0xFF6A11CB)]),
                    _buildMetricCard('171 cm', 'Height', const [Color(0xFF11998E), Color(0xFF38EF7D)]),
                    _buildMetricCard('62 kg', 'Weight', const [Color(0xFFFF6B6B), Color(0xFFFECA57)]),
                  ],
                ),
              ),

              const SizedBox(height: 18),

              // KARTU PERSONAL INFORMATION
              _buildSectionCard(
                icon: Icons.person_outline_rounded,
                iconColor: primaryColor,
                iconBgColor: const Color(0x336C63FF),
                title: 'Personal Information',
                children: [
                  _buildDataRow('Full Name', 'Farras Iqbal Tawakal'),
                  const SizedBox(height: 12),
                  _buildDataRow('Date of Birth', '15 Jan 2005'),
                  const SizedBox(height: 12),
                  _buildDataRowBadge('Gender', 'Male', primaryColor, const Color(0x336C63FF)),
                  const SizedBox(height: 12),
                  _buildDataRowBadge('Blood Type', 'O+', const Color(0xFFFF4444), const Color(0x1FFF4444)),
                  const SizedBox(height: 12),
                  _buildDataRow('BMI', '22.2 (Normal)', valueColor: const Color(0xFF38EF7D)),
                  const SizedBox(height: 12),
                  _buildDataRow('Phone Number', '+62 812-3456-7890'),
                ],
              ),

              const SizedBox(height: 16),

              // KARTU VITAL STATISTICS
              _buildSectionCard(
                icon: Icons.favorite_border_rounded,
                iconColor: const Color(0xFFFF6B6B),
                iconBgColor: const Color(0x1FFF6B6B),
                title: 'Vital Statistics',
                children: [
                  _buildVitalRow('Heart Rate', '72 bpm', Icons.favorite_rounded, const Color(0xFFFF6B6B)),
                  const SizedBox(height: 12),
                  _buildDataRow('Blood Pressure', '120/80 mmHg'),
                  const SizedBox(height: 12),
                  _buildDataRow('Blood Sugar', '95 mg/dL'),
                  const SizedBox(height: 12),
                  _buildDataRow('Cholesterol', '180 mg/dL'),
                  const SizedBox(height: 12),
                  _buildVitalRow('Oxygen Saturation', '98%', Icons.water_drop_outlined, primaryColor),
                ],
              ),

              const SizedBox(height: 16),

              // KARTU MEDICAL HISTORY
              _buildSectionCard(
                icon: Icons.medical_services_outlined,
                iconColor: const Color(0xFFFECA57),
                iconBgColor: const Color(0x1FFECA57),
                title: 'Medical History',
                children: [
                  _buildListTitle('Diagnosed Conditions'),
                  const SizedBox(height: 8),
                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: [
                      _buildPillBadge('Hypertension', const Color(0xFFFF6B6B)),
                      _buildPillBadge('Type 2 Diabetes', const Color(0xFFFF6B6B)),
                    ],
                  ),
                  const SizedBox(height: 16),
                  const Divider(height: 1, color: dividerColor),
                  const SizedBox(height: 16),
                  
                  _buildListTitle('Past Surgeries'),
                  const SizedBox(height: 8),
                  _buildIconTextRow(Icons.history_rounded, 'Acl (2023)'),
                  const SizedBox(height: 16),
                  const Divider(height: 1, color: dividerColor),
                  const SizedBox(height: 16),
                  
                  _buildListTitle('Family History'),
                  const SizedBox(height: 8),
                  _buildIconTextRow(Icons.people_outline, 'Heart Disease (Father)'),
                  const SizedBox(height: 8),
                  _buildIconTextRow(Icons.people_outline, 'Diabetes (Mother)'),
                ],
              ),

              const SizedBox(height: 32),
            ],
          ),
        ),
      ),
    );
  }

  // ==== HELPER WIDGETS (Dibuat terpisah agar kode build() tetap bersih) ====

  Widget _buildMetricCard(String value, String label, List<Color> gradientColors) {
    return Container(
      width: 100,
      height: 80,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: gradientColors,
          begin: Alignment.bottomRight,
          end: Alignment.topLeft,
        ),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            value,
            style: GoogleFonts.interTight(
              fontWeight: FontWeight.bold,
              color: Colors.white,
              fontSize: value.contains('cm') || value.contains('kg') ? 18 : 22,
            ),
          ),
          Text(
            label,
            style: GoogleFonts.inter(
              color: const Color(0xCCFFFFFF),
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSectionCard({
    required IconData icon,
    required Color iconColor,
    required Color iconBgColor,
    required String title,
    required List<Widget> children,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: secondaryBackgroundColor,
          borderRadius: BorderRadius.circular(16),
          boxShadow: const [
            BoxShadow(blurRadius: 8, color: Color(0x1A000000), offset: Offset(0, 2)),
          ],
        ),
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  width: 36,
                  height: 36,
                  decoration: BoxDecoration(color: iconBgColor, shape: BoxShape.circle),
                  child: Icon(icon, color: iconColor, size: 20),
                ),
                const SizedBox(width: 8),
                Text(
                  title,
                  style: GoogleFonts.interTight(
                    fontWeight: FontWeight.bold,
                    color: primaryTextColor,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            const Divider(height: 1, color: dividerColor),
            const SizedBox(height: 16),
            ...children,
          ],
        ),
      ),
    );
  }

  Widget _buildDataRow(String label, String value, {Color valueColor = primaryTextColor}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: GoogleFonts.inter(color: secondaryTextColor, fontSize: 14),
        ),
        Text(
          value,
          style: GoogleFonts.inter(
            fontWeight: FontWeight.w600,
            color: valueColor,
            fontSize: 14,
          ),
        ),
      ],
    );
  }

  Widget _buildDataRowBadge(String label, String badgeText, Color textColor, Color bgColor) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label, style: GoogleFonts.inter(color: secondaryTextColor, fontSize: 14)),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
          decoration: BoxDecoration(
            color: bgColor,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Text(
            badgeText,
            style: GoogleFonts.inter(
              fontWeight: FontWeight.w600,
              color: textColor,
              fontSize: 13,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildVitalRow(String label, String value, IconData icon, Color iconColor) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label, style: GoogleFonts.inter(color: secondaryTextColor, fontSize: 14)),
        Row(
          children: [
            Icon(icon, color: iconColor, size: 16),
            const SizedBox(width: 4),
            Text(
              value,
              style: GoogleFonts.inter(
                fontWeight: FontWeight.w600,
                color: primaryTextColor,
                fontSize: 14,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildListTitle(String title) {
    return Text(
      title,
      style: GoogleFonts.inter(
        fontWeight: FontWeight.w600,
        color: secondaryTextColor,
        fontSize: 12,
      ),
    );
  }

  Widget _buildPillBadge(String text, Color color) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: color.withOpacity(0.12),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: color.withOpacity(0.2), width: 1),
      ),
      child: Text(
        text,
        style: GoogleFonts.inter(fontWeight: FontWeight.w600, color: color, fontSize: 12),
      ),
    );
  }

  Widget _buildIconTextRow(IconData icon, String text) {
    return Row(
      children: [
        Icon(icon, color: secondaryTextColor, size: 16),
        const SizedBox(width: 8),
        Text(
          text,
          style: GoogleFonts.inter(color: primaryTextColor, fontSize: 13),
        ),
      ],
    );
  }
}