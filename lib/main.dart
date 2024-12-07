import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(GetMaterialApp(
    translations: Messages(),
    locale: const Locale('en', 'US'),
    fallbackLocale: const Locale('en', 'US'),
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  final messagesController = Get.put(MessagesController());
  String val = "asdfasdf";

  Future<void> fun() async {
    await Future.delayed(Duration(seconds: 2));
    val = "karthi";
    setState(() {
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Text(val),
          Text('hello'.tr),
          Text('logged_in'.trParams({'name': 'karthi', 'email': 'karthikayansde@gmail.com'})),
          ElevatedButton(
              onPressed: () {
                fun();
                messagesController.changeLanguage('en', 'US');
              },
              child: Text('english')),
          ElevatedButton(
              onPressed: () {
                messagesController.changeLanguage('es', 'ES');
              },
              child: Text('spanish')),
        ],
      ),
    );
  }
}

class Messages extends Translations {
  @override
  // TODO: implement keys
  Map<String, Map<String, String>> get keys {
    Map<String, Map<String, String>> val = {
      'en_US': {'hello': 'hello', 'logged_in': 'logged in as @name \n email: @email'},
      'es_ES': {'hello': 'hola', 'logged_in': 'iniciado sesion como @name \n email: @email'},
    };
    return val;
  }
}

class MessagesController extends GetxController {
  void changeLanguage(String languageCode, String countryCode) {
    var locale = Locale(languageCode, countryCode);
    Get.updateLocale(locale);
  }
}

//chatgpt code

//save it as json file
// {
// "title": "My App",
// "welcome_message": "Welcome to my app!",
// "button_text": "Click me"
// }
// {
// "title": "Mi Aplicación",
// "welcome_message": "¡Bienvenido a mi aplicación!",
// "button_text": "Haz clic"
// }

//
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
//
// import 'screens/home.dart';
//
// void main() {
//   runApp(MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return GetMaterialApp(
//       title: 'My App',
//       translations: {
//         'en_US': {'title': 'en.json', 'welcome_message': 'en.json', 'button_text': 'en.json'},
//         'es_ES': {'title': 'es.json', 'welcome_message': 'es.json', 'button_text': 'es.json'},
//       },
//       locale: Locale('en', 'US'), // Set initial locale
//       fallbackLocale: Locale('en', 'US'), // Set fallback locale
//       home: HomeScreen(),
//     );
//   }
// }
// //
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
//
// class HomeScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     final Map<String, dynamic> translations = Get.find(); // Get the translations
//
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(translations['title']),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Text(translations['welcome_message']),
//             ElevatedButton(
//               onPressed: () {
//                 // Change the locale to Spanish
//                 Get.updateLocale(Locale('es', 'ES'));    //important line
//               },
//               child: Text(translations['button_text']),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
