import 'package:flutter/material.dart';


class Testing extends StatelessWidget {
  const Testing({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Image Over Container')),
        body: Center(
          child: Stack(
            children: <Widget>[
              // The base container, appearing behind the image
              Container(
                width: 200,
                height: 200,
                color: Colors.blue,
                child: const Center(
                  child: Text(
                    'Base Container',
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ),
              ),
              // The image container, positioned on top
              Positioned(
                top: 10, // Adjust position as needed
                left: 50, // Adjust position as needed
                child: Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    color: Colors.red, // Background color for the image container
                    borderRadius: BorderRadius.circular(10), // Optional: rounded corners
                    image: const DecorationImage(
                      image: NetworkImage('https://assets.surlatable.com/m/15a89c2d9c6c1345/72_dpi_webp-REC-283110_Pizza.jpg'), // Replace with your image URL
                      fit: BoxFit.cover, // Adjust how the image fits
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}