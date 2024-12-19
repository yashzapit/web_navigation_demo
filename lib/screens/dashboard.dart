import 'package:flutter/material.dart';


class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(35),
          child: LayoutBuilder(
            builder: (context, constraints) {
              if (constraints.maxWidth > 800) {
                return _buildWideScreenLayout();
              } else {
                return _buildSmallScreenLayout();
              }
            },
          ),
        ),
      ),
    );
  }

  Widget _buildWideScreenLayout() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 2,
              child: Column(
                children: [
                  _balanceSection(),
                  const SizedBox(height: 16),
                  _historySection(),
                ],
              ),
            ),
            const SizedBox(width: 40),
            Expanded(
              flex: 3,
              child: Column(
                children: [
                  _assetsSection(),
                  const SizedBox(height: 16),
                  _rewardsSection(),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildSmallScreenLayout() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _balanceSection(),
        const SizedBox(height: 16),
        _historySection(),
        const SizedBox(height: 16),
        _assetsSection(),
        const SizedBox(height: 16),
        _rewardsSection(),
      ],
    );
  }

  Widget _balanceSection() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.blueAccent,
        borderRadius: BorderRadius.circular(16),
      ),
      padding: const EdgeInsets.all(24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text(
            "Balance",
            style: TextStyle(color: Colors.white70, fontSize: 18),
          ),
          const SizedBox(height: 8),
          const Text(
            "\$45,338",
            style: TextStyle(
              color: Colors.white,
              fontSize: 32,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.arrow_downward),
                label: const Text("Receive"),
                style: ElevatedButton.styleFrom(backgroundColor: Colors.white),
              ),
              const SizedBox(width: 16),
              ElevatedButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.arrow_upward),
                label: const Text("Send"),
                style: ElevatedButton.styleFrom(backgroundColor: Colors.white),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _assetsSection() {
    return _cardContainer(
      title: "Assets",
      child: Column(
        children: [
          _assetItem("Bitcoin Cash", "14.53 BCH", "₹1,50,092.86", Icons.currency_bitcoin, Colors.green),
          _assetItem("DASH", "2.37 DASH", "₹10,052.39", Icons.payments, Colors.blue),
          _assetItem("Litecoin", "6.91 LTC", "₹51,314.43", Icons.money, Colors.purple),
        ],
      ),
    );
  }

  Widget _assetItem(String name, String value, String amount, IconData icon, Color color) {
    return ListTile(
      leading: Icon(icon, color: color),
      title: Text(name, style: const TextStyle(fontWeight: FontWeight.bold)),
      subtitle: Text(value),
      trailing: Text(amount, style: const TextStyle(fontWeight: FontWeight.bold)),
    );
  }

  Widget _rewardsSection() {
    return _cardContainer(
      title: "Rewards",
      child: Column(
        children: [
          _rewardItem("Visit Satoshi's Angels Website", "3.2 APT", Colors.purple),
          _rewardItem("Visit Satoshi's Angels Website", "3.2 APT", Colors.purple),
        ],
      ),
    );
  }

  Widget _rewardItem(String title, String points, Color color) {
    return ListTile(
      leading: CircleAvatar(backgroundColor: color, radius: 18),
      title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
      trailing: Text(points, style: const TextStyle(color: Colors.black54)),
    );
  }

  Widget _historySection() {
    return _cardContainer(
      title: "History",
      child: Column(
        children: [
          _historyItem("Sent", "₹1,50,092.86", "0.53 BCH", "05-06-23 15:31", Icons.arrow_upward, Colors.red),
          _historyItem("Received", "₹51,314.43", "6.91 BCH", "05-04-23 15:31", Icons.arrow_downward, Colors.green),
          _historyItem("Sent", "₹1,50,092.86", "0.53 BCH", "05-06-23 15:31", Icons.arrow_upward, Colors.red),
          _historyItem("Received", "₹51,314.43", "6.91 BCH", "05-04-23 15:31", Icons.arrow_downward, Colors.green),
        ],
      ),
    );
  }

  Widget _historyItem(
      String type, String amount, String bch, String date, IconData icon, Color iconColor) {
    return ListTile(
      leading: Icon(icon, color: iconColor),
      title: Text(type, style: const TextStyle(fontWeight: FontWeight.bold)),
      subtitle: Text(date),
      trailing: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(amount, style: TextStyle(color: iconColor, fontWeight: FontWeight.bold)),
          Text(bch, style: const TextStyle(color: Colors.black54)),
        ],
      ),
    );
  }

  Widget _cardContainer({required String title, required Widget child}) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: const [BoxShadow(color: Colors.black12, spreadRadius: 1, blurRadius: 4)],
      ),
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          const Divider(),
          child,
        ],
      ),
    );
  }
}
