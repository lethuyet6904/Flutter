import 'package:flutter/material.dart';
import '../model/user.dart';
import 'my_login.dart';

class MyProfile extends StatelessWidget {
  final User user;
  const MyProfile({super.key, required this.user});

  final Color _primaryColor = const Color(0xFF2E7D32);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      
      appBar: AppBar(
        backgroundColor: _primaryColor,
        elevation: 0,
        centerTitle: true,
        title: const Text("My Profile", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout, color: Colors.white),
            onPressed: () {
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => const MyLogin()));
            },
          )
        ],
      ),
      
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 10, offset: const Offset(0, 4))
                ],
              ),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 35,
                    backgroundColor: _primaryColor.withOpacity(0.1),
                    backgroundImage: user.image.isNotEmpty ? NetworkImage(user.image) : null,
                    child: user.image.isEmpty ? Icon(Icons.person, size: 35, color: _primaryColor) : null,
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          user.fullName,
                          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black87),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          user.email,
                          style: TextStyle(fontSize: 14, color: Colors.grey[600]),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),

            _buildSectionHeader("Personal Information"),
            _buildInfoCard([
              _buildListTile(Icons.phone, "Phone", user.phone),
              _buildDivider(),
              _buildListTile(Icons.cake, "Birthday", user.birthDate),
              _buildDivider(),
              _buildListTile(Icons.person_outline, "Gender", user.gender),
            ]),

            const SizedBox(height: 24),

            _buildSectionHeader("Address"),
            _buildInfoCard([
              _buildListTile(Icons.location_on_outlined, "Street", user.address),
              _buildDivider(),
              _buildListTile(Icons.location_city, "City", user.city),
            ]),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionHeader(String title) {
    return Padding(
      padding: const EdgeInsets.only(left: 4, bottom: 12),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          title.toUpperCase(),
          style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Colors.grey[600], letterSpacing: 1.2),
        ),
      ),
    );
  }

  Widget _buildInfoCard(List<Widget> children) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.02), blurRadius: 5)],
      ),
      child: Column(children: children),
    );
  }

  // Dòng thông tin chi tiết
  Widget _buildListTile(IconData icon, String title, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      child: Row(
        children: [
          Icon(icon, color: _primaryColor.withOpacity(0.8), size: 22),
          const SizedBox(width: 16),
          Text(title, style: const TextStyle(fontSize: 15, color: Colors.black54)),
          const Spacer(),
          Text(value, style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w600, color: Colors.black87)),
        ],
      ),
    );
  }

  Widget _buildDivider() {
    return Divider(height: 1, thickness: 1, color: Colors.grey[100], indent: 54);
  }
}