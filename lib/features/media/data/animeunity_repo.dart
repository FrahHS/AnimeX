import 'dart:convert';

import 'package:animex/features/media/domain/anime_series.dart';
import 'package:http/http.dart' as http;
import 'package:html/dom.dart' as dom;

class AnimeunityRepo {
  static String url = "https://www.animeunity.to";
  static late String csrf;
  static late String cookie;

  static Future<void> init() async {
    var response = await http.get(Uri.parse("$url/archivio"));
    dom.Document html = dom.Document.html(response.body);
    csrf = html.querySelector('meta[name=csrf-token]')!.attributes['content']!;
    cookie = response.headers['set-cookie']!.replaceAll(',', ';');
  }

  static Future<List<AnimeSeries>> search(String title) async {
    var client = http.Client();
    try {
      String body = jsonEncode(<String, String>{
          'title': title,
        });

      var response = await client.post(
        Uri.parse("$url/livesearch"),
        headers: <String, String>{
          'Cookie': cookie,
          'Content-Type': 'application/json',
          'Content-Lenght': body.length.toString(),
          'X-Csrf-Token': csrf,
          'Referer': '$url/archivio',
        },
        body: body,
      );

      Map<String, dynamic> results = await jsonDecode(response.body) as Map<String, dynamic>;

      List<AnimeSeries> animeList = [];

      List<dynamic> resultsList = results['records'] as List<dynamic>;

      for(int i = 0; i < resultsList.length; i++) {
        final response = await http.get(Uri.parse(resultsList[i]['imageurl']));

        if (response.statusCode != 200) {
          resultsList[i]['imageurl'] = resultsList[i]['imageurl_cover'];
        }
        animeList.add(
          AnimeSeries(
            title: resultsList[i]['title_eng'],
            description: resultsList[i]['plot'],
            imageCoverUrl: Uri.parse(resultsList[i]['imageurl_cover']),
            coverUrl: Uri.parse(resultsList[i]['imageurl']),
            year: resultsList[i]['date'],
          ),
        );
      }

      return animeList;
    } finally {
      client.close();
    }
  }
}
