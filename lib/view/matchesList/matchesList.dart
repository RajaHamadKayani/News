import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app_project_1/view/dashboard/dashboard.dart';
import 'package:news_app_project_1/view/englandSri.dart';
import 'package:news_app_project_1/view/pak_ind/pak_ind.dart';
import 'package:news_app_project_1/view/south_africa_new.dart';
import 'package:news_app_project_1/view/video_stream/video_stream.dart';

class MatchesList extends StatefulWidget {
  const MatchesList({super.key});

  @override
  State<MatchesList> createState() => _MatchesListState();
}

class _MatchesListState extends State<MatchesList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Matches List",
          style: TextStyle(color: Colors.black),
        ),
        leading: IconButton(
            onPressed: () {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => Dashboard()));
            },
            icon: Icon(Icons.arrow_back)),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Sports Stream",
              style: GoogleFonts.poppins(color: Colors.black),
            ),
            const SizedBox(
              height: 40,
            ),
            InkWell(
              onTap: () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const VideoStream()));
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Australia",
                    style: GoogleFonts.poppins(color: Colors.black),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  const Text(
                    "Vs",
                    style: TextStyle(color: Colors.red),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Text(
                    "West Indies",
                    style: GoogleFonts.poppins(color: Colors.black),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            InkWell(
              onTap: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => const PakInd()));
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Pakistan",
                    style: GoogleFonts.poppins(color: Colors.black),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  const Text(
                    "Vs",
                    style: TextStyle(color: Colors.red),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Text(
                    "India",
                    style: GoogleFonts.poppins(color: Colors.black),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            InkWell(
              onTap: () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const NewZeaVsSoth()));
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "NewZealand",
                    style: GoogleFonts.poppins(color: Colors.black),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  const Text(
                    "Vs",
                    style: TextStyle(color: Colors.red),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Text(
                    "South Africa",
                    style: GoogleFonts.poppins(color: Colors.black),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            InkWell(
              onTap: () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const EnglandSri()));
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "England",
                    style: GoogleFonts.poppins(color: Colors.black),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  const Text(
                    "Vs",
                    style: TextStyle(color: Colors.red),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Text(
                    "Srilanka",
                    style: GoogleFonts.poppins(color: Colors.black),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 50,
            ),
          ],
        ),
      ),
    );
  }
}
