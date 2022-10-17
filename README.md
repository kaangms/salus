# salus

run these commands before running the app:

* Get dependencies

  flutter pub get

* generate route

  flutter pub run build_runner build --delete-conflicting-outputs


flutter --version
* Flutter 2.10.4 • channel stable • https://github.com/flutter/flutter.git
* Framework • revision c860cba910 (7 months ago) • 2022-03-25 00:23:12 -0500
* Engine • revision 57d3bac3dd
* Tools • Dart 2.16.2 • DevTools 2.9.2

Pattern
* Atomic Design Paterne yakın yazılmıştır.

Kullanılan Paketler
* app_settings,connectivity_plus => internetsiz ortamda internet açmaya zorlamakta
- Not:LocalStorage kullanılmadığı için offline çalışma eklenmemiştir
* flutter_svg => figma görselleri svg formatında kullanılmıştır
* intl => datetime formatlarında kullanıldı
* dio => mockapi için servis entegrasyonunda kullanıldı
* logger=> dio http paketinde servis isteklerini kontrol için kullanıldı
* flutter_bloc => home_base sayfası cubit ile yazıldı
* provider => theme değişikliklerini dinlemek için kullanıldı.Theme geçişi olmadığı için default theme kullanılmakta
* mobx,flutter_mobx,mobx_codegen => genel state yönetimi için kullanıldı

State Yönetimi
* Mobx
* flutter_bloc
* provider

Uygulama Açıklaması
* Mesajlarda tek tık uyulamayı kullanan kişi tarafından mesaj olarak gönderiliyor. Çift tık ise karşıdan gönderiliyor olarak kabul edildi