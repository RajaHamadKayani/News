import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:news_app_project_1/view/matchesList/categories.dart';
import 'package:news_app_project_1/view/splash_view/splash_view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  // await Hive.initFlutter();
  // await Hive.openBox<String>('text_box'); // Open Hive box for storing strings
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'News',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home:  SportsScreen(),
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'package:html/parser.dart' as parser;

// class ChannelInfoScreen extends StatefulWidget {
//   final String channelLink;

//   ChannelInfoScreen({required this.channelLink});

//   @override
//   _ChannelInfoScreenState createState() => _ChannelInfoScreenState();
// }

// class _ChannelInfoScreenState extends State<ChannelInfoScreen> {
//   // late String channelDescription;

//   @override
//   void initState() {
//     super.initState();
//     fetchChannelInfo();
//   }

//   Future<void> fetchChannelInfo() async {
//     try {
//       final response = await http.get(Uri.parse(widget.channelLink));

//       if (response.statusCode == 200) {
//         final document = parser.parse(response.body);

//         // Extract channel description
//         final elements = document.querySelectorAll('meta[property="og:description"]');
//         if (elements.isNotEmpty) {
//           channelDescription = elements.first.attributes['content'] ?? 'Description not found';
//         } else {
//           channelDescription = 'Description not found';
//         }

//         setState(() {});
//       } else {
//         // Handle error
//         print('Failed to load channel info: ${response.statusCode}');
//       }
//     } catch (e) {
//       // Handle exception
//       print('Exception occurred: $e');
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Channel Info'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(
//               'Channel Description:',
//               style: TextStyle(
//                 fontSize: 18.0,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//             SizedBox(height: 8.0),
//             Text(
//               channelDescription ?? 'Loading...',
//               style: TextStyle(fontSize: 16.0),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// void main() {
//   runApp(
//     MaterialApp(
//       home: ChannelInfoScreen(channelLink: 'https://www.youtube.com/@BLFootballTalks'),
//     ),
//   );
// }
