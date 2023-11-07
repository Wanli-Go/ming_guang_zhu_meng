import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return set_page();
  }
}

class set_page extends StatelessWidget {
  const set_page({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '捐赠记录',
      theme: ThemeData(
        primarySwatch: Colors.pink,
      ),
      home: const DonationPage(),
    );
  }
}

class DonationPage extends StatefulWidget {
  const DonationPage({super.key});

  @override
  State<DonationPage> createState() => _DonationPageState();
}

class _DonationPageState extends State<DonationPage> {
  int donationCount = 10;
  double totalDonationAmount = 1000;

  final List<DonationRecord> donationRecords = List.generate(
    10,
    (index) => DonationRecord(
      donationAmount: '${(index + 1) * 100111}元',
      donationDate: '2023-01-${index + 1}',
      childPhotoUrl: 'assets/child${index % 3 + 1}.png',
    ),
  );

  @override
  void initState() {
    super.initState();
    fetchDonationData();
  }

  void fetchDonationData() {}

  @override
  Widget build(BuildContext context) {
    return main_structure(donationCount: donationCount, totalDonationAmount: totalDonationAmount, donationRecords: donationRecords);
  }
}

class main_structure extends StatelessWidget {
  const main_structure({
    super.key,
    required this.donationCount,
    required this.totalDonationAmount,
    required this.donationRecords,
  });

  final int donationCount;
  final double totalDonationAmount;
  final List<DonationRecord> donationRecords;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('捐赠记录'),
        backgroundColor: Colors.pink[300],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                DonationStatCard(
                  label: '捐赠次数',
                  value: '$donationCount次',
                ),
                DonationStatCard(
                  label: '个人捐款金额',
                  value: '$totalDonationAmount元',
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: donationRecords.length,
              itemBuilder: (context, index) {
                return DonationListItem(
                  record: donationRecords[index],
                  onStatusPressed: () {},
                  onSharePressed: () {},
                );
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 2,
        selectedItemColor: Colors.pink[300],
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "主页",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.leaderboard),
            label: "排行榜",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.receipt_long),
            label: "捐赠记录",
          ),
        ],
      ),
    );
  }
}

class DonationStatCard extends StatelessWidget {
  final String label;
  final String value;

  const DonationStatCard({
    super.key,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return personal_donate_information(label: label, value: value);
  }
}

class personal_donate_information extends StatelessWidget {
  const personal_donate_information({
    super.key,
    required this.label,
    required this.value,
  });

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: Colors.pink[100],
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.pink[200]!.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 3,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          children: [
            Text(
              label,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.pink,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              value,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DonationRecord {
  final String donationAmount;
  final String donationDate;
  final String childPhotoUrl;

  DonationRecord({
    required this.donationAmount,
    required this.donationDate,
    required this.childPhotoUrl,
  });
}

class DonationListItem extends StatelessWidget {
  final DonationRecord record;
  final VoidCallback onStatusPressed;
  final VoidCallback onSharePressed;

  const DonationListItem({
    Key? key,
    required this.record,
    required this.onStatusPressed,
    required this.onSharePressed,
  });

  @override
  Widget build(BuildContext context) {
    return donate_record(record: record, onStatusPressed: onStatusPressed, onSharePressed: onSharePressed);
  }
}

class donate_record extends StatelessWidget {
  const donate_record({
    super.key,
    required this.record,
    required this.onStatusPressed,
    required this.onSharePressed,
  });

  final DonationRecord record;
  final VoidCallback onStatusPressed;
  final VoidCallback onSharePressed;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      shadowColor: Colors.pink.withOpacity(0.5),
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              children: [
                CircleAvatar(
                  backgroundImage: AssetImage(record.childPhotoUrl),
                  radius: 40,
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "捐赠时间：${record.donationDate}",
                        style: const TextStyle(fontSize: 16),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        "捐赠信息：${record.donationAmount}",
                        style: const TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: onStatusPressed,
                  child: const Text('近况'),
                  style: TextButton.styleFrom(
                    primary: Colors.pink,
                  ),
                ),
                const SizedBox(width: 8),
                TextButton(
                  onPressed: onSharePressed,
                  child: const Text('分享'),
                  style: TextButton.styleFrom(
                    primary: Colors.pink,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
