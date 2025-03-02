import 'package:flutter/material.dart';
import 'package:nfc_antenna_info_flutter/nfc_antenna_info_flutter.dart';
import 'package:nfc_antenna_info_flutter_example/nfc_antenna_location_details.dart';

void main() {
  runApp(const MyApp());
}

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
  NfcAntennaResponse? nfcAntennaResponse;

  @override
  void initState() {
    super.initState();
    nfcAntennaInfo = const NfcAntennaInfo();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'NFC Locator',
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: ElevatedButton(
              onPressed: () async {
                final response = await nfcAntennaInfo.getNfcAntennaInfo();
                setState(() => nfcAntennaResponse = response);
              },
              child: const Text(
                'Get NFC Antenna Location',
              ),
            ),
          ),
          if (nfcAntennaResponse != null)
            NfcAntennaLocationDetails(
              nfcAntennaResponse: nfcAntennaResponse!,
            ),
        ],
      ),
    );
  }
}
