import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/umkm_controller.dart';

class UmkmFormPage extends StatelessWidget {
  final UmkmController controller = Get.put(UmkmController());

  final TextEditingController namaC = TextEditingController();
  final TextEditingController pemilikC = TextEditingController();
  final TextEditingController alamatC = TextEditingController();
  final TextEditingController kategoriC = TextEditingController();
  final TextEditingController kontakC = TextEditingController();

  UmkmFormPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Tambah UMKM')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: namaC,
              decoration: const InputDecoration(labelText: 'Nama UMKM'),
            ),
            TextField(
              controller: pemilikC,
              decoration: const InputDecoration(labelText: 'Pemilik'),
            ),
            TextField(
              controller: alamatC,
              decoration: const InputDecoration(labelText: 'Alamat'),
            ),
            TextField(
              controller: kategoriC,
              decoration: const InputDecoration(labelText: 'Kategori'),
            ),
            TextField(
              controller: kontakC,
              decoration: const InputDecoration(labelText: 'Kontak'),
            ),
            const SizedBox(height: 16),
            Obx(() {
              if (controller.isLoading.value) {
                return const CircularProgressIndicator();
              }
              return ElevatedButton(
                onPressed: () {
                  controller.createUmkm(
                    nama: namaC.text,
                    kategori: kategoriC.text,
                    pemilik: pemilikC.text,
                    alamat: alamatC.text,
                    kontak: kontakC.text,
                  );
                },
                child: const Text('Simpan'),
              );
            }),
            const SizedBox(height: 20),
            Obx(() => Text(controller.responseMessage.value)),
          ],
        ),
      ),
    );
  }
}
