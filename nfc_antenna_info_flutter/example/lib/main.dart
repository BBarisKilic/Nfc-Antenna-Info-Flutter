import 'package:flutter/material.dart';
import 'package:nfc_antenna_info_flutter/nfc_antenna_info_flutter.dart';
import 'package:nfc_antenna_info_flutter_example/phone_painter.dart';
import 'package:nfc_antenna_info_flutter_example/pulsing_circle.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: HomePage());
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final NfcAntennaInfo nfcAntennaInfo;

  @override
  void initState() {
    super.initState();
    nfcAntennaInfo = const NfcAntennaInfo();
  }

  @override
  Widget build(BuildContext context) {
    const padding = 64.0;
    final screenWidth = MediaQuery.sizeOf(context).width;
    final canvasWidth = screenWidth - (2 * padding);

    return Scaffold(
      appBar: AppBar(title: const Text('NFC Locator')),
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: padding, vertical: 16),
            child: Text(
              'The location is marked on a visual '
              'representation of your phone, making it easy to identify '
              'where to scan NFC tags effectively.',
            ),
          ),
          Expanded(
            child: FutureBuilder(
              future: nfcAntennaInfo.getNfcAntennaInfo(),
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  WidgetsBinding.instance.addPostFrameCallback((_) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        backgroundColor: Theme.of(context).primaryColor,
                        content: Text('${snapshot.error}'),
                      ),
                    );
                  });
                }
                if (!snapshot.hasData) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }

                final deviceHeight = snapshot.data!.deviceHeight;
                final deviceWidth = snapshot.data!.deviceWidth;
                final aspectRatio = deviceHeight / deviceWidth;
                final canvasHeight = canvasWidth * aspectRatio;
                final realNfcLocationX =
                    snapshot.data!.availableNfcAntennas.first.locationX;
                final realNfcLocationY =
                    snapshot.data!.availableNfcAntennas.first.locationY;
                final scaleFactor = canvasWidth / deviceWidth;
                final nfcLocationX = realNfcLocationX * scaleFactor;
                final nfcLocationY = realNfcLocationY * scaleFactor;
                const pulseSize = 100.0;
                const nfcIconSize = 32.0;
                const distanceFromOrigin = (pulseSize - nfcIconSize) / 2;
                final nfcLocationFromLeft = nfcLocationX - distanceFromOrigin;
                final nfcLocationFromTop = nfcLocationY - distanceFromOrigin;

                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Stack(
                      children: [
                        SizedBox(
                          width: canvasWidth,
                          height: canvasHeight,
                          child: CustomPaint(
                            size: Size(
                              canvasWidth,
                              canvasHeight,
                            ),
                            painter: PhonePainter(),
                          ),
                        ),
                        Positioned(
                          left: nfcLocationFromLeft,
                          top: nfcLocationFromTop,
                          child: const PulsingCircle(
                            size: pulseSize,
                            child: Icon(
                              Icons.nfc,
                              size: nfcIconSize,
                              color: Colors.cyan,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
