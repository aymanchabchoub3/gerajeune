import 'package:flutter/material.dart';

class ProtectionSolairePreferezPage extends StatefulWidget {
  @override
  _ProtectionSolairePreferezPageState createState() =>
      _ProtectionSolairePreferezPageState();
}

class _ProtectionSolairePreferezPageState
    extends State<ProtectionSolairePreferezPage> {
  String? selectedOption;
  String? selectedAdditionalOption;
  bool showAdditionalImages = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFe0f2f1), Color(0xFF256142)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Image.asset(
                'assets/images/protection_solaire2.png',
                width: MediaQuery.of(context).size.width,
                height: 90,
                fit: BoxFit.cover,
              ),
              const SizedBox(height: 20),
              _buildProtectionOption(
                'Non teintée',
                'assets/images/non_teintee.png',
              ),
              const SizedBox(height: 20),
              _buildProtectionOption(
                'Teintée',
                'assets/images/teintee.png',
              ),
              if (showAdditionalImages && selectedOption == 'Teintée') ...[
                const SizedBox(height: 20),
                _buildAdditionalOption(
                  'Teinte claire rosée',
                  'assets/images/teinte_claire_rosee.png',
                ),
                const SizedBox(height: 20),
                _buildAdditionalOption(
                  'Teinte moyenne peche',
                  'assets/images/teinte_moyenne_peche.png',
                ),
              ],
              const SizedBox(height: 390), // Add spacing before buttons
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
                      onPressed: () {
                        // Handle "Continuer" button action
                      },
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

  Widget _buildProtectionOption(String label, String imagePath) {
    final isSelected = selectedOption == label;

    return GestureDetector(
      onTap: () {
        setState(() {
          selectedOption = label;
          showAdditionalImages = label == 'Teintée';
          selectedAdditionalOption = null; // Reset additional option selection
        });
      },
      child: Row(
        children: [
          Container(
            decoration: BoxDecoration(
              border:
                  isSelected ? Border.all(color: Colors.black, width: 3) : null,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Image.asset(
              imagePath,
              width: 100,
              height: 100,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 20),
          Expanded(
            child: Text(
              label,
              style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  color: Color.fromARGB(255, 97, 96, 96)),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAdditionalOption(String label, String imagePath) {
    final isSelected = selectedAdditionalOption == label;

    return GestureDetector(
      onTap: () {
        setState(() {
          selectedAdditionalOption = label;
        });
      },
      child: Row(
        children: [
          SizedBox(
            width: 40,
          ),
          Container(
            decoration: BoxDecoration(
              border:
                  isSelected ? Border.all(color: Colors.black, width: 3) : null,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Image.asset(
              imagePath,
              width: 100,
              height: 100,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 20),
          Expanded(
            child: Text(
              label,
              style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  color: Color.fromARGB(255, 97, 96, 96)),
            ),
          ),
        ],
      ),
    );
  }
}
