import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';

import '../provider/favorite_provider.dart';

class QuoteTiles extends StatelessWidget {
  String quote;
  String author;

  QuoteTiles({super.key, required this.quote, required this.author});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<FavoriteProvider>(context);
    return Padding(
      padding: const EdgeInsets.only(right: 25.0, left: 25.0, top: 25.0),
      child: Container(
        padding: EdgeInsets.all(15),
        child: Column(
          children: [
            Text(
              quote,
              style: GoogleFonts.lato(
                textStyle: TextStyle(fontSize: 20),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              author,
              style: GoogleFonts.lato(
                textStyle: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () {
                    provider.toggleFavourite(
                      quote,
                      author,
                    );
                  },
                  child: Container(
                      margin: EdgeInsets.only(left: 10),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(width: 1, color: Colors.black),
                      ),
                      padding: EdgeInsets.all(10),
                      child: provider.isExist(quote)
                          ? const Icon(
                              Icons.favorite,
                              color: Colors.red,
                              size: 15,
                            )
                          : const Icon(
                              Icons.favorite_border,
                              color: Colors.black,
                            )),
                ),
                InkWell(
                  onTap: () async {
                    await Share.share(
                      quote,
                    );
                  },
                  child: Container(
                    margin: EdgeInsets.only(left: 10),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(width: 1, color: Colors.black),
                    ),
                    padding: EdgeInsets.all(10),
                    child: Icon(
                      Icons.share,
                      size: 15,
                      color: Colors.black,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
        decoration: BoxDecoration(
          color: Color.fromRGBO(208, 231, 210, 1),
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    );
  }
}
