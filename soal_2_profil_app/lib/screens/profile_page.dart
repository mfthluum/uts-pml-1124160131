
import 'package:flutter/material.dart';
import '../models/profile.dart';
import 'edit_profile_page.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  int _selectedIndex = 0;

  late Profile profile;

  @override
  void initState() {
    super.initState();
    profile = Profile.initial();
  }

  // Fungsi untuk membuka halaman Edit Profil
  Future<void> _editProfile() async {
    final Profile? dataBaru = await Navigator.push<Profile>(
      context,
      MaterialPageRoute(
        builder: (context) => EditProfilePage(profile: profile),
      ),
    );

    if (dataBaru != null) {
      setState(() {
        profile = dataBaru;
      });
    }
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    Navigator.pop(context);
  }

  Widget buildContactCard({
    required IconData icon,
    required String title,
    required String value,
  }) {
    return Card(
      elevation: 2,
      margin: const EdgeInsets.only(bottom: 10),
      child: ListTile(
        leading: Icon(icon, color: Colors.green, size: 28),
        title: Text(title),
        subtitle: Text(value),
      ),
    );
  }

  Widget buildProfileContent() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          const SizedBox(height: 20),

          // Foto Profil
          CircleAvatar(
            radius: 60,
            backgroundColor: Colors.green.shade100,
            child: ClipOval(
              child: Image.asset(
                profile.foto,
                width: 120,
                height: 120,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return const Icon(
                    Icons.person,
                    size: 70,
                    color: Colors.green,
                  );
                },
              ),
            ),
          ),

          const SizedBox(height: 16),

          // Identitas Mahasiswa
          Text(
            profile.nama,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 8),

          Text(
            profile.nim,
            style: TextStyle(
              fontSize: 15,
              color: Colors.grey.shade600,
            ),
          ),

          const SizedBox(height: 20),

          // Informasi Akademik
          Card(
            elevation: 2,
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  const Text(
                    'Informasi Akademik',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Divider(height: 24),
                  ListTile(
                    leading: const Icon(Icons.school),
                    title: const Text('Program Studi'),
                    subtitle: Text(profile.programStudi),
                  ),
                  ListTile(
                    leading: const Icon(Icons.groups),
                    title: const Text('Kelas'),
                    subtitle: Text(profile.kelas),
                  ),
                ],
              ),
            ),
          ),

          const SizedBox(height: 16),

          // Tentang Saya
          Card(
            elevation: 2,
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Tentang Saya',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    profile.bio,
                    textAlign: TextAlign.justify,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildContactContent() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Informasi Kontak',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 16),

          buildContactCard(
            icon: Icons.email,
            title: 'Email',
            value: profile.email,
          ),

          buildContactCard(
            icon: Icons.phone,
            title: 'Nomor HP',
            value: profile.nomorHp,
          ),

          buildContactCard(
            icon: Icons.code,
            title: 'GitHub',
            value: profile.github,
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          _selectedIndex == 0 ? 'Profil Mahasiswa' : 'Kontak Saya',
        ),
        centerTitle: true,

        // Tombol Edit Profil
        actions: [
          IconButton(
            onPressed: _editProfile,
            icon: const Icon(Icons.edit),
            tooltip: 'Edit Profil',
          ),
        ],
      ),

      // Drawer
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            UserAccountsDrawerHeader(
              decoration: const BoxDecoration(
                color: Color(0xFF176B5B),
              ),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.white,
                child: ClipOval(
                  child: Image.asset(
                    profile.foto,
                    width: 55,
                    height: 55,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return const Icon(
                        Icons.person,
                        size: 35,
                        color: Colors.green,
                      );
                    },
                  ),
                ),
              ),
              accountName: Text(profile.nama),
              accountEmail: Text(profile.nim),
            ),

            ListTile(
              leading: const Icon(Icons.person),
              title: const Text('Profil Mahasiswa'),
              selected: _selectedIndex == 0,
              onTap: () => _onItemTapped(0),
            ),

            ListTile(
              leading: const Icon(Icons.contact_mail),
              title: const Text('Informasi Kontak'),
              selected: _selectedIndex == 1,
              onTap: () => _onItemTapped(1),
            ),
          ],
        ),
      ),

      // Konten Halaman
      body: _selectedIndex == 0
          ? buildProfileContent()
          : buildContactContent(),

      // Bottom Navigation Bar
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profil',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.contact_mail),
            label: 'Kontak',
          ),
        ],
      ),
    );
  }
}
