
import 'package:flutter/material.dart';

class ProfilPage extends StatelessWidget {
  const ProfilPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profil Mahasiswa'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.info_outline),
            tooltip: 'Informasi Profil',
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Informasi Profil Mahasiswa'),
                ),
              );
            },
          ),
        ],
      ),

      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                const CircleAvatar(
                  radius: 55,
                  child: Icon(
                    Icons.person,
                    size: 60,
                  ),
                ),

                const SizedBox(height: 16),

                Text(
                  'Muhamad Miftahul Ulum',
                  style: Theme.of(context).textTheme.headlineSmall,
                  textAlign: TextAlign.center,
                ),

                const SizedBox(height: 6),

                Text(
                  '1124160131',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),

                const SizedBox(height: 4),

                Text(
                  'Teknik Informatika - Software Engineering',
                  style: Theme.of(context).textTheme.bodyMedium,
                  textAlign: TextAlign.center,
                ),

                const SizedBox(height: 24),

                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          'Informasi Kontak',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        SizedBox(height: 12),

                        InfoTile(
                          icon: Icons.email,
                          label: 'Email',
                          value: 'mfthluum252@gmail.com',
                        ),

                        InfoTile(
                          icon: Icons.phone,
                          label: 'Nomor HP',
                          value: '085774823706',
                        ),

                        InfoTile(
                          icon: Icons.school,
                          label: 'Kelas',
                          value: 'TI24 P SE2',
                        ),

                        InfoTile(
                          icon: Icons.code,
                          label: 'GitHub',
                          value: 'github.com/mfthluum',
                        ),
                      ],
                    ),
                  ),
                ),

                const SizedBox(height: 16),

                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          'Keahlian',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        SizedBox(height: 12),

                        InfoTile(
                          icon: Icons.menu_book,
                          label: 'Bahasa Arab Dasar',
                          value: 'Memahami dasar ilmu Nahwu dan Shorof',
                        ),

                        InfoTile(
                          icon: Icons.language,
                          label: 'Bahasa Inggris Dasar',
                          value: 'Memiliki kemampuan dasar dalam memahami bahasa Inggris',
                        ),

                        InfoTile(
                          icon: Icons.computer,
                          label: 'Microsoft Office',
                          value: 'Mampu menggunakan aplikasi Microsoft Office',
                        ),
                      ],
                    ),
                  ),
                ),

                const SizedBox(height: 16),

                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          'Hobi dan Minat',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        SizedBox(height: 12),

                        // hobi
                        InfoTile(
                          icon: Icons.edit,
                          label: 'Menulis',
                          value: 'Menyukai kegiatan menulis dan menuangkan pemikiran',
                        ),

                        InfoTile(
                          icon: Icons.mic,
                          label: 'Bernyanyi',
                          value: 'Menikmati kegiatan bernyanyi dan bermusik',
                        ),

                        InfoTile(
                          icon: Icons.flight_takeoff,
                          label: 'Traveling',
                          value: 'Senang menjelajahi tempat dan pengalaman baru',
                        ),

                        InfoTile(
                          icon: Icons.terrain,
                          label: 'Mendaki Gunung',
                          value: 'Menyukai petualangan dan menikmati keindahan alam',
                        ),

                        Divider(),

                        // minat
                        InfoTile(
                          icon: Icons.computer,
                          label: 'Ilmu Teknologi',
                          value: 'Tertarik mempelajari perkembangan teknologi',
                        ),

                        InfoTile(
                          icon: Icons.menu_book,
                          label: 'Pendidikan Islam',
                          value: 'Tertarik menggabungkan pendidikan agama dan teknologi',
                        ),

                        InfoTile(
                          icon: Icons.psychology,
                          label: 'Filsafat dan Pemikiran',
                          value: 'Tertarik mempelajari pemikiran kritis dan filsafat',
                        ),

                        InfoTile(
                          icon: Icons.code,
                          label: 'Pengembangan Perangkat Lunak',
                          value: 'Tertarik dalam pengembangan aplikasi dan perangkat lunak',
                        ),

                        InfoTile(
                          icon: Icons.school,
                          label: 'Dunia Pendidikan',
                          value: 'Memiliki ketertarikan terhadap perkembangan pendidikan',
                        ),
                      ],
                    ),
                  ),
                ),

                const SizedBox(height: 24),
              ],
            ),
          ),
        ),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text(
                'Terima kasih telah melihat profil saya',
              ),
            ),
          );
        },
        child: const Icon(Icons.favorite),
      ),
    );
  }
}

class InfoTile extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;

  const InfoTile({
    super.key,
    required this.icon,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon),
      title: Text(label),
      subtitle: Text(value),
    );
  }
}
