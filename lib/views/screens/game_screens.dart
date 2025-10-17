import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(const QuixApp());
}

class QuixApp extends StatelessWidget {
  const QuixApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: GameScreens(),
    );
  }
}

class GameScreens extends StatelessWidget {
  const GameScreens({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: MonopolyBoard(),
    );
  }
}

class MonopolyBoard extends StatefulWidget {
  const MonopolyBoard({super.key});

  @override
  State<MonopolyBoard> createState() => _MonopolyBoardState();
}

class _MonopolyBoardState extends State<MonopolyBoard> {
  int currentPosition = 0;
  int balance = 1000000;
  int diceResult = 0;
  bool isRolling = false;
  Map<String, dynamic>? currentEventData;
  bool showEventDialog = false;

  static final List<Map<String, dynamic>> levels = [
    {
      'id': 0,
      'title': 'START',
      'description': 'Mulai petualanganmu menuju kebebasan finansial!',
      'type': 'start',
      'color': Colors.green,
      'decisions': [],
    },
    {
      'id': 1,
      'title': 'Bonus Gaji Bulanan',
      'description': 'Kamu menerima gaji bulanan dari pekerjaan part-time.',
      'type': 'income',
      'color': Colors.green,
      'amount': 150000,
      'decisions': [
        {'label': 'Terima', 'action': 'accept'},
        {'label': 'Tolak', 'action': 'reject'},
      ],
    },
    {
      'id': 2,
      'title': 'Godaan Belanja Online',
      'description': 'Ada promo besar-besaran untuk barang gadget terbaru.',
      'type': 'spending',
      'color': Colors.red,
      'amount': -300000,
      'decisions': [
        {'label': 'Beli', 'action': 'spend'},
        {'label': 'Tahan Diri', 'action': 'resist'},
      ],
    },
    {
      'id': 3,
      'title': 'Ajakan Nonton Bareng',
      'description': 'Teman mengajak nonton film bioskop + makan. Rp 50.000.',
      'type': 'social_spending',
      'color': Colors.orange,
      'amount': -50000,
      'decisions': [
        {'label': 'Pergi', 'action': 'go'},
        {'label': 'Batal', 'action': 'skip'},
      ],
    },
    {
      'id': 4,
      'title': 'Peluang Bisnis Sampingan',
      'description': 'Menjadi reseller dan dapatkan komisi Rp 200.000/bulan.',
      'type': 'income',
      'color': Colors.green,
      'amount': 200000,
      'decisions': [
        {'label': 'Terima', 'action': 'accept'},
        {'label': 'Abaikan', 'action': 'reject'},
      ],
    },
    {
      'id': 5,
      'title': 'Biaya Kesehatan Darurat',
      'description': 'Kamu sakit dan perlu berobat ke dokter. Rp 200.000.',
      'type': 'necessary_expense',
      'color': Colors.yellow,
      'amount': -200000,
      'decisions': [
        {'label': 'Bayar', 'action': 'pay'},
        {'label': 'Tunda', 'action': 'postpone'},
      ],
    },
    {
      'id': 6,
      'title': 'Investasi Crypto',
      'description': 'Teman menawarkan investasi cryptocurrency. Janji 100% untung.',
      'type': 'risky_investment',
      'color': Colors.red,
      'amount': -250000,
      'decisions': [
        {'label': 'Investasi', 'action': 'invest_risky'},
        {'label': 'Jangan', 'action': 'refuse'},
      ],
    },
    {
      'id': 7,
      'title': 'Tabungan Berbunga',
      'description': 'Kamu menabung di bank dan dapat bunga Rp 100.000.',
      'type': 'income',
      'color': Colors.green,
      'amount': 100000,
      'decisions': [
        {'label': 'Ambil', 'action': 'accept'},
        {'label': 'Biarkan', 'action': 'keep'},
      ],
    },
    {
      'id': 8,
      'title': 'Utang Teman',
      'description': 'Teman meminjam uang Rp 150.000 dengan janji bayar minggu depan.',
      'type': 'lending',
      'color': Colors.orange,
      'amount': -150000,
      'decisions': [
        {'label': 'Pinjamkan', 'action': 'lend'},
        {'label': 'Tolak', 'action': 'refuse'},
      ],
    },
    {
      'id': 9,
      'title': 'Kuis Berhadiah Uang',
      'description': 'Menang kuis online dan dapatkan hadiah uang tunai Rp 300.000!',
      'type': 'lucky_income',
      'color': Colors.lightGreen,
      'amount': 300000,
      'decisions': [
        {'label': 'Terima', 'action': 'accept'},
        {'label': 'Tidak', 'action': 'reject'},
      ],
    },
    {
      'id': 10,
      'title': 'Cicilan Hutang Kartu Kredit',
      'description': 'Kamu punya hutang Rp 180.000 di kartu kredit.',
      'type': 'debt_payment',
      'color': Colors.red,
      'amount': -180000,
      'decisions': [
        {'label': 'Bayar', 'action': 'pay'},
        {'label': 'Tunda', 'action': 'postpone'},
      ],
    },
    {
      'id': 11,
      'title': 'Diskon Makan Sehat',
      'description': 'Promo makanan sehat 50% off. Rp 80.000 saja.',
      'type': 'mixed_expense',
      'color': Colors.yellow,
      'amount': -80000,
      'decisions': [
        {'label': 'Beli', 'action': 'buy'},
        {'label': 'Lewati', 'action': 'skip'},
      ],
    },
    {
      'id': 12,
      'title': 'Kursus Online Gratis',
      'description': 'Ada kursus skill gratis yang bisa tingkatkan kemampuanmu.',
      'type': 'neutral',
      'color': Colors.blue,
      'amount': 0,
      'decisions': [
        {'label': 'Ambil', 'action': 'take'},
        {'label': 'Abaikan', 'action': 'ignore'},
      ],
    },
    {
      'id': 13,
      'title': 'Bonus Referral',
      'description': 'Ajak teman join dan dapat bonus Rp 50.000 per referral. 3 teman!',
      'type': 'income',
      'color': Colors.green,
      'amount': 150000,
      'decisions': [
        {'label': 'Bagikan', 'action': 'accept'},
        {'label': 'Jangan', 'action': 'reject'},
      ],
    },
    {
      'id': 14,
      'title': 'Asuransi Kesehatan',
      'description': 'Premi asuransi kesehatan Rp 100.000/bulan.',
      'type': 'protection_expense',
      'color': Colors.yellow,
      'amount': -100000,
      'decisions': [
        {'label': 'Ambil', 'action': 'pay'},
        {'label': 'Lewati', 'action': 'skip'},
      ],
    },
    {
      'id': 15,
      'title': 'Pinjaman Ibu',
      'description': 'Ibu meminjamkan uang untuk biaya sekolah Rp 250.000 tanpa bunga.',
      'type': 'family_loan',
      'color': Colors.blue,
      'amount': 250000,
      'decisions': [
        {'label': 'Ambil', 'action': 'accept'},
        {'label': 'Tolak', 'action': 'reject'},
      ],
    },
    {
      'id': 16,
      'title': 'Pulsa Berlebihan',
      'description': 'Kamu sering internet berlebihan. Biaya tambahan Rp 75.000.',
      'type': 'unnecessary_expense',
      'color': Colors.red,
      'amount': -75000,
      'decisions': [
        {'label': 'Bayar', 'action': 'pay'},
        {'label': 'Kurangi', 'action': 'reduce'},
      ],
    },
    {
      'id': 17,
      'title': 'Resep Kue Dijual',
      'description': 'Kue buatan rumah laku! Pendapatan Rp 400.000 bulan ini.',
      'type': 'income',
      'color': Colors.green,
      'amount': 400000,
      'decisions': [
        {'label': 'Ambil Hasil', 'action': 'accept'},
        {'label': 'Reinvestasi', 'action': 'reinvest'},
      ],
    },
    {
      'id': 18,
      'title': 'Parkir Sembarangan',
      'description': 'Kena denda parkir ilegal Rp 100.000.',
      'type': 'penalty',
      'color': Colors.red,
      'amount': -100000,
      'decisions': [
        {'label': 'Bayar', 'action': 'pay'},
        {'label': 'Protes', 'action': 'protest'},
      ],
    },
    {
      'id': 19,
      'title': 'Review Produk',
      'description': 'Dibayar Rp 120.000 jadi reviewer produk di media sosial.',
      'type': 'income',
      'color': Colors.green,
      'amount': 120000,
      'decisions': [
        {'label': 'Terima', 'action': 'accept'},
        {'label': 'Tolak', 'action': 'reject'},
      ],
    },
    {
      'id': 20,
      'title': 'Undian Berhadiah',
      'description': 'Menang undian hadiah senilai Rp 500.000!',
      'type': 'lucky_income',
      'color': Colors.lightGreen,
      'amount': 500000,
      'decisions': [
        {'label': 'Ambil', 'action': 'accept'},
        {'label': 'Tidak', 'action': 'reject'},
      ],
    },
    {
      'id': 21,
      'title': 'Buku Pelajaran Mahal',
      'description': 'Butuh buku pelajaran Rp 200.000. Beli atau pinjam?',
      'type': 'education_expense',
      'color': Colors.yellow,
      'amount': -200000,
      'decisions': [
        {'label': 'Beli', 'action': 'buy'},
        {'label': 'Pinjam', 'action': 'borrow'},
      ],
    },
    {
      'id': 22,
      'title': 'Program Loyalitas',
      'description': 'Kumpul poin dari belanja dan dapat voucher Rp 75.000!',
      'type': 'reward',
      'color': Colors.lightGreen,
      'amount': 75000,
      'decisions': [
        {'label': 'Gunakan', 'action': 'use'},
        {'label': 'Kumpul Lagi', 'action': 'save'},
      ],
    },
    {
      'id': 23,
      'title': 'Barang Elektronik Rusak',
      'description': 'Headphone rusak. Beli baru atau coba perbaiki?',
      'type': 'repair_or_replace',
      'color': Colors.orange,
      'amount': -150000,
      'decisions': [
        {'label': 'Beli Baru', 'action': 'buy_new'},
        {'label': 'Perbaiki', 'action': 'repair'},
      ],
    },
    {
      'id': 24,
      'title': 'FINISH - Selamat!',
      'description': 'Kamu sampai di garis finish. Lihat hasil keuanganmu!',
      'type': 'finish',
      'color': Colors.amber,
      'decisions': [],
    },
  ];

  void rollDice() {
    if (isRolling) return;

    setState(() {
      isRolling = true;
    });

    Future.delayed(const Duration(milliseconds: 600), () {
      final random = Random();
      final result = random.nextInt(6) + 1;

      setState(() {
        diceResult = result;
        int newPosition = currentPosition + result;

        if (newPosition >= levels.length) {
          newPosition = levels.length - 1;
        }

        currentPosition = newPosition;
        currentEventData = levels[currentPosition];
        showEventDialog = true;
        isRolling = false;
      });
    });
  }

  void handleDecision(String action) {
    int changeAmount = 0;

    switch (action) {
      case 'accept':
      case 'go':
      case 'keep':
      case 'take':
      case 'use':
      case 'buy':
      case 'pay':
      case 'lend':
      case 'reinvest':
      case 'buy_new':
      case 'spend':
      case 'invest_risky':
        changeAmount = currentEventData?['amount'] ?? 0;
        break;
      case 'reject':
      case 'resist':
      case 'skip':
      case 'refuse':
      case 'ignore':
      case 'reduce':
      case 'protest':
      case 'borrow':
      case 'repair':
      case 'save':
        changeAmount = 0;
        break;
      case 'postpone':
        changeAmount = 0;
        break;
    }

    setState(() {
      balance += changeAmount;
      showEventDialog = false;

      if (balance < 0) {
        _showGameOverDialog();
      }
    });
  }

  void _showGameOverDialog() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => Dialog(
        backgroundColor: Colors.transparent,
        child: Container(
          width: 300,
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            color: Colors.red.shade400.withValues(alpha: 0.9),
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: Colors.red.shade700, width: 3),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(Icons.warning, size: 60, color: Colors.white),
              const SizedBox(height: 16),
              const Text(
                'GAME OVER',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                'Saldo kamu habis!',
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                  setState(() {
                    currentPosition = 0;
                    balance = 1000000;
                    diceResult = 0;
                    showEventDialog = false;
                  });
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: const Text(
                  'Main Lagi',
                  style: TextStyle(
                    color: Colors.red,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFF005A9C),
      child: Stack(
        children: [
          _buildVerticalBoard(),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: _buildCombinedBottomBar(),
          ),
          if (showEventDialog && currentEventData != null)
            _buildEventDialog(),
        ],
      ),
    );
  }

  Widget _buildVerticalBoard() {
    return ListView.builder(
      padding: const EdgeInsets.only(top: 40, bottom: 200),
      itemCount: levels.length,
      itemBuilder: (context, index) {
        final actualIndex = levels.length - 1 - index;
        final isCurrentPosition = actualIndex == currentPosition;
        return _buildLevelTile(levels[actualIndex], isCurrentPosition);
      },
    );
  }

  Widget _buildLevelTile(Map<String, dynamic> levelData, bool isCurrent) {
    return Stack(
      children: [
        if (levelData['id'] != 0)
          Positioned(
            left: MediaQuery.of(context).size.width / 2,
            top: -5,
            child: Container(
              width: 4,
              height: 15,
              color: Colors.white.withValues(alpha: 0.4),
            ),
          ),
        Container(
          height: 90,
          margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 40.0),
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          decoration: BoxDecoration(
            color: isCurrent
                ? (levelData['color'] as Color).withValues(alpha: 1.0)
                : levelData['color'],
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: isCurrent ? Colors.white : Colors.black54,
              width: isCurrent ? 4 : 2,
            ),
            boxShadow: isCurrent
                ? [
                    BoxShadow(
                      color: Colors.yellow.shade600,
                      spreadRadius: 3,
                      blurRadius: 8,
                    )
                  ]
                : [
                    const BoxShadow(
                      color: Color.fromRGBO(0, 0, 0, 0.2),
                      spreadRadius: 1,
                      blurRadius: 3,
                      offset: Offset(0, 2),
                    )
                  ],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                levelData['title'] as String,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: isCurrent ? 16 : 14,
                  color: Colors.black87,
                ),
              ),
              if ((levelData['description'] as String).isNotEmpty)
                Padding(
                  padding: const EdgeInsets.only(top: 4),
                  child: Text(
                    levelData['description'] as String,
                    style: TextStyle(
                      fontSize: 11,
                      color: Colors.black.withValues(alpha: 0.7),
                    ),
                    textAlign: TextAlign.center,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
            ],
          ),
        ),
        if (isCurrent)
          Positioned(
            right: 30,
            top: 10,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: Colors.yellow.shade600,
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Text(
                'POSISI KU',
                style: TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ),
      ],
    );
  }

  Widget _buildEventDialog() {
    return Dialog(
      backgroundColor: Colors.transparent,
      child: Container(
        width: 320,
        constraints: BoxConstraints(
          maxHeight: MediaQuery.of(context).size.height * 0.8,
        ),
        decoration: BoxDecoration(
          color: const Color(0xFF82D5FA).withValues(alpha: 0.95),
          borderRadius: BorderRadius.circular(24),
          border: Border.all(
            color: Colors.lightBlue.shade700,
            width: 3,
          ),
          boxShadow: const [
            BoxShadow(
              color: Color.fromRGBO(0, 0, 0, 0.3),
              spreadRadius: 3,
              blurRadius: 10,
            )
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
              decoration: BoxDecoration(
                color: Colors.lightBlue.shade500,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(22),
                  topRight: Radius.circular(22),
                ),
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: 44,
                        height: 44,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white,
                          border: Border.all(
                            color: Colors.lightBlue.shade700,
                            width: 2,
                          ),
                        ),
                        child: const Icon(
                          Icons.monetization_on,
                          color: Colors.amber,
                          size: 24,
                        ),
                      ),
                      Text(
                        currentEventData?['title'] ?? '',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(width: 44),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Text(
                    'Dadu: $diceResult',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: Colors.white.withValues(alpha: 0.9),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text(
                        currentEventData?['description'] ?? '',
                        style: const TextStyle(
                          color: Colors.black87,
                          fontSize: 13,
                          height: 1.5,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: Colors.white.withValues(alpha: 0.85),
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          color: _getAmountColor(),
                          width: 2,
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Dampak:',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 12,
                            ),
                          ),
                          Text(
                            _formatAmount(currentEventData?['amount'] ?? 0),
                            style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.bold,
                              color: _getAmountColor(),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                children: [
                  for (var decision in (currentEventData?['decisions'] ?? []))
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8),
                      child: SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () =>
                              handleDecision(decision['action']),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.lightBlue.shade700,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            padding: const EdgeInsets.symmetric(vertical: 10),
                          ),
                          child: Text(
                            decision['label'],
                            style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                              fontSize: 13,
                            ),
                          ),
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Color _getAmountColor() {
    int amount = currentEventData?['amount'] ?? 0;
    if (amount > 0) return Colors.green.shade700;
    if (amount < 0) return Colors.red.shade700;
    return Colors.grey.shade700;
  }

  String _formatAmount(int amount) {
    if (amount == 0) return 'Tidak Ada Perubahan';
    String prefix = amount > 0 ? '+' : '';
    return '$prefix Rp ${amount.abs().toString().replaceAllMapped(RegExp(r'\B(?=(\d{3})+(?!\d))'), (match) => '.')}';
  }

  Widget _buildCombinedBottomBar() {
    const double navBarHeight = 80.0;
    const double buttonOverlap = 40.0;

    return SizedBox(
      height: navBarHeight + buttonOverlap,
      child: Stack(
        alignment: Alignment.topCenter,
        clipBehavior: Clip.none,
        children: [
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: CustomPaint(
              size: Size.fromHeight(navBarHeight),
              painter: NavbarPainter(),
              child: SizedBox(
                height: navBarHeight,
                child: _buildBottomMenuContent(),
              ),
            ),
          ),
          Positioned(
            top: -buttonOverlap,
            child: _buildGoButton(),
          ),
        ],
      ),
    );
  }

  Widget _buildGoButton() {
    const double buttonWidth = 120;
    const double buttonHeight = 120;

    return GestureDetector(
      onTap: isRolling ? null : rollDice,
      child: SizedBox(
        width: buttonWidth,
        height: buttonHeight,
        child: Image.asset('assets/gobutton.png'),
      ),
    );
  }

  Widget _buildBottomMenuContent() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 6),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            children: [
              GestureDetector(
                onTap: () {
                  _showChatbotPopup();
                },
                child: Center(
                  child: SizedBox(
                    width: 60,
                    height: 60,
                    child: Image.asset('assets/chatbot.png'),
                  ),
                ),
              ),
              const SizedBox(width: 25),
              Transform.scale(
                scale: 1.25,
                child: Center(
                  child: SizedBox(
                    width: 64,
                    height: 64,
                    child: Image.asset('assets/coins.png'),
                  ),
                ),
              ),
            ],
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 17, vertical: 6),
            decoration: BoxDecoration(
              color: Colors.blue.shade900,
              borderRadius: BorderRadius.circular(15),
              border: Border.all(color: Colors.lightBlue),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Balance: ${_formatBalance(balance)}',
                  style: const TextStyle(color: Colors.white, fontSize: 11),
                ),
                Text(
                  'Posisi: ${currentPosition + 1}/${levels.length}',
                  style: const TextStyle(color: Colors.lightBlue, fontSize: 11),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  String _formatBalance(int amount) {
    if (amount < 0) {
      return '-Rp ${amount.abs().toString().replaceAllMapped(RegExp(r'\B(?=(\d{3})+(?!\d))'), (match) => '.')}';
    }
    return 'Rp ${amount.toString().replaceAllMapped(RegExp(r'\B(?=(\d{3})+(?!\d))'), (match) => '.')}';
  }

  void _showChatbotPopup() {
    final TextEditingController messageController = TextEditingController();
    final List<Map<String, String>> messages = [
      {'sender': 'bot', 'text': 'Halo! Apa yang bisa saya bantu?'}
    ];

    showDialog(
      context: context,
      barrierColor: Colors.black.withValues(alpha: 0.3),
      builder: (BuildContext context) {
        return Dialog(
          backgroundColor: Colors.transparent,
          child: Container(
            width: 300,
            height: 450,
            decoration: BoxDecoration(
              color: const Color(0xFF82D5FA).withValues(alpha: 0.5),
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                color: Colors.lightBlue.shade700,
                width: 2,
              ),
              boxShadow: const [
                BoxShadow(
                  color: Color.fromRGBO(0, 0, 0, 0.2),
                  spreadRadius: 2,
                  blurRadius: 8,
                )
              ],
            ),
            child: StatefulBuilder(
              builder: (context, setState) {
                return Column(
                  children: [
                    Container(
                      padding:
                          const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                      decoration: BoxDecoration(
                        color: Colors.lightBlue.shade400
                            .withValues(alpha: 0.7),
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(18),
                          topRight: Radius.circular(18),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: 40,
                            height: 40,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.white,
                              border: Border.all(
                                color: Colors.lightBlue.shade700,
                                width: 2,
                              ),
                            ),
                            child: const Icon(
                              Icons.chat_bubble,
                              color: Colors.lightBlue,
                              size: 20,
                            ),
                          ),
                          const Text(
                            'Panduan Finansial',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(width: 10),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.all(12),
                        child: ListView.builder(
                          itemCount: messages.length,
                          itemBuilder: (context, index) {
                            final msg = messages[index];
                            final isBot = msg['sender'] == 'bot';
                            return Align(
                              alignment: isBot
                                  ? Alignment.centerLeft
                                  : Alignment.centerRight,
                              child: Container(
                                margin: const EdgeInsets.only(bottom: 8),
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 12,
                                  vertical: 8,
                                ),
                                decoration: BoxDecoration(
                                  color: isBot
                                      ? Colors.white.withValues(alpha: 0.9)
                                      : Colors.lightBlue.shade600,
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: Text(
                                  msg['text'] ?? '',
                                  style: TextStyle(
                                    color: isBot
                                        ? Colors.black87
                                        : Colors.white,
                                    fontSize: 12,
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(12),
                      child: Row(
                        children: [
                          Expanded(
                            child: TextField(
                              controller: messageController,
                              decoration: InputDecoration(
                                hintText: 'Ketik pesan...',
                                hintStyle: const TextStyle(
                                  color: Colors.black54,
                                  fontSize: 12,
                                ),
                                filled: true,
                                fillColor:
                                    Colors.white.withValues(alpha: 0.8),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide.none,
                                ),
                                contentPadding:
                                    const EdgeInsets.symmetric(
                                  horizontal: 12,
                                  vertical: 10,
                                ),
                              ),
                              style: const TextStyle(fontSize: 12),
                            ),
                          ),
                          const SizedBox(width: 8),
                          GestureDetector(
                            onTap: () {
                              if (messageController.text.isNotEmpty) {
                                setState(() {
                                  messages.add({
                                    'sender': 'user',
                                    'text': messageController.text
                                  });
                                  messageController.clear();
                                  messages.add({
                                    'sender': 'bot',
                                    'text':
                                        'Tips: Kelola uangmu dengan bijak, bedakan antara kebutuhan dan keinginan!'
                                  });
                                });
                              }
                            },
                            child: Container(
                              width: 36,
                              height: 36,
                              decoration: BoxDecoration(
                                color: Colors.lightBlue.shade700,
                                shape: BoxShape.circle,
                              ),
                              child: const Icon(
                                Icons.send,
                                color: Colors.white,
                                size: 16,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 12),
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.lightBlue.shade700,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          padding:
                              const EdgeInsets.symmetric(vertical: 10),
                        ),
                        child: const Text(
                          'Tutup',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            fontSize: 14,
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        );
      },
    );
  }
}

class NavbarPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final path = getPath(size);

    final fillPaint = Paint()
      ..color = const Color(0xFF82D5FA)
      ..style = PaintingStyle.fill;
    canvas.drawPath(path, fillPaint);

    final borderPaint = Paint()
      ..color = Colors.lightBlue.shade700
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke;
    canvas.drawPath(path, borderPaint);
  }

  Path getPath(Size size) {
    final path = Path();

    const double cornerRadius = 10.0;
    const double topEdgeY = 2.0;
    const double notchWidth = 70.0;

    path.moveTo(0, size.height);
    path.lineTo(0, topEdgeY + cornerRadius);
    path.quadraticBezierTo(0, topEdgeY, cornerRadius, topEdgeY);
    path.lineTo((size.width / 2) - (notchWidth / 2), topEdgeY);
    path.lineTo(size.width / 2, 0);
    path.lineTo((size.width / 2) + (notchWidth / 2), topEdgeY);
    path.lineTo(size.width - cornerRadius, topEdgeY);
    path.quadraticBezierTo(size.width, topEdgeY, size.width, topEdgeY + cornerRadius);
    path.lineTo(size.width, size.height);
    path.close();

    return path;
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}