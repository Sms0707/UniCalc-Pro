import 'package:flutter/material.dart';

void main() {
  runApp(const AdvancedCalcApp());
}

class AdvancedCalcApp extends StatelessWidget {
  const AdvancedCalcApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Advanced Calculus',
      theme: ThemeData(
        brightness: Brightness.light,
        primarySwatch: Colors.indigo,
        fontFamily: 'Roboto', // UI font
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.indigo,
        scaffoldBackgroundColor: const Color(0xFF0F172A), // Slate 900
      ),
      themeMode: ThemeMode.system,
      home: const DashboardScreen(),
    );
  }
}

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  // Function to show the detailed history modal
  void _showResultModal(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Theme.of(context).cardColor,
          title: const Text(
            "Green's Theorem Verification",
            style: TextStyle(fontFamily: 'Serif', fontWeight: FontWeight.bold),
          ),
          content: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                _buildMathStep("Given Vector Field: F = (x^2 - y^2)i + (2xy)j"),
                _buildMathStep("1. Compute partial derivatives:"),
                _buildMathStep("   ∂Q/∂x = 2y"),
                _buildMathStep("   ∂P/∂y = -2y"),
                _buildMathStep("2. Form integrand: ∂Q/∂x - ∂P/∂y = 4y"),
                _buildMathStep("3. Evaluate line integral ∮ (P dx + Q dy)."),
                _buildMathStep("   Path evaluated in an anticlockwise direction."),
                const SizedBox(height: 10),
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.green.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Text(
                    "LHS = RHS. Theorem Successfully Verified.",
                    style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold),
                  ),
                )
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text("Close"),
            ),
          ],
        );
      },
    );
  }

  Widget _buildMathStep(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Text(
        text,
        style: const TextStyle(fontFamily: 'Serif', fontSize: 16),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final domains = [
      "Normal Calc", "Limits", "Integration", "ODE", 
      "PDE", "Vector Calculus", "Laplace Transforms", 
      "Complex Analysis", "Fourier Series", "Linear Algebra"
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Advanced Math Engine'),
        centerTitle: true,
        elevation: 0,
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(color: Colors.indigo),
              child: Text(
                'Calculation History',
                style: TextStyle(color: Colors.white, fontSize: 24),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.functions),
              title: const Text("Green's Theorem Verification"),
              subtitle: const Text("Oct 27 - Verified"),
              onTap: () {
                Navigator.pop(context); // Close drawer
                _showResultModal(context); // Open detailed modal
              },
            ),
            ListTile(
              leading: const Icon(Icons.show_chart),
              title: const Text("Triple Integral: Volume"),
              subtitle: const Text("Oct 26 - Computed"),
              onTap: () {},
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
            childAspectRatio: 1.2,
          ),
          itemCount: domains.length,
          itemBuilder: (context, index) {
            return Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              child: InkWell(
                onTap: () {
                  // Navigation to specific domain screens goes here
                },
                borderRadius: BorderRadius.circular(16),
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      domains[index],
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
