import 'package:flutter/material.dart';


void main() {
  runApp(TelaBanco());
}

class TelaBanco extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TelaBanco',
      home: HomeScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  double saldo = 0.0;
  int selectedIndex = 1;

  void adicionarSaldo() {
    setState(() {
      saldo += 100.0;
    });
  }

  void removerSaldo() {
    setState(() {
      if (saldo >= 50.0) {
        saldo -= 50.0;
      }
    });
  }

  void resetarSaldo() {
    setState(() {
      saldo = 0.0;
    });
  }

  @override
  Widget build(BuildContext context) {
    final Color fundoCor = Colors.grey[300]!;
    final Color iconeCor = Colors.black;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          const SizedBox(height: 50),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(Icons.arrow_back, color: iconeCor),
              ],
            ),
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Container(
              width: screenWidth * 0.95,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: fundoCor,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Saldo em conta',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: iconeCor,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'R\$ ${saldo.toStringAsFixed(2)}',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: iconeCor,
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ActionButton(icon: Icons.add, onTap: adicionarSaldo),
                ActionButton(icon: Icons.attach_money, onTap: removerSaldo),
                ActionButton(icon: Icons.refresh, onTap: resetarSaldo),
                ActionButton(icon: Icons.credit_card, onTap: resetarSaldo),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
        onTap: (index) {
          setState(() {
            selectedIndex = index;
          });
        },
        backgroundColor: fundoCor,
        selectedItemColor: const Color.fromARGB(255, 106, 10, 231),
        unselectedItemColor: iconeCor.withValues(alpha: 0.6),
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Perfil'),
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Início'),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Config.'),
        ],
      ),
    );
  }
}

class ActionButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback? onTap;

  const ActionButton({required this.icon, this.onTap});

  @override
  Widget build(BuildContext context) {
    final Color buttonColor = Colors.grey[300]!;
    final Color funcoesCor = Colors.black;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 64,
        height: 64,
        decoration: BoxDecoration(
          color: buttonColor,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Icon(icon, color: funcoesCor),
      ),
    );
  }
}

