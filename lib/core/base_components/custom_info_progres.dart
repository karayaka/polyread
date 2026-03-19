import 'dart:async';
import 'package:flutter/material.dart';

class CustomInfoProgress extends StatefulWidget {
  /// Gösterilecek mesajların listesi. Boş bırakılırsa varsayılan mesajlar kullanılır.
  final List<String>? customMessages;

  /// Mesajların değişme süresi. Varsayılan: 5 saniye.
  final Duration interval;

  const CustomInfoProgress({
    super.key,
    this.customMessages,
    this.interval = const Duration(seconds: 10),
  });

  @override
  State<CustomInfoProgress> createState() => _CustomInfoProgressState();
}

class _CustomInfoProgressState extends State<CustomInfoProgress> {
  late Timer _timer;
  int _currentIndex = 0;

  late final List<String> _messages;

  @override
  void initState() {
    super.initState();

    // Eğer kullanıcı dışarıdan liste vermediyse varsayılan mesajları ayarlıyoruz
    _messages =
        widget.customMessages ??
        [
          "Bağlantı kuruluyor...",
          "Veritabanları taranıyor...",
          "İçerik analiz ediliyor...",
          "Bilgiler derleniyor...",
          "Son yapılandırmalar tamamlanıyor...",
        ];

    // Belirlenen süre aralığında sayacı artırıp mesajı değiştiriyoruz
    _timer = Timer.periodic(widget.interval, (timer) {
      if (mounted) {
        setState(() {
          _currentIndex = (_currentIndex + 1) % _messages.length;
        });
      }
    });
  }

  @override
  void dispose() {
    _timer
        .cancel(); // Widget ekrandan kalktığında timer'ı durduruyoruz (Memory leak olmaması için)
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CircularProgressIndicator(),
            const SizedBox(height: 24),
            // Yazıların yavaşça kayarak değişmesini sağlayan animasyon widget'ı
            AnimatedSwitcher(
              duration: const Duration(milliseconds: 500),
              transitionBuilder: (Widget child, Animation<double> animation) {
                return FadeTransition(
                  opacity: animation,
                  child: SlideTransition(
                    position: Tween<Offset>(
                      begin: const Offset(0.0, 0.2), // Hafifçe aşağıdan gelsin
                      end: Offset.zero,
                    ).animate(animation),
                    child: child,
                  ),
                );
              },
              child: Text(
                _messages[_currentIndex],
                // key parametresi AnimatedSwitcher'ın içeriğin değiştiğini anlaması için gereklidir
                key: ValueKey<int>(_currentIndex),
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Colors.grey.shade700,
                  letterSpacing: 0.3,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
