class Umkm {
  final int? id;
  final String namaUmkm;
  final String? kategori;
  final String? pemilik;
  final String? alamat;
  final String? kontak;

  Umkm({
    this.id,
    required this.namaUmkm,
    this.kategori,
    this.pemilik,
    this.alamat,
    this.kontak,
  });

  factory Umkm.fromJson(Map<String, dynamic> json) {
    return Umkm(
      id: json['id'] != null ? int.tryParse(json['id'].toString()) : null,
      namaUmkm: json['nama_umkm'] ?? '',
      kategori: json['kategori'],
      pemilik: json['pemilik'],
      alamat: json['alamat'],
      kontak: json['kontak'],
    );
  }
}
