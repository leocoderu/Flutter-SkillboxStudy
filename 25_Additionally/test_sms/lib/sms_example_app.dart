import 'package:flutter/material.dart';
import 'package:sms_sender/sms_sender.dart';

class SmsExampleApp extends StatefulWidget {
  const SmsExampleApp({super.key});

  @override
  State<SmsExampleApp> createState() => _SmsExampleAppState();
}

class _SmsExampleAppState extends State<SmsExampleApp> {
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _messageController = TextEditingController();

  List<Map<String, dynamic>> _simCards = [];
  int? _selectedSimIndex;
  String _statusMessage = '';

  Future<void> _fetchSimCards() async {
    try {
      List<Map<String, dynamic>> sims = await SmsSender.getSimCards();
      if (mounted) {
        setState(() {
          _simCards = sims;
        });
      }
    } catch (e) {
      if (mounted) {
        setState(() {
          _statusMessage = 'Error getting SIM cards: $e';
        });
      }
    }
  }

  Future<void> _sendSms() async {
    String phoneNumber = _phoneController.text.trim();
    String message = _messageController.text.trim();

    if (phoneNumber.isEmpty || message.isEmpty) {
      setState(() {
        _statusMessage = 'Numbers and messages cannot be empty!';
      });
      return;
    }

    if (_selectedSimIndex == null) {
      setState(() {
        _statusMessage = 'Select SIM before sending SMS!';
      });
      return;
    }

    try {
      String result = await SmsSender.sendSms(
        phoneNumber: phoneNumber,
        message: message,
        simSlot: _selectedSimIndex!,
      );
      setState(() {
        _statusMessage = result;
      });
    } catch (e) {
      setState(() {
        _statusMessage = 'Failed to send SMS: $e';
      });
    }
  }

  void _showSimSelection() {
    if (_simCards.isEmpty) {
      setState(() {
        _statusMessage = 'No SIM detected!';
      });
      return;
    }

    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: _simCards
                .asMap()
                .entries
                .map((entry) {
              int index = entry.key;
              Map<String, dynamic> sim = entry.value;
              return ListTile(
                title: Text('${sim['carrierName']} (SIM $index)'),
                onTap: () {
                  setState(() {
                    _selectedSimIndex = index;
                  });
                  Navigator.pop(context);
                },
              );
            }).toList(),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('SMS Sender Example')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _phoneController,
              keyboardType: TextInputType.phone,
              decoration: const InputDecoration(labelText: 'Phone number'),
            ),
            TextField(
              controller: _messageController,
              maxLines: 3,
              decoration: const InputDecoration(labelText: 'Message'),
            ),
            const SizedBox(height: 20),
            GestureDetector(
              onTap: () async {
                await _fetchSimCards().then(
                      (value) {
                    _showSimSelection();
                  },
                );
              },
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16),
                margin: const EdgeInsets.symmetric(vertical: 8),
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: Text(
                    _selectedSimIndex == null
                        ? 'Select SIM'
                        : 'SIM ${_selectedSimIndex! + 1} Selected',
                    style: const TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: _sendSms,
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16),
                margin: const EdgeInsets.symmetric(vertical: 8),
                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Center(
                  child: Text(
                    'Send SMS',
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Text(
              _statusMessage,
              style: const TextStyle(color: Colors.red),
            ),
          ],
        ),
      ),
    );
  }
}