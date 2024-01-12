import 'package:flutter/material.dart';
import 'package:flutter_accessibility_service/constants.dart';
import 'package:flutter_accessibility_service/flutter_accessibility_service.dart';

class BlockingOverlay extends StatelessWidget {
  const BlockingOverlay({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network(
              'https://i.pinimg.com/736x/87/43/a1/8743a10b2b1958f8541af429ecf7e03e.jpg',
              width: 120.0,
            ),
            const SizedBox(height: 15.0),
            const Text(
              'Ayo here me out',
              style: TextStyle(
                color: Colors.black,
                fontSize: 25.0,
              ),
            ),
            const SizedBox(height: 15.0),
            // Add the dismiss button
            ElevatedButton(
              onPressed: () async {
                // Hide the overlay window
                FlutterAccessibilityService.hideOverlayWindow();
                // Perform the global action
                FlutterAccessibilityService.performGlobalAction(
                    GlobalAction.globalActionHome);
              },
              child: const Text('Dismiss'),
            ),
          ],
        ),
      ),
    );
  }
}
