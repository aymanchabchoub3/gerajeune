import 'package:flutter/material.dart';
import 'produit_utilise.dart'; // Import the ProduitUtilisePage

class PeauSensiblePage extends StatefulWidget {
  const PeauSensiblePage({Key? key}) : super(key: key);

  @override
  _PeauSensiblePageState createState() => _PeauSensiblePageState();
}

class _PeauSensiblePageState extends State<PeauSensiblePage> {
  String? selectedSensitivity; // Tracks selected sensitivity: "Oui" or "Non"
  String? selectedSkinTone; // Tracks selected skin tone

  final List<Map<String, String>> skinTones = [
    {'image': 'assets/images/claire.png', 'name': 'Claire'},
    {'image': 'assets/images/modere.png', 'name': 'Modéré'},
    {'image': 'assets/images/mate.png', 'name': 'Maté'},
    {'image': 'assets/images/brune.png', 'name': 'Brune'},
    {'image': 'assets/images/brun_fonce.png', 'name': 'Brun Foncé'},
    {'image': 'assets/images/noire.png', 'name': 'Noire'},
  ];

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
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // First question image with more width
              _buildCardImage('assets/images/peau_sensible.png',
                  width: double.infinity),
              const SizedBox(height: 20),
              // "Oui" and "Non" buttons with rounded corners and elevation
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buildOptionButton('Oui'),
                  const SizedBox(width: 30),
                  _buildOptionButton('Non'),
                ],
              ),
              const SizedBox(height: 20),
              // Second question image with card style
              _buildCardImage('assets/images/peau_sensible2.png',
                  width: double.infinity),

              // Skin tone selection grid with images
              Expanded(
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                  ),
                  itemCount: skinTones.length,
                  itemBuilder: (context, index) {
                    final skinTone = skinTones[index];
                    final isSelected = selectedSkinTone == skinTone['name'];
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedSkinTone = skinTone['name'];
                        });
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            color:
                                isSelected ? Colors.black : Colors.transparent,
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(12.0),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black26,
                              blurRadius: 4,
                              offset: Offset(2, 2),
                            ),
                          ],
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(12.0),
                          child: Image.asset(
                            skinTone['image']!,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: 20),
              // Navigation buttons with improved design
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
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        padding: const EdgeInsets.symmetric(vertical: 16.0),
                        shadowColor: Colors.grey.withOpacity(0.5),
                        elevation: 5,
                      ),
                      child: const Text('Précédent'),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: (selectedSensitivity != null &&
                              selectedSkinTone != null)
                          ? () {
                              // Navigate to ProduitUtilisePage
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      const ProduitUtilisePage(),
                                ),
                              );
                            }
                          : null,
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.white,
                        backgroundColor: Colors.green,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        padding: const EdgeInsets.symmetric(vertical: 16.0),
                        shadowColor: Colors.green.withOpacity(0.5),
                        elevation: 5,
                      ),
                      child: const Text('Continuez'),
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

  // Helper method to build card-style images with adjustable width
  Widget _buildCardImage(String imagePath, {double? width}) {
    return Container(
      width: width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 6,
            offset: Offset(2, 4),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12.0),
        child: Image.asset(
          imagePath,
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  // Helper method to build "Oui" and "Non" buttons with rounded corners and animations
  Widget _buildOptionButton(String text) {
    final isSelected = selectedSensitivity == text;
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedSensitivity = text;
        });
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        decoration: BoxDecoration(
          color: isSelected ? Colors.green : Colors.white,
          borderRadius: BorderRadius.circular(25.0),
          border: Border.all(
            color: Colors.green,
            width: 2,
          ),
          boxShadow: isSelected
              ? [
                  BoxShadow(
                    color: Colors.green.withOpacity(0.4),
                    blurRadius: 8,
                    offset: const Offset(0, 4),
                  ),
                ]
              : [],
        ),
        padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 32.0),
        child: Text(
          text,
          style: TextStyle(
            color: isSelected ? Colors.white : Colors.green,
            fontSize: 16.0,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
