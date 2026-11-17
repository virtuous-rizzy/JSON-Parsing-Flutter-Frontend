import 'package:get/get.dart';
import '../models/umkm_model.dart';
import '../services/service.dart';

class UmkmController extends GetxController {
  var umkmList = <Umkm>[].obs;
  var isLoading = true.obs;
  var responseMessage = ''.obs;

  final UmkmService _service = UmkmService();

  @override
  void onInit() {
    fetchUmkm();
    super.onInit();
  }

  // get umkm
  Future<void> fetchUmkm() async {
    try {
      isLoading(true);
      var result = await _service.getUmkmList();
      umkmList.assignAll(result);
    } catch (e) {
      Get.snackbar("Error", "Gagal memuat data: $e");
    } finally {
      isLoading(false);
    }
  }

  // post umkm
  Future<void> createUmkm({
    required String nama,
    String? kategori,
    String? pemilik,
    String? alamat,
    String? kontak,
  }) async {
    isLoading(true);
    responseMessage('');
    try {
      final result = await _service.createUmkm({
        'nama_umkm': nama,
        'kategori': kategori ?? '',
        'pemilik': pemilik ?? '',
        'alamat': alamat ?? '',
        'kontak': kontak ?? '',
      });
      responseMessage.value = result['message'] ?? 'Data berhasil disimpan';
    } catch (e) {
      responseMessage.value = ' Error: $e';
    } finally {
      isLoading(false);
    }
  }
}
