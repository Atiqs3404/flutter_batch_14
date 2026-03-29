import 'package:flutter/material.dart';

class CityCard extends StatelessWidget {
  final String img, CityName, rating;

  const CityCard({
    super.key,
    required this.img,
    required this.CityName,
    required this.rating,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      width: 300,
      child: Stack(
        children: [
          Image.network(img, height: 180, width: 300, fit: BoxFit.cover),

          Container(height: 180, color: Colors.black.withOpacity(0.3)),

          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Positioned(
                  top: 100,
                  left: 100,

                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.green,
                    ),

                    child: Text(
                      CityName,

                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),

                Text(
                  "⭐ $rating",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
