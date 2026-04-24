import 'dart:async';
import 'package:flutter/material.dart';

class ReadCircularProgresComponent extends StatefulWidget {
  final VoidCallback onRetry;
  final String retryText;

  const ReadCircularProgresComponent({
    super.key,
    required this.onRetry,
    this.retryText = "Yeniden Dene",
  });

  @override
  State<ReadCircularProgresComponent> createState() =>
      _ReadCircularProgresComponentState();
}

class _ReadCircularProgresComponentState
    extends State<ReadCircularProgresComponent> {
  bool _showRetry = false;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  void _startTimer() {
    // Sayacı sıfırlıyoruz ve progress bar'ı tekrar görünür yapıyoruz.
    setState(() {
      _showRetry = false;
    });

    _timer?.cancel();
    _timer = Timer(const Duration(seconds: 12), () {
      if (mounted) {
        setState(() {
          _showRetry = true;
        });
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void _handleRetry() {
    // Yeniden denediğimizde sayacı baştan başlatıp progress bar gösteriyoruz
    _startTimer();

    // Parametre olarak alınan fonksiyonu çalıştırıyoruz
    widget.onRetry();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: _showRetry
          ? ElevatedButton(
              onPressed: _handleRetry,
              child: Text(widget.retryText),
            )
          : const CircularProgressIndicator(),
    );
  }
}
