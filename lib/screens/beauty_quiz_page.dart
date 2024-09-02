import 'package:flutter/material.dart';
import 'package:gerajeune/screens/genre_page.dart';

class BeautyQuizPage extends StatefulWidget {
  const BeautyQuizPage({super.key});

  @override
  _BeautyQuizPageState createState() => _BeautyQuizPageState();
}

class _BeautyQuizPageState extends State<BeautyQuizPage> {
  final List<String> beautyGoals = [
    'Hydratation',
    'Éclaircissement',
    'Lissage',
    'Unification du teint',
    'Réduction de rougeurs',
    'Réduction de l’acné',
    'Fermeté',
    'Apaisement',
    'Réduction des pores',
    'Réduction de sébum',
    'Cernes',
    'Poches'
  ];

  final Set<int> selectedGoals = {};

  void _onGoalPressed(int index) {
    setState(() {
      if (selectedGoals.contains(index)) {
        selectedGoals.remove(index);
      } else if (selectedGoals.length < 4) {
        selectedGoals.add(index);
      }
    });
  }

  void _onContinuePressed() {
    if (selectedGoals.length == 4) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const GenrePage(),
        ),
      );
    } else {
      _showSelectionErrorDialog();
    }
  }

  void _showSelectionErrorDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Sélection Incomplète'),
        content: const Text(
            'Vous devez sélectionner exactement 4 objectifs de beauté.'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100], // Light background color
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 20),
            Image.asset(
              'assets/images/box.png', // Replace with your image asset
              width: double.infinity,
              height: 125,
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 16),
            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, // 2 columns
                  childAspectRatio: 2.5, // Adjusted aspect ratio
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                ),
                itemCount: beautyGoals.length,
                itemBuilder: (context, index) {
                  final isSelected = selectedGoals.contains(index);
                  return ElevatedButton(
                    onPressed: () => _onGoalPressed(index),
                    style: ElevatedButton.styleFrom(
                      backgroundColor:
                          isSelected ? const Color(0xFF256142) : Colors.white,
                      side: BorderSide(
                        color:
                            isSelected ? const Color(0xFF256142) : Colors.grey,
                        width: 2,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      elevation: 8,
                      shadowColor: Colors.black.withOpacity(0.3),
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 25), // Adjusted padding
                    ),
                    child: Text(
                      beautyGoals[index],
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color:
                            isSelected ? Colors.white : const Color(0xFF256142),
                        fontWeight: FontWeight.bold,
                        fontSize: 14, // Adjusted font size
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.grey,
                    backgroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(
                      vertical: 14,
                      horizontal: 24,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    side: const BorderSide(color: Colors.grey, width: 2),
                  ),
                  child: const Text(
                    'Précédent',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
                ElevatedButton(
                  onPressed: _onContinuePressed,
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: const Color(0xFF256142),
                    padding: const EdgeInsets.symmetric(
                      vertical: 14,
                      horizontal: 24,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    elevation: 8,
                    shadowColor: Colors.black.withOpacity(0.3),
                  ),
                  child: const Text(
                    'Continuer',
                    style: TextStyle(fontSize: 16),
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