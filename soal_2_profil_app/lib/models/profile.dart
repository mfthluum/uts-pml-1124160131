
class Profile {
  final String nama;
  final String nim;
  final String programStudi;
  final String kelas;
  final String bio;
  final String email;
  final String nomorHp;
  final String github;
  final String foto;

  const Profile({
    required this.nama,
    required this.nim,
    required this.programStudi,
    required this.kelas,
    required this.bio,
    required this.email,
    required this.nomorHp,
    required this.github,
    required this.foto,
  });

  // Data profil awal mahasiswa
  factory Profile.initial() {
    return const Profile(
      nama: 'Muhamad Miftahul Ulum',
      nim: '1124160131',
      programStudi: 'Teknik Informatika',
      kelas: 'TI24 P SE2',
      bio: 'Mahasiswa Teknik Informatika yang tertarik '
          'pada teknologi, pemrograman, dan pengembangan aplikasi.',
      email: '1124160131@global.ac.id',
      nomorHp: '085774823706',
      github: 'https://github.com/mfthluum',
      foto: 'assets/images/profile.png',
    );
  }

  // Membuat salinan profil dengan data yang diperbarui
  Profile copyWith({
    String? nama,
    String? nim,
    String? programStudi,
    String? kelas,
    String? bio,
    String? email,
    String? nomorHp,
    String? github,
    String? foto,
  }) {
    return Profile(
      nama: nama ?? this.nama,
      nim: nim ?? this.nim,
      programStudi: programStudi ?? this.programStudi,
      kelas: kelas ?? this.kelas,
      bio: bio ?? this.bio,
      email: email ?? this.email,
      nomorHp: nomorHp ?? this.nomorHp,
      github: github ?? this.github,
      foto: foto ?? this.foto,
    );
  }
}
