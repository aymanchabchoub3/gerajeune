import 'package:flutter/material.dart';
import 'protection_solaire.dart'; // Import the new page

class EcranPage extends StatefulWidget {
  const EcranPage({Key? key}) : super(key: key);

  @override
  _EcranPageState createState() => _EcranPageState();
}

class _EcranPageState extends State<EcranPage> {
  String? selectedOption;

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final buttonHeight = screenHeight * 0.6; // Adjust the height as needed

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFe0f2f1), Color(0xFF256142)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Image at the top
              Image.asset(
                'assets/images/heure_ecran.png',
                width: MediaQuery.of(context).size.width,
                height: 160,
                fit: BoxFit.cover,
              ),
              const SizedBox(height: 20),
              // Buttons in a column with equal width
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    _buildOptionButton(context, '0-3 heures'),
                    const SizedBox(height: 10),
                    _buildOptionButton(context, '4-7 heures'),
                    const SizedBox(height: 10),
                    _buildOptionButton(context, 'Plus que 7 heures'),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              // Previous and Continue buttons
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.black,
                        backgroundColor: Colors.grey[300],
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        padding: const EdgeInsets.symmetric(vertical: 16.0),
                        shadowColor: Colors.grey.withOpacity(0.5),
                        elevation: 5,
                      ),
                      child: const Text('Précédent',
                          style: TextStyle(fontSize: 16)),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: selectedOption != null
                          ? () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      const ProtectionSolairePage(
                                    selectedOption: '',
                                    buttonStateNotifier: null,
                                  ),
                                ),
                              );
                            }
                          : null,
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.white,
                        backgroundColor: Colors.green,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        padding: const EdgeInsets.symmetric(vertical: 16.0),
                        shadowColor: Colors.green.withOpacity(0.5),
                        elevation: 5,
                      ),
                      child: const Text('Continuer',
                          style: TextStyle(fontSize: 16)),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildOptionButton(BuildContext context, String label) {
    final isSelected = selectedOption == label;

    return FractionallySizedBox(
      widthFactor: 1.0, // Take full width of the parent
      child: ElevatedButton(
        onPressed: () {
          setState(() {
            selectedOption = label;
          });
        },
        style: ElevatedButton.styleFrom(
          foregroundColor: isSelected ? Colors.white : Colors.green,
          backgroundColor: isSelected ? Colors.green : Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0),
            side: BorderSide(color: Colors.green, width: 2),
          ),
          padding: const EdgeInsets.symmetric(vertical: 16.0),
          shadowColor: Colors.grey.withOpacity(0.3),
          elevation: 3,
          minimumSize: Size(
              double.infinity, 50), // Ensures the buttons are the same width
        ),
        child: Text(
          label,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
        ),
      ),
    );
  }
}
