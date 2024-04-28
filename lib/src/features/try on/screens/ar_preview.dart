import 'package:flutter/material.dart';
import 'package:deepar_flutter/deepar_flutter.dart';
import 'package:optiglamcustomer/src/features/try%20on/screens/filter_screen.dart';

class ArPreview extends StatelessWidget {
  ArPreview({super.key, required this.filePath});
  final String filePath;
  final DeepArController _controller = DeepArController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: [
          TextButton(onPressed: (){
            _controller.destroy();
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => FilterScreen()));
          }, child: Text('back')),
          FutureBuilder(
            future: _controller?.initialize(
              androidLicenseKey:
              "c1a07e8bd7cde35173f9b3332ca1a73ce84741cc3da33cc9fb31b3e248c2ea06ce0c83718bbc7504",
              iosLicenseKey:
              "0d760a36c25b04c870109e7c28f8e2cb57dd1b3af1754874eea7547b4b2bc749ca55c68634262ff2",
              resolution: Resolution.high,
            ),
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return Center(child: Text('Error: ${snapshot.error}'));
              }
              if (snapshot.connectionState == ConnectionState.done) {
                _controller.switchEffectWithSlot(
                    slot: 'filters', path: filePath);
                return DeepArPreview(_controller);
              }
              return Center(child: CircularProgressIndicator());
            },
          ),
        ],
      ),
    );
  }
}
