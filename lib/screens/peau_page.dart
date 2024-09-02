import 'package:flutter/material.dart';
import 'package:gerajeune/screens/peau_sensible.dart';

class PeauPage extends StatefulWidget {
  const PeauPage({super.key});

  @override
  _PeauPageState createState() => _PeauPageState();
}

class _PeauPageState extends State<PeauPage> {
  final List<Map<String, String>> skinTypes = [
    {'image': 'assets/images/gras.png', 'text': 'Gras'},
    {'image': 'assets/images/seche.png', 'text': 'Sèche'},
    {'image': 'assets/images/normal.png', 'text': 'Normale'},
    {'image': 'assets/images/mixte.png', 'text': 'Mixte'},
    {'image': 'assets/images/jamais.png', 'text': 'Jamais'},
    {'image': 'assets/images/rarement.png', 'text': 'Rarement'},
    {'image': 'assets/images/parfois.png', 'text': 'Parfois'},
    {'image': 'assets/images/toujours.png', 'text': 'Toujours'},
  ];

  final Set<int> _selectedTypes = {};
  final Set<int> _selectedLimitedTypes = {}; // For the last four types

  @override
  Widget build(BuildContext context) {
    // Split the list into two parts
    final List<Map<String, String>> firstPart = skinTypes.take(4).toList();
    final List<Map<String, String>> secondPart = skinTypes.skip(4).toList();

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 20),
              Image.asset('assets/images/peau1.png'),
              const SizedBox(height: 10),
              // Container for the first list
              Column(
                children: firstPart.map((skinType) {
                  final index = firstPart.indexOf(skinType);
                  final isSelected = _selectedTypes.contains(index);
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        if (isSelected) {
                          _selectedTypes.remove(index);
                        } else {
                          _selectedTypes.add(index);
                        }
                      });
                    },
                    child: Container(
                      margin: const EdgeInsets.symmetric(vertical: 4.0),
                      child: Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(
                                2), // Padding around the image
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: isSelected ? Colors.black : Colors.grey,
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: ClipOval(
                              child: Image.asset(
                                skinType['image']!,
                                width: 60,
                                height: 60,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          const SizedBox(width: 8),
                          Text(
                            skinType['text']!,
                            style: const TextStyle(fontSize: 16),
                          ),
                        ],
                      ),
                    ),
                  );
                }).toList(),
              ),
              const SizedBox(height: 20),
              Image.asset('assets/images/peau2.png'),
              const SizedBox(height: 10),
              // Container for the second list
              Column(
                children: secondPart.map((skinType) {
                  final index = secondPart.indexOf(skinType) + 4;
                  final isSelected = _selectedLimitedTypes.contains(index);
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        if (isSelected) {
                          _selectedLimitedTypes.remove(index);
                        } else if (_selectedLimitedTypes.isEmpty) {
                          _selectedLimitedTypes.add(index);
                        }
                      });
                    },
                    child: Container(
                      margin: const EdgeInsets.symmetric(vertical: 4.0),
                      child: Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(
                                2), // Padding around the image
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: isSelected ? Colors.black : Colors.grey,
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: ClipOval(
                              child: Image.asset(
                                skinType['image']!,
                                width: 60,
                                height: 60,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          const SizedBox(width: 8),
                          Text(
                            skinType['text']!,
                            style: const TextStyle(fontSize: 16),
                          ),
                        ],
                      ),
                    ),
                  );
                }).toList(),
              ),
              const SizedBox(height: 40),
              // Row for buttons
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Container(
                      margin: const EdgeInsets.only(right: 8.0),
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.grey,
                          backgroundColor: Colors.white,
                          side: const BorderSide(color: Colors.grey, width: 1),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                        child: const Text('Précédent'),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      margin: const EdgeInsets.only(left: 8.0),
                      child: ElevatedButton(
                        onPressed: _selectedTypes.isNotEmpty &&
                                _selectedLimitedTypes.isNotEmpty
                            ? () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const PeauSensiblePage()),
                                );
                              }
                            : null,
                        style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.white,
                          backgroundColor: _selectedTypes.isNotEmpty &&
                                  _selectedLimitedTypes.isNotEmpty
                              ? Colors.green
                              : const Color.fromARGB(255, 151, 118, 118),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                        child: const Text('Continuer'),
                      ),
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
}