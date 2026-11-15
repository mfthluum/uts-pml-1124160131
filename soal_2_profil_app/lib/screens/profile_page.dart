
import 'package:flutter/material.dart';
import '../models/profile.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

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
        subtitle: Text(value.isEmpty ? 'Belum ditambahkan' : value),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final Profile profile = Profile.initial();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Profil Mahasiswa'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
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

            const SizedBox(height: 16),

            // Informasi Kontak
            Card(
              elevation: 2,
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Informasi Kontak',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 12),

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
              ),
            ),

            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
