import 'package:flutter/material.dart';
import 'package:camera/camera.dart';

class HeightScreen extends StatefulWidget {
  @override
  _HeightScreenState createState() => _HeightScreenState();
}

class _HeightScreenState extends State<HeightScreen> {
  late CameraController _controller;
  late List<CameraDescription> _cameras;

  @override
  void initState() {
    super.initState();
    // Initialize the camera controller
    _initializeCamera();
  }

  void _initializeCamera() async {
    // Get available cameras
    _cameras = await availableCameras();

    // Set the camera controller
    _controller = CameraController(
      // Use the first available camera
      _cameras[0],
      ResolutionPreset.high,
    );

    // Initialize the controller
    await _controller.initialize();

    // Start the camera preview
    setState(() {});
  }

  @override
  void dispose() {
    // Dispose the camera controller
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // If the controller is null, display a loading indicator
    if (_controller == null || !_controller.value.isInitialized) {
      return Center(child: CircularProgressIndicator());
    }

    // Otherwise, display the camera preview
    return AspectRatio(
      aspectRatio: _controller.value.aspectRatio,
      child: CameraPreview(_controller),
    );
  }
}

@override
Widget build(BuildContext context) {
  // TODO: implement build
  throw UnimplementedError();
}
