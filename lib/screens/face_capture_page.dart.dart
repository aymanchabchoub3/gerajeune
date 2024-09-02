import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'dart:async';

class FaceCapturePage extends StatefulWidget {
  const FaceCapturePage(
      {super.key, required Null Function(dynamic progress) onFaceDetected});

  @override
  _FaceCapturePageState createState() => _FaceCapturePageState();
}

class _FaceCapturePageState extends State<FaceCapturePage> {
  late CameraController _cameraController;
  Future<void>? _initializeControllerFuture;
  bool _isRecording = false;
  late String _videoPath;
  int _step = 0;
  Timer? _timer;
  final List<String> _instructions = [
    'Positionnez votre visage dans le cadre',
    'Tournez votre visage à droite',
    'Tournez votre visage à gauche',
    'Tournez votre visage vers le haut',
    'Tournez votre visage vers le bas',
    'Positionnez votre visage dans le cadre',
    'Tournez votre visage à droite',
    'Tournez votre visage à gauche',
    'Tournez votre visage vers le haut',
    'Tournez votre visage vers le bas',
  ];

  @override
  void dispose() {
    _cameraController.dispose();
    _timer?.cancel();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _initializeCamera();
  }

  Future<void> _initializeCamera() async {
    try {
      final cameras = await availableCameras();
      final frontCamera = cameras.firstWhere(
        (camera) => camera.lensDirection == CameraLensDirection.front,
        orElse: () => cameras.first,
      );

      _cameraController = CameraController(
        frontCamera,
        ResolutionPreset.high,
      );

      _initializeControllerFuture = _cameraController.initialize();
      await _initializeControllerFuture;

      // Set zoom level (adjust as needed)
      await _cameraController.setZoomLevel(1.0);

      setState(() {});
      _startRecording();
    } catch (e) {
      print('Error initializing camera: $e');
    }
  }

  Future<void> _startRecording() async {
    if (!_cameraController.value.isInitialized) {
      print('Error: Camera is not initialized');
      return;
    }

    try {
      final Directory extDir = await getApplicationDocumentsDirectory();
      final String dirPath = '${extDir.path}/Videos';
      await Directory(dirPath).create(recursive: true);
      final String filePath =
          '$dirPath/video_${DateTime.now().millisecondsSinceEpoch}.mp4';
      await _cameraController.startVideoRecording();
      setState(() {
        _isRecording = true;
        _step = 0;
      });

      _timer = Timer.periodic(const Duration(seconds: 2), (timer) {
        if (_step < _instructions.length - 1) {
          setState(() {
            _step++;
          });
        } else {
          _stopRecording();
          timer.cancel();
        }
      });
      print('Recording started');
    } catch (e) {
      print('Error during video recording: $e');
    }
  }

  Future<void> _stopRecording() async {
    if (!_cameraController.value.isInitialized) {
      print('Error: Camera is not initialized');
      return;
    }

    try {
      XFile videoFile = await _cameraController.stopVideoRecording();
      setState(() {
        _isRecording = false;
        _videoPath = videoFile.path;
      });
      print('Video recorded to: $_videoPath');
    } catch (e) {
      print('Error during video stopping: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    final percentage = (_step / (_instructions.length - 1)) * 100;

    return Scaffold(
      backgroundColor: Colors.black.withOpacity(0.7),
      body: FutureBuilder<void>(
        future: _initializeControllerFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            }
            return Stack(
              children: [
                Positioned.fill(
                  child: ClipRect(
                    child: Align(
                      alignment: Alignment.center,
                      widthFactor: 1.0, // Adjust as needed
                      heightFactor: 1.0, // Adjust as needed
                      child: CameraPreview(_cameraController),
                    ),
                  ),
                ),
                Positioned(
                  top: 20,
                  left: 0,
                  right: 0,
                  child: Center(
                    child: Text(
                      _instructions[_step],
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                Positioned(
                  top: MediaQuery.of(context).size.height * 0.28,
                  left: 0,
                  right: 0,
                  child: Center(
                    child: Stack(
                      children: [
                        Container(
                          width: 300, // Adjust size as needed
                          height: 300, // Adjust size as needed
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: Colors.white,
                              width: 3,
                            ),
                          ),
                        ),
                        Container(
                          width: 300,
                          height: 300,
                          alignment: Alignment.center,
                          child: Text(
                            '${percentage.toStringAsFixed(0)}%',
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Positioned.fill(
                          child: CustomPaint(
                            painter: ProgressCirclePainter(
                                _step / (_instructions.length - 1)),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                if (_step == _instructions.length - 1)
                  const Center(
                    child: Text(
                      'Enregistrement terminé!',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
              ],
            );
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}

class CircleClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final double radius = size.width / 2;
    final Path path = Path()
      ..addOval(Rect.fromCircle(
          center: Offset(size.width / 2, size.height / 2), radius: radius));
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

class ProgressCirclePainter extends CustomPainter {
  final double progress;

  ProgressCirclePainter(this.progress);

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = Colors.green
      ..style = PaintingStyle.stroke
      ..strokeWidth = 6
      ..strokeCap = StrokeCap.round;

    final double radius = size.width / 2;
    const double startAngle = -90 * 3.14 / 180;
    final double sweepAngle = 2 * 3.14 * progress;

    canvas.drawArc(
      Rect.fromLTWH(0, 0, size.width, size.height),
      startAngle,
      sweepAngle,
      false,
      paint,
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
