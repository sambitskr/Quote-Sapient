import 'dart:convert';
import 'package:clipboard/clipboard.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:quote_of_the_day/provider/favorite_provider.dart';
import 'package:quote_of_the_day/widgets/Quote_widgets.dart';
import 'package:http/http.dart' as http;
import 'package:share_plus/share_plus.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var apiURL = "https://type.fit/api/quotes";

  Future<List<dynamic>> getPost() async {
    final response = await http.get(Uri.parse('$apiURL'));
    return postFromJson(response.body);
  }

  List<dynamic> postFromJson(String str) {
    List<dynamic> jsonData = jsonDecode(str);
    jsonData.shuffle();
    return jsonData;
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<FavoriteProvider>(context);
    return Scaffold(
      body: FutureBuilder<List<dynamic>>(
        future: getPost(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasError) {
              return ErrorWidget('$snapshot.error');
            }
            return PageView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                var model = snapshot.data![index];
                return QuoteWidget(
                  quote: model["text"].toString(),
                  author: model["author"].toString(),
                  bgcolor: Color.fromRGBO(121, 172, 120, 1),
                  onLikeClick: () {
                    provider.toggleFavourite(
                      model["text"].toString(),
                      model["author"].toString(),
                    );
                  },
                  onShareClick: () async {
                    await Share.share(
                      model["text"].toString(),
                    );
                  },
                  onCopyClick: () {
                    FlutterClipboard.copy(model["text"].toString())
                        .then((value) => print('copied'));
                  },
                );
              },
            );
          } else
            return CircularProgressIndicator();
        },
      ),
    );
  }
}
