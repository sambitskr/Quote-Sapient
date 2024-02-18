import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quote_of_the_day/utilities/quote_tiles.dart';
import '../provider/favorite_provider.dart';

class FavouritePage extends StatefulWidget {
  const FavouritePage({super.key});

  @override
  State<FavouritePage> createState() => _FavouritePageState();
}

class _FavouritePageState extends State<FavouritePage> {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<FavoriteProvider>(context);
    final quotee = provider.quotes;
    final authorr = provider.authors;
    return Scaffold(
      backgroundColor: Color.fromRGBO(121, 172, 120, 1),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: (quotee.length),
                itemBuilder: (context, index) {
                  final quote = quotee[index];

                  return QuoteTiles(
                    quote: quote.toString(),
                    author: authorr.length >= index
                        ? authorr[index].toString()
                        : "Anonymous",
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
