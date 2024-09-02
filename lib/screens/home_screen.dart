import 'package:flutter/material.dart';
import '../screens/login_page.dart'; // Adjust the path if necessary
import '../screens/guest_page.dart'; // Adjust the path if necessary

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentPage = 0; // Track the current page index for the PageView

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // Top Image
          Image.asset(
            'assets/images/home.png', // Path to your image
            width: double.infinity,
            height: 400, // Adjust the height as needed
            fit: BoxFit.cover,
          ),

          // Paragraphs with PageView
          Expanded(
            child: PageView(
              onPageChanged: (index) {
                setState(() {
                  _currentPage = index; // Update the current page index
                });
              },
              children: [
                _buildParagraph(
                  "Bonjour, je m'appelle GeraJeune Skin IA",
                  "Je suis le premier outil d'intelligence artificielle développé avec des dermatologues tunisiens et des experts en cosmétologie.",
                ),
                Center(
                  child: Text(
                    "Diagnostiquez votre peau en moins de 4 minutes. Vous obtiendrez votre protocole de soin sur mesure.",
                    style: const TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ),
                Center(
                  child: Text(
                    "Toutes les formules sont scientifiquement validées. Répondez à vos besoins et vos spécificités.",
                    style: const TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ),
              ],
            ),
          ),

          // Page Indicator Dots
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(3, (index) {
              return Container(
                margin: const EdgeInsets.all(4.0),
                width: 10,
                height: 10,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: _currentPage == index ? Colors.green : Colors.grey,
                ),
              );
            }),
          ),

          // Buttons for Login and Guest Mode
          Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 20.0, horizontal: 40.0),
            child: Column(
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green, // Green background
                    foregroundColor: Colors.black, // Black text color
                    minimumSize: const Size(double.infinity, 50),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const LoginPage(),
                      ),
                    );
                  },
                  child: const Text('Se connecter'),
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green, // Green background
                    foregroundColor: Colors.white, // White text color
                    minimumSize: const Size(double.infinity, 50),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const GuestPage(),
                      ),
                    );
                  },
                  child: const Text('Mode invité'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Method to build each paragraph in the PageView
  Widget _buildParagraph(String header2, String header3) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            header2,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            header3,
            style: const TextStyle(
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
}
