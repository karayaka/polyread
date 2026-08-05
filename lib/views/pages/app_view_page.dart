import 'package:cagnaz_apps/cagnaz_apps.dart';
import 'package:flutter/material.dart';

class AppViewPage extends StatelessWidget {
  const AppViewPage({super.key});

  @override
  Widget build(BuildContext context) {
    return CagnazApps(
      appName: "PolyRead",
      desc:
          "PolyRead; kitap okumayı daha düzenli, keyifli ve verimli hale getirmek için tasarlanmış modern bir e-kitap okuyucu ve dijital kütüphane uygulamasıdır. Tüm kitaplarını tek yerde toplayabilir, kolayca okuyabilir, ilerlemeni takip edebilir ve günlük okuma alışkanlığı oluşturabilirsin. 📚 Gelişmiş Kitap Okuma Deneyimi EPUB ve dijital kitaplarını rahatça görüntüle Akıcı ve modern okuma ekranı ile dikkat dağıtmayan deneyim Kaldığın yerden devam etme özelliği Otomatik okuma ilerleme kaydı 📖 Dijital Kütüphaneni Oluştur Tüm kitaplarını tek yerde organize et Kendi kişisel kitap arşivini oluştur Kitaplarını kolayca kategorize et ve yönet 📈 Okuma Takibi ve Motivasyon Okuma ilerlemeni takip et Günlük okuma alışkanlığı kazan Daha disiplinli bir şekilde hedeflerine ulaş",
    );
  }
}
