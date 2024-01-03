# punk

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

Projekt Leírás: Flutter Söralkalmazás
Áttekintés
Ez a projekt egy Flutter alapú alkalmazás, amely söröket jelenít meg, az ingyenes Punk API segítségével. Az alkalmazás három fő funkciót tartalmaz: sörök listázása, részletes információk megjelenítése kiválasztott sörről, és a kedvencek közé való hozzáadás lehetősége.

Funkciók
Lista Nézet: Az első képernyőn sörök listája jelenik meg, tartalmazva a nevüket, képüket és tagline-jukat. Az alkalmazás támogatja az infinite loading funkciót az API pagination használatával.
Részletes Nézet: Amennyiben a felhasználó kiválaszt egy sört a listáról, egy részletes nézet nyílik meg, több információval a kiválasztott sörökről.
Kedvencek: A felhasználók hozzáadhatják a sört a kedvencekhez, amelyek az alkalmazás újraindításakor is megmaradnak. A teljes sör objektum mentésre kerül.
Műszaki Megvalósítás
Kód Szervezettsége és Struktúra: Az alkalmazás tiszta kóddal, jól szervezett projektstruktúrával rendelkezik.
Dependency Injection: A függőségek kezelése get-it segítségével történik.
Állapotkezelés: Az állapotkezelés flutter_bloc használatával van megvalósítva, biztosítva ezzel az alkalmazás reaktív és karbantartható működését.
Környezetek: Az alkalmazás támogatja a mockolt és a produkciós környezetet is, lehetővé téve az adatok tesztelését valós és szimulált környezetben.
UI: Az UI tervezése során hangsúlyt fektettem az esztétikus megjelenésre, egységes színekre és stílusokra.
Extra Funkciók
Sliverek: A listanézet és a részletes nézet dinamikus megjelenítésére slivereket használtam.
Unit Tesztek: A kulcsfontosságú funkciókhoz unit teszteket írtam, biztosítva az alkalmazás stabilitását.

Ez az alkalmazás egy kisebb projektre készült, de a kódminőség és struktúra olyan, mintha egy nagyobb éles projekt része lenne, biztosítva a skálázhatóságot és karbantarthatóságot.
Thanks to ChatGpt.
