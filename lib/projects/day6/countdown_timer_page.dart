import 'package:flutter/material.dart';
import 'dart:async';

class CountdownTimerPage extends StatefulWidget {
  const CountdownTimerPage({Key? key}) : super(key: key);

  @override
  State<CountdownTimerPage> createState() => _CountdownTimerPageState();
}

class _CountdownTimerPageState extends State<CountdownTimerPage> {

  final TextEditingController _controller = TextEditingController();

  Timer? _timer;

  int _secondsLeft = 0;

  bool _isRunning = false;

  bool _isFinished = false;

  @override
  void dispose() {
    _timer?.cancel();
    _controller.dispose();
    super.dispose();
  }

  void _startCountdown() {
    final input = int.tryParse(_controller.text);

    if (input != null && input > 0) {
      setState(() {
        _secondsLeft = input;
        _isRunning = true;
        _isFinished = false;
      });

      _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
        setState(() {
          if (_secondsLeft > 0) {
            _secondsLeft--;
          } else {
            _timer?.cancel();
            _isRunning = false;
            _isFinished = true;
          }
        });
      });
    }
  }

  void _resetTimer() {
    setState(() {
      _timer?.cancel();
      _secondsLeft = 0;
      _isRunning = false;
      _isFinished = false;
      _controller.clear();
    });
  }

  String _formatTime(int seconds) {
    final minutes = (seconds / 60).floor();
    final secs = seconds % 60;
    return '${minutes.toString().padLeft(2, '0')}:${secs.toString().padLeft(2, '0')}';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        backgroundColor: const Color(0xFF5B5FC7),
        title: const Row(
          children: [
            Icon(Icons.timer, color: Colors.white, size: 20),
            SizedBox(width: 8),
            Text(
              'Bộ đếm thời gian',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
              ),
            ),
          ],
        ),
        elevation: 0,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Nhập số giây cần đếm:',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.black54,
                ),
              ),
              
              const SizedBox(height: 16),

              SizedBox(
                width: 120,
                child: TextField(
                  controller: _controller,
                  keyboardType: TextInputType.number,
                  enabled: !_isRunning,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.black87,
                  ),
                  decoration: InputDecoration(
                    hintText: '10',
                    hintStyle: TextStyle(color: Colors.grey[400]),
                    filled: true,
                    fillColor: Colors.white,
                    contentPadding: const EdgeInsets.symmetric(
                      vertical: 12,
                      horizontal: 16,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(4),
                      borderSide: BorderSide(color: Colors.grey[300]!),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(4),
                      borderSide: BorderSide(color: Colors.grey[300]!),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(4),
                      borderSide: BorderSide(color: Colors.grey[400]!),
                    ),
                  ),
                ),
              ),
              
              const SizedBox(height: 40),

              if (_isFinished)
                const Column(
                  children: [
                    Text(
                      '⏱️',
                      style: TextStyle(fontSize: 50),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Hết thời gian!',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w500,
                        color: Colors.black87,
                      ),
                    ),
                  ],
                )
              else
                Text(
                  _formatTime(_secondsLeft),
                  style: TextStyle(
                    fontSize: 80,
                    fontWeight: FontWeight.w300,
                    color: Colors.green[600],
                    letterSpacing: 2,
                  ),
                ),
              
              const SizedBox(height: 40),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: _isRunning ? null : _startCountdown,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.grey[300],
                      foregroundColor: Colors.black87,
                      disabledBackgroundColor: Colors.grey[200],
                      disabledForegroundColor: Colors.grey[400],
                      padding: const EdgeInsets.symmetric(
                        horizontal: 24,
                        vertical: 10,
                      ),
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ),
                    child: const Text(
                      'Bắt đầu',
                      style: TextStyle(fontSize: 14),
                    ),
                  ),
                  
                  const SizedBox(width: 12),

                  ElevatedButton(
                    onPressed: _resetTimer,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.grey[600],
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 24,
                        vertical: 10,
                      ),
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ),
                    child: const Text(
                      'Đặt lại',
                      style: TextStyle(fontSize: 14),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}