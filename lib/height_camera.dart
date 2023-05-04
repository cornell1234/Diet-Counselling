// import 'dart:io';
// import 'dart:math' as math;
// import 'package:flutter/material.dart';
// import 'package:camera/camera.dart';

// class HeightCamera extends StatefulWidget {
//   final List<CameraDescription> cameras;

//   const HeightCamera({Key? key, required this.cameras}) : super(key: key);

//   @override
//   _HeightCameraState createState() => _HeightCameraState();
// }

// class _HeightCameraState extends State<HeightCamera> {
//   late CameraController _controller;
//   late Future<void> _initializeControllerFuture;
//   double? _objectHeight;

//   @override
//   void initState() {
//     super.initState();
//     _controller = CameraController(
//       widget.cameras.first,
//       ResolutionPreset.medium,
//     );
//     _initializeControllerFuture = _controller.initialize();
//   }

//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('Height Camera')),
//       body: Column(
//         children: [
//           Expanded(
//             child: FutureBuilder<void>(
//               future: _initializeControllerFuture,
//               builder: (context, snapshot) {
//                 if (snapshot.connectionState == ConnectionState.done) {
//                   return CameraPreview(_controller);
//                 } else {
//                   return Center(child: CircularProgressIndicator());
//                 }
//               },
//             ),
//           ),
//           if (_objectHeight != null)
//             Text('Object height: ${_objectHeight?.toStringAsFixed(2)} meters'),
//           ElevatedButton(
//             onPressed: () async {
//               await _initializeControllerFuture;
//               final image = await _controller.takePicture();
//               final imagePath = image.path;
//               final imageHeight = await getImageHeight(imagePath);
//               setState(() {
//                 _objectHeight = imageHeight as double?;
//               });
//             },
//             child: Text('Measure height'),
//           ),
//         ],
//       ),
//     );
//   }

//   Future<int> getImageHeight(String imagePath) async {
//     final imageFile = File(imagePath);
//     final bytes = await imageFile.readAsBytes();
//     // add your object detection algorithm here to detect object height in pixels
//     final objectHeightInPixels = 700;
//     // add your camera calibration code here to calculate the object height in meters
//     final objectHeightInMeters = 7;
//     return objectHeightInMeters;
//   }
// }
