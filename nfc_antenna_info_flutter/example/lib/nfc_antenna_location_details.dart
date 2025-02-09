import 'package:flutter/material.dart';
import 'package:nfc_antenna_info_flutter/nfc_antenna_info_flutter.dart';
import 'package:nfc_antenna_info_flutter_example/phone_painter.dart';
import 'package:nfc_antenna_info_flutter_example/pulsing_circle.dart';

class NfcAntennaLocationDetails extends StatelessWidget {
  const NfcAntennaLocationDetails({
    required this.nfcAntennaResponse,
    super.key,
  });

  final NfcAntennaResponse nfcAntennaResponse;

  @override
  Widget build(BuildContext context) {
    const padding = 64.0;
    final screenWidth = MediaQuery.sizeOf(context).width;
    final canvasWidth = screenWidth - (2 * padding);
    final deviceWidth = nfcAntennaResponse.deviceWidth;
    final deviceHeight = nfcAntennaResponse.deviceHeight;
    final aspectRatio = deviceHeight / deviceWidth;
    final canvasHeight = canvasWidth * aspectRatio;
    final realNfcLocationX =
        nfcAntennaResponse.availableNfcAntennas.first.locationX;
    final realNfcLocationY =
        nfcAntennaResponse.availableNfcAntennas.first.locationY;
    final scaleFactor = canvasWidth / deviceWidth;
    final nfcLocationX = realNfcLocationX * scaleFactor;
    final nfcLocationY = realNfcLocationY * scaleFactor;
    const pulseSize = 100.0;
    const nfcIconSize = 32.0;
    const distanceFromOrigin = (pulseSize - nfcIconSize) / 2;
    final nfcLocationFromLeft = nfcLocationX - distanceFromOrigin;
    final nfcLocationFromTop = nfcLocationY - distanceFromOrigin;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: padding),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 16,
          ),
          Text(
            'Location of the antenna on the X and Y axis in millimeters:'
            ' ($realNfcLocationX, $realNfcLocationY).',
          ),
          const SizedBox(
            height: 32,
          ),
          const Text(
            'Where to scan NFC tags effectively:',
          ),
          const SizedBox(
            height: 16,
          ),
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
      ),
    );
  }
}
