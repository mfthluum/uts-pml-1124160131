
import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  final List<Map<String, dynamic>> pendidikan = const [
    {
      'nama': 'Global Institute of Technology & Business',
      'jurusan': 'S1 Teknik Informatika',
      'icon': Icons.school,
    },
    {
      'nama': 'SMK Azzahra Sepatan',
      'jurusan': 'Sekolah Menengah Kejuruan',
      'icon': Icons.school,
    },
    {
      'nama': 'SMPN 3 Sepatan',
      'jurusan': 'Sekolah Menengah Pertama',
      'icon': Icons.school,
    },
    {
      'nama': 'SDN Sarakan 4',
      'jurusan': 'Sekolah Dasar',
      'icon': Icons.school,
    },
    {
      'nama': 'TK Hidayatul Mustafid',
      'jurusan': 'Taman Kanak-Kanak',
      'icon': Icons.child_care,
    },
  ];

  final List<Map<String, dynamic>> keahlian = const [
    {
      'nama': 'Bahasa Arab Nahwu dan Shorof Dasar',
      'icon': Icons.menu_book,
    },
    {
      'nama': 'Bahasa Inggris Dasar',
      'icon': Icons.language,
    },
    {
      'nama': 'Microsoft Office',
      'icon': Icons.computer,
    },
    {
      'nama': 'Desain UI/UX',
      'icon': Icons.design_services,
    },
    {
      'nama': 'Pemrograman Dasar',
      'icon': Icons.code,
    },
  ];

  final List<Map<String, dynamic>> hobi = const [
    {
      'nama': 'Menulis Refleksi',
      'icon': Icons.edit_note,
    },
    {
      'nama': 'Traveling',
      'icon': Icons.flight_takeoff,
    },
    {
      'nama': 'Hiking',
      'icon': Icons.terrain,
    },
  ];

  @override
  Widget build(BuildContext context) {
    final warna = Theme.of(context).colorScheme;

    return ListView(
      padding: const EdgeInsets.all(20),
      children: [
        // Header Identitas
        Center(
          child: Column(
            children: [
              CircleAvatar(
                radius: 45,
                backgroundColor: warna.primaryContainer,
                child: Icon(
                  Icons.person,
                  size: 50,
                  color: warna.onPrimaryContainer,
                ),
              ),
              const SizedBox(height: 12),
              Text(
                'Muhamad Miftahul Ulum',
                textAlign: TextAlign.center,
                style: Theme.of(context)
                    .textTheme
                    .titleLarge
                    ?.copyWith(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 5),
              Text(
                'Mahasiswa Teknik Informatika',
                style: TextStyle(color: warna.onSurfaceVariant),
              ),
            ],
          ),
        ),

        const SizedBox(height: 28),

        // Tentang Saya
        _buildSectionTitle(
          context,
          'Tentang Saya',
          Icons.person_outline,
        ),
        Card(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Text(
              'Saya merupakan mahasiswa Teknik Informatika yang '
              'memiliki ketertarikan pada teknologi, pemrograman, '
              'dan pengembangan aplikasi. Saya juga tertarik '
              'mempelajari ilmu pengetahuan umum serta ilmu agama '
              'sebagai bekal untuk terus mengembangkan diri.',
              textAlign: TextAlign.justify,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ),
        ),

        const SizedBox(height: 20),

        // Keahlian
        _buildSectionTitle(
          context,
          'Keahlian',
          Icons.lightbulb_outline,
        ),
        ...keahlian.map(
          (item) => Card(
            margin: const EdgeInsets.only(bottom: 8),
            child: ListTile(
              leading: Icon(
                item['icon'],
                color: warna.primary,
              ),
              title: Text(item['nama']),
              dense: true,
            ),
          ),
        ),

        const SizedBox(height: 16),

        // Hobi dan Minat
        _buildSectionTitle(
          context,
          'Hobi dan Minat',
          Icons.favorite_border,
        ),
        ...hobi.map(
          (item) => Card(
            margin: const EdgeInsets.only(bottom: 8),
            child: ListTile(
              leading: Icon(
                item['icon'],
                color: warna.primary,
              ),
              title: Text(item['nama']),
              dense: true,
            ),
          ),
        ),

        const SizedBox(height: 16),

        // Riwayat Pendidikan
        _buildSectionTitle(
          context,
          'Riwayat Pendidikan',
          Icons.school_outlined,
        ),
        ...pendidikan.asMap().entries.map(
          (entry) {
            final index = entry.key;
            final item = entry.value;

            return Card(
              margin: const EdgeInsets.only(bottom: 8),
              child: ListTile(
                leading: CircleAvatar(
                  backgroundColor: warna.primaryContainer,
                  child: Text(
                    '${pendidikan.length - index}',
                    style: TextStyle(
                      color: warna.onPrimaryContainer,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                title: Text(
                  item['nama'],
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: Text(item['jurusan']),
                trailing: Icon(
                  item['icon'],
                  color: warna.primary,
                ),
              ),
            );
          },
        ),

        const SizedBox(height: 20),

        // Penutup
        Center(
          child: Text(
            'Terus belajar, berkembang, dan bermanfaat.',
            style: TextStyle(
              color: warna.onSurfaceVariant,
              fontStyle: FontStyle.italic,
              fontSize: 12,
            ),
          ),
        ),

        const SizedBox(height: 20),
      ],
    );
  }

  Widget _buildSectionTitle(
    BuildContext context,
    String title,
    IconData icon,
  ) {
    final warna = Theme.of(context).colorScheme;

    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        children: [
          Icon(
            icon,
            color: warna.primary,
            size: 20,
          ),
          const SizedBox(width: 8),
          Text(
            title,
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ),
        ],
      ),
    );
  }
}
