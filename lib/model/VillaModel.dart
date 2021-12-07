class VillaModel {
  String idVilla;
  String kodeType;
  String merk;
  String noVilla;
  String noTelp;
  String warna;
  String lokasi;
  String status;
  String harga;
  String fasilitas;
  String gambar;

  VillaModel({
    this.idVilla,
    this.kodeType,
    this.merk,
    this.noTelp,
    this.noVilla,
    this.warna,
    this.lokasi,
    this.status,
    this.harga,
    this.fasilitas,
    this.gambar,
  });

  factory VillaModel.fromJson(Map<String, dynamic> json) => VillaModel(
        idVilla: json['idVilla'],
        kodeType: json['kodeType'],
        merk: json['merk'],
        noTelp: json['noTelp'],
        noVilla: json['noVilla'],
        warna: json['warna'],
        lokasi: json['lokasi'],
        status: json['status'],
        harga: json['harga'],
        fasilitas: json['fasilitas'],
        gambar: json['gambar'],
      );
}
