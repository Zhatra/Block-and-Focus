import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_accessibility_service/constants.dart';
import 'package:flutter_accessibility_service/flutter_accessibility_service.dart';

class BlockingOverlay extends StatelessWidget {
  const BlockingOverlay({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<String>(
      future: _getWord(),
      builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
        if (snapshot.hasData) {
          return Material(
            color: Colors.white,
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 15.0),
                  Text('Word: ${snapshot.data}'), // Display the word
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
        } else {
          return CircularProgressIndicator();
        }
      },
    );
  }

  Future<String> _getWord() async {
    final prefs = await SharedPreferences.getInstance();
    final word = prefs.getString('word') ?? '';
    return word;
  }
}
