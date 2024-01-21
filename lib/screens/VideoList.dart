import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app_youtube/model/VideoModel.dart';
import 'package:flutter_app_youtube/screens/YoutubeScreen.dart';

class VideoList extends StatelessWidget {
  const VideoList({Key? key}) : super(key: key);

  Future<List<VideoModel>> readJsonData() async{
    final jsonD = await rootBundle.loadString('assets/videoList.json');
    final list = json.decode(jsonD) as List<dynamic>;

    return list.map((e) => VideoModel.fromJson(e)).toList();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: const Color(0xff394eff), title: const Text('OpenReplay Playlist', textAlign: TextAlign.center, style: TextStyle(color: Colors.white, ),),),
      body: FutureBuilder(
        future: readJsonData(),
        builder: (context, data) {
          if (data.hasError) {
            return Center(child: Text('${data.error}'));
          }
          else {
            if (data.hasData) {
              var items = data.data as List<VideoModel>;
              return ListView.builder(
                  itemCount: items == null ? 0 : items.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        print(items[index].url.toString());
                        Navigator.push(context, MaterialPageRoute(builder: (builder)=>YouTubeScreen(youtubeUrl: items[index].url.toString())));
                      },
                      child: Card(
                        margin: const EdgeInsets.all(8.0),
                        color: const Color(0xff8692ff),
                        child: Container(
                          padding: const EdgeInsets.all(16.0),
                            child: Row(

                              children: [
                                const Icon(Icons.play_circle_outline_sharp, color: Colors.white, size: 30,),
                                const SizedBox( width: 20,),
                                Flexible(child: Text(items[index].name.toString(), style: const TextStyle(color: Colors.white),)),
                              ],
                            )),
                      ),
                    );
                  }
              );
            }

            else {
              return const Center(child: CircularProgressIndicator(),);
            }
          }
        }
      ),
    );
  }
}
