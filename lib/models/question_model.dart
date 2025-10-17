// lib/models/question_model.dart

// 1. Blueprint atau 'Class' untuk sebuah soal
class Question {
  final String text;
  final List<String> options;
  final int correctAnswerIndex;

  const Question({
    required this.text,
    required this.options,
    required this.correctAnswerIndex,
  });
}

// 2. Daftar lengkap semua 10 soal Anda
const List<Question> nexCashQuestions = [
  Question(
    text:
        'Kamu baru dapet uang THR Rp500.000. Kamu pengen beli baju baru Rp250.000, nabung Rp100.000, dan sisanya buat jajan. Kalau kamu tiba-tiba diajak temen ke kafe yang butuh biaya Rp100.000, apa keputusan paling bijak?',
    options: [
      'Ikut aja, kan masih ada uang.',
      'Gak ikut dulu, karena udah atur anggaran.',
      'Pinjem ke temen, nanti diganti.',
      'Ambil dari tabungan aja, toh sedikit doang.',
    ],
    correctAnswerIndex: 1,
  ),
  Question(
    text:
        'Menurut kamu, mana yang lebih penting dilakukan duluan setiap kali dapet uang bulanan?',
    options: [
      'Bayar keinginan dulu, sisanya ditabung.',
      'Nabung dulu, sisanya buat kebutuhan dan hiburan.',
      'Bagi rata aja semuanya.',
      'Beli barang yang lagi diskon.',
    ],
    correctAnswerIndex: 1,
  ),
  Question(
    text: 'Kalau kamu dapet uang lebih dari THR nenek, apa langkah terbaik?',
    options: [
      'Langsung dipakai semua buat belanja online.',
      'Sebagian disimpan di rekening terpisah.',
      'Dituker jadi pulsa biar gak kepakai.',
      'Ditraktir ke teman biar senang.',
    ],
    correctAnswerIndex: 1,
  ),
  Question(
    text:
        'Bayangin kamu udah punya tabungan Rp1 juta. Tiba-tiba HP kamu rusak dan butuh servis Rp800.000. Apa keputusan paling bijak yang bisa kamu ambil?',
    options: [
      'Pake tabungan semua.',
      'Pinjem dulu, tabungan tetap aman.',
      'Servis tapi cari tempat yang lebih murah.',
      'Tunda servis, nabung lagi dulu.',
    ],
    correctAnswerIndex: 2,
  ),
  Question(
    text:
        'Kamu mendapat uang THR Rp500.000 dan sudah mengatur budget (Beli baju: Rp250.000, Nabung: Rp100.000, Sisa: Rp150.000). Teman mengajakmu ke kafe dengan biaya Rp100.000. Apa pilihan terbaik?',
    options: [
      'Ikut aja, toh masih ada sisa uang',
      'Ambil dari tabungan sedikit',
      'Gak ikut dulu, karena sudah punya rencana keuangan',
      'Pinjam ke teman dulu, nanti diganti',
    ],
    correctAnswerIndex: 2,
  ),
  Question(
    text:
        'Ketika kamu membeli makanan di warung, uangmu berpindah ke penjual. Lalu penjual menggunakan uang itu untuk belanja bahan ke pasar. Peristiwa ini disebut…',
    options: ['Tabungan', 'Inflasi', 'Perputaran uang', 'Konsumsi berlebih'],
    correctAnswerIndex: 2,
  ),
  Question(
    text:
        'Pilih pernyataan yang benar tentang bagaimana uang “berputar” dalam perekonomian:',
    options: [
      'Uang hanya berhenti di bank',
      'Uang berpindah terus dari konsumen ke produsen dan pekerja',
      'Uang tidak berubah jumlahnya',
      'Uang hilang saat dibelanjakan',
    ],
    correctAnswerIndex: 1,
  ),
  Question(
    text:
        'Mengapa seseorang tidak menyimpan semua uangnya dalam bentuk rumah atau tanah?',
    options: [
      'Karena nilainya turun cepat',
      'Karena sulit dijual saat butuh uang',
      'Karena tidak bisa diwariskan',
      'Karena tidak dianggap aset',
    ],
    correctAnswerIndex: 1,
  ),
  Question(
    text:
        'Kamu punya dua pilihan: menabung di bank atau membeli barang yang sedang diskon tapi tidak terlalu dibutuhkan. Apa keputusan terbaik?',
    options: [
      'Beli barang karena sayang diskonnya',
      'Tabung uang karena kebutuhan belum mendesak',
      'Belanja setengah, tabung setengah',
      'Tanya teman dulu baru putuskan',
    ],
    correctAnswerIndex: 1,
  ),
  Question(
    text:
        'Mengapa uang Rp100.000 hari ini lebih berharga dibanding Rp100.000 tahun depan?',
    options: [
      'Karena nilainya berubah karena inflasi',
      'Karena desain uangnya berbeda',
      'Karena uang bisa rusak',
      'Karena bank mengatur nilainya',
    ],
    correctAnswerIndex: 0,
  ),
];