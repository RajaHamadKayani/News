import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:http/http.dart' as http;
import 'package:html/parser.dart' as parser;

class SportsScreen extends StatelessWidget {
  final List<Sport> sports = [
    Sport(
      name: 'Football',
      platforms: [
        Platform(
            name: 'YouTube', link: 'https://www.youtube.com/@BLFootballTalks'),
        Platform(
            name: 'Facebook', link: 'https://www.facebook.com/BFootballTalks'),
        // Add more platforms as needed
      ],
    ),
    Sport(
      name: 'Basketball',
      platforms: [
        Platform(
            name: 'YouTube', link: 'https://www.youtube.com/BasketballChannel'),
        Platform(
            name: 'Facebook', link: 'https://www.facebook.com/BasketballPage'),
        // Add more platforms as needed
      ],
    ),
    // Add more sports as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sports Streaming App'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Header
          Container(
            padding: EdgeInsets.all(16.0),
            child: Text(
              'Choose a Sport',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          // Sport Selection
          Expanded(
            child: ListView(
              children: sports.map((sport) {
                return SportTile(sport: sport);
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}

class SportTile extends StatelessWidget {
  final Sport sport;

  SportTile({required this.sport});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(sport.name),
      onTap: () {
        // Navigate to platform selection page with the selected sport
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => PlatformSelectionScreen(
              sport: sport,
            ),
          ),
        );
      },
    );
  }
}

class PlatformSelectionScreen extends StatelessWidget {
  final Sport sport;

  PlatformSelectionScreen({required this.sport});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Choose Platform'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Choose a platform for ${sport.name}',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            // Platform Selection
            Expanded(
              child: ListView(
                children: sport.platforms.map((platform) {
                  return PlatformButton(
                    platform: platform,
                    sport: sport,
                  );
                }).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PlatformButton extends StatelessWidget {
  final Platform platform;
  final Sport sport;

  PlatformButton({required this.platform, required this.sport});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        // Navigate to live stream page with the selected sport and platform
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ChannelInfoScreen(
              sport: sport,
              platform: platform,
            ),
          ),
        );
      },
      child: Text(platform.name),
    );
  }
}

class ChannelInfoScreen extends StatefulWidget {
  final Sport sport;
  final Platform platform;

  ChannelInfoScreen({required this.sport, required this.platform});

  @override
  _ChannelInfoScreenState createState() => _ChannelInfoScreenState();
}

class _ChannelInfoScreenState extends State<ChannelInfoScreen> {
   String channelDescription = '';

  @override
  void initState() {
    super.initState();
    fetchChannelInfo();
  }

  Future<void> fetchChannelInfo() async {
    try {
      final response = await http.get(Uri.parse(widget.platform.link));

      if (response.statusCode == 200) {
        final document = parser.parse(response.body);

        // Extract channel description
        final elements =
            document.querySelectorAll('meta[property="og:description"]');
        if (elements.isNotEmpty) {
          channelDescription =
              elements.first.attributes['content'] ?? 'Description not found';
        } else {
          channelDescription = 'Description not found';
        }

        setState(() {});
      } else {
        // Handle error
        print('Failed to load channel info: ${response.statusCode}');
      }
    } catch (e) {
      // Handle exception
      print('Exception occurred: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Channel Info'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Channel Description:',
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8.0),
            Text(
              channelDescription.isEmpty ? 'Loading...' :channelDescription,
              style: TextStyle(fontSize: 16.0),
            ),
            ElevatedButton(
              onPressed: () {
                _launchChannel(widget.platform.link);
              },
              child: Text('Visit channel to watch live stream'),
            ),
          ],
        ),
      ),
    );
  }

  // Function to launch channel link
  void _launchChannel(String channelLink) async {
    if (await canLaunch(channelLink)) {
      await launch(channelLink);
    } else {
      throw 'Could not launch $channelLink';
    }
  }
}

class Sport {
  final String name;
  final List<Platform> platforms;

  Sport({required this.name, this.platforms = const []});
}

class Platform {
  final String name;
  final String link;

  Platform({required this.name, required this.link});
}
