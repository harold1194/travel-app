import 'package:flutter/material.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/landingpage.jpeg"),
                fit: BoxFit.cover)),
        child: Column(
          children: [
            const SizedBox(height: 150),
            const Center(
              child: Text(
                "EXPLORE \nBEAUTY OF BAY",
                style: TextStyle(
                    fontSize: 65,
                    fontWeight: FontWeight.w900,
                    color: Colors.white),
                textAlign: TextAlign.center,
              ),
            ),
            const Text(
              'Bay, the Garden Capital of Laguna',
              style: TextStyle(
                color: Colors.white,
                fontStyle: FontStyle.italic,
              ),
            ),
            const SizedBox(height: 200),
            SizedBox(
              width: 200,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.deepOrange,
                  textStyle: const TextStyle(fontSize: 20),
                  shadowColor: Colors.grey
                ),
                child: const Text("Explore"),
              ),
            )
          ],
        ),
      ),
    );
  }
}
