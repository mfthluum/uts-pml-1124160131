
import 'package:flutter/material.dart';
import '../models/profile.dart';

class EditProfilePage extends StatefulWidget {
  final Profile profile;

  const EditProfilePage({
    super.key,
    required this.profile,
  });

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  final _formKey = GlobalKey<FormState>();

  late TextEditingController _namaController;
  late TextEditingController _nimController;
  late TextEditingController _kelasController;
  late TextEditingController _emailController;
  late TextEditingController _nomorHpController;
  late TextEditingController _githubController;
  late TextEditingController _bioController;

  @override
  void initState() {
    super.initState();

    // Mengisi form dengan data profil sebelumnya
    _namaController = TextEditingController(
      text: widget.profile.nama,
    );

    _nimController = TextEditingController(
      text: widget.profile.nim,
    );

    _kelasController = TextEditingController(
      text: widget.profile.kelas,
    );

    _emailController = TextEditingController(
      text: widget.profile.email,
    );

    _nomorHpController = TextEditingController(
      text: widget.profile.nomorHp,
    );

    _githubController = TextEditingController(
      text: widget.profile.github,
    );

    _bioController = TextEditingController(
      text: widget.profile.bio,
    );
  }

  @override
  void dispose() {
    _namaController.dispose();
    _nimController.dispose();
    _kelasController.dispose();
    _emailController.dispose();
    _nomorHpController.dispose();
    _githubController.dispose();
    _bioController.dispose();

    super.dispose();
  }

  // Fungsi menyimpan perubahan profil
  void _simpanProfil() {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    final Profile dataBaru = widget.profile.copyWith(
      nama: _namaController.text.trim(),
      nim: _nimController.text.trim(),
      kelas: _kelasController.text.trim(),
      email: _emailController.text.trim(),
      nomorHp: _nomorHpController.text.trim(),
      github: _githubController.text.trim(),
      bio: _bioController.text.trim(),
    );

    Navigator.pop(context, dataBaru);
  }

  // Widget input agar tampilan lebih konsisten
  Widget _buildInput({
    required String label,
    required IconData icon,
    required TextEditingController controller,
    String? Function(String?)? validator,
    TextInputType keyboardType = TextInputType.text,
    int maxLines = 1,
  }) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      maxLines: maxLines,
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(icon),
        border: const OutlineInputBorder(),
        alignLabelWithHint: maxLines > 1,
      ),
      validator: validator,
    );
  }

  String? _wajibDiisi(String? value, String namaField) {
    if (value == null || value.trim().isEmpty) {
      return '$namaField tidak boleh kosong';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Profil'),
        centerTitle: true,
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Perbarui Informasi Profil',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 20),

              // Nama Lengkap
              _buildInput(
                label: 'Nama Lengkap',
                icon: Icons.person,
                controller: _namaController,
                validator: (value) =>
                    _wajibDiisi(value, 'Nama'),
              ),

              const SizedBox(height: 16),

              // NIM
              _buildInput(
                label: 'NIM',
                icon: Icons.badge,
                controller: _nimController,
                keyboardType: TextInputType.number,
                validator: (value) =>
                    _wajibDiisi(value, 'NIM'),
              ),

              const SizedBox(height: 16),

              // Kelas
              _buildInput(
                label: 'Kelas',
                icon: Icons.groups,
                controller: _kelasController,
                validator: (value) =>
                    _wajibDiisi(value, 'Kelas'),
              ),

              const SizedBox(height: 16),

              // Email
              _buildInput(
                label: 'Email',
                icon: Icons.email,
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Email tidak boleh kosong';
                  }

                  final emailValid = RegExp(
                    r'^[^@\s]+@[^@\s]+\.[^@\s]+$',
                  ).hasMatch(value.trim());

                  if (!emailValid) {
                    return 'Masukkan alamat email yang valid';
                  }

                  return null;
                },
              ),

              const SizedBox(height: 16),

              // Nomor HP
              _buildInput(
                label: 'Nomor HP',
                icon: Icons.phone,
                controller: _nomorHpController,
                keyboardType: TextInputType.phone,
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Nomor HP tidak boleh kosong';
                  }

                  if (!RegExp(r'^[0-9]{10,13}$')
                      .hasMatch(value.trim())) {
                    return 'Nomor HP harus 10–13 digit angka';
                  }

                  return null;
                },
              ),

              const SizedBox(height: 16),

              // GitHub
              _buildInput(
                label: 'GitHub',
                icon: Icons.code,
                controller: _githubController,
                keyboardType: TextInputType.url,
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Link GitHub tidak boleh kosong';
                  }

                  final uri = Uri.tryParse(value.trim());

                  if (uri == null ||
                      uri.scheme != 'https' ||
                      uri.host != 'github.com' ||
                      uri.pathSegments.isEmpty) {
                    return 'Masukkan URL GitHub yang valid';
                  }

                  return null;
                },
              ),

              const SizedBox(height: 16),

              // Bio
              _buildInput(
                label: 'Tentang Saya',
                icon: Icons.info,
                controller: _bioController,
                maxLines: 4,
                validator: (value) =>
                    _wajibDiisi(value, 'Tentang Saya'),
              ),

              const SizedBox(height: 24),

              // Tombol Simpan
              SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  onPressed: _simpanProfil,
                  icon: const Icon(Icons.save),
                  label: const Text('Simpan Perubahan'),
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                      vertical: 15,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
