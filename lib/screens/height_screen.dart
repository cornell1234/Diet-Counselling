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

  class _HeightScreenState extends State<HeightScreen> {
  CameraController _controller;
  List<CameraDescription> _cameras;

  double _height;

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

  Future<void> _takePicture() async {
    // Check if the controller is initialized
    if (!_controller.value.isInitialized) {
      return;
    }

    try {
      // Take a picture
      final image = await _controller.takePicture();

      // Process the image to extract the height information
      // ...

      // Update the height variable
      setState(() {
        _height = height; // replace with the extracted height
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    // If the controller is null, display a loading indicator
    if (_controller == null || !_controller.value.isInitialized) {
      return Center(child: CircularProgressIndicator());
    }

    // Otherwise, display the camera preview and the height measurement
    return Stack(
      children: [
        AspectRatio(
          aspectRatio: _controller.value.aspectRatio,
          child: CameraPreview(_controller),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            color: Colors.black,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                  icon: Icon(Icons.camera_alt),
                  onPressed: _takePicture,
                  color: Colors.white,
                ),
                Text(
                  _height != null ? 'Height: $_height cm' : '',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

    // Initialize the controller
    await _controller.initialize();

    // Start the camera preview
    setState(() {});
  };

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

}