<div align=center>
<a href="https://nostracode.com">
<img src="assets/images/nostra_logo.png">
</a>
</div>

<div align=center>
<p style="font-size: 26px; font-weight: bold;">NC Flutter Google Maps</p>
<p>Flutter project combined with Google Maps API</p>
</div>

---

## 📋 Table of Contents

- [Introduction to Google Maps in Flutter](#section_1)
- [Setting up the project](#section_2)
- [Adding dependencies](#section_3)
- [Adding Google Maps in Flutter app (Android)](#section_4)
- [Adding Google Maps in Flutter app (Web)](#section_5)
- [Running the project on web or android](#section_6)
- [Displaying a map](#section_7)
- [References](#section_8)

## 🏷️ Introduction to Google Maps in Flutter <a name = "section_1"></a>

<div style='text-align: justify;'>
This is a guide on how you can use Google Maps within your Flutter application using this package, `google_maps_flutter` and `google_maps_flutter_web` (for web). This plugin provides access to native Google Maps SDK for iOS and Android. This repository contains a simple implementation of using Google Maps SDK within a Flutter application, show casing how you can use it for displaying maps and adding markers on them.
</div>

## 🏷️ Setting up the project <a name = "section_2"></a>

- Creating a new flutter project then setting up to NC Flutter template style.
- Creating a project in Google Cloud Platform (for practice, the project has been provided by the mentor).

## 🏷️ Adding dependencies <a name = "section_3"></a>

```yaml
dependencies:
  flutter:
    sdk: flutter

  cupertino_icons: ^1.0.2
  states_rebuilder: ^6.3.0
  #* google maps package
  google_maps_flutter: ^2.5.3 # latest version
  #* google maps package for web
  google_maps_flutter_web: ^0.5.4+3 # latest version
```

Run the command below to install the package

> flutter pub get

## 🏷️ Adding Google Maps in Flutter app (Android) <a name = "section_4"></a>

- Open the file AndroidManifest.xml located at `android/app/src/main` and add the following code inside the `<application>` tag

```xml
<meta-data android:name="com.google.android.geo.API_KEY" android:value="YOUR API KEY"/>
```

Note: The API key can be asked from the mentor

- Set the `minSdkVersion` in `android/app/build.gradle` file to at least 21 because some features of Google Map are not available on lower versions.

```gradle
android {
    defaultConfig {
        ...
        ....
        minSdkVersion 22 //! update this line
    }
}
```

## 🏷️ Adding Google Maps in Flutter app (Web) <a name = "section_5"></a>

- Open the file `index.html` located at `/web/index.html` and add following code inside the `<head>`

```html
<script src="https://maps.googleapis.com/maps/api/js?key=YOUR-API-KEY"></script>
```

Note: Use the same api key used for Android

## 🏷️ Running the project on web or android <a name = "section_6"></a>

- Choosing target platform (web or android)
- To run the application you can click `F5`, if that doesn't works click on the green play button present on top right corner of your IDE

## 🏷️ Displaying a map <a name = "section_7"></a>

<div style='text-align: justify;'>
To display the map you can be creative in your own way and if necessary the nc_flutter_google_maps project can be a reference</div>

## 🏷️ References <a name = "section_8"></a>

- [Google Maps for Flutter](https://blog.logrocket.com/google-maps-flutter/)
- [A Comprehensive Guide to Using Google Maps in Flutter](https://medium.com/@samra.sajjad0001/a-comprehensive-guide-to-using-google-maps-in-flutter-3fbc0f7d469e)
- [NC Flutter Google Maps](https://github.com/nc-xtras/nc_flutter_google_maps)
- [Package: google_maps_flutter](https://pub.dev/packages/google_maps_flutter)
- [Package: google_maps_flutter_web](https://pub.dev/packages/google_maps_flutter_web)
