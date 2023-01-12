import 'package:flutter/material.dart';
import 'package:tasks_app/screens/video_screen.dart';


import '../models/channel_info.dart';

import '../models/videos_list.dart';
import '../services/service.dart';


class YoutubeScreen extends StatefulWidget {
  @override
  YoutubeScreenState createState() => YoutubeScreenState();
}

class YoutubeScreenState extends State<YoutubeScreen> {
  Channel? _channel;
  Video? _video;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _initChannel();
  }

  _initChannel() async {
    Channel channel = await APIService.instance
        .fetchChannel(channelId: 'UCuXm84E6yWF0dIKmwvwc9sQ');
    setState(() {
      _channel = channel;
    });
  }

  @override
  _buildProfileInfo() {
    return Container(
      margin: EdgeInsets.all(20.0),
      padding: EdgeInsets.all(20.0),
      height: 100.0,
      decoration: BoxDecoration(
        color: Colors.black,
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            offset: Offset(0, 1),
            blurRadius: 6.0,
          ),
        ],
      ),
      child: Row(
        children: <Widget>[
          CircleAvatar(
            backgroundColor: Colors.white,
            radius: 40.0,
            backgroundImage: NetworkImage(_channel!.profilePictureUrl),
          ),
          SizedBox(width: 60.0),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  _channel!.title,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                    fontWeight: FontWeight.w600,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(
                  height: 0,
                ),
                Text(
                  '${_channel!.subscriberCount} subscribers',
                  style: TextStyle(
                    color: Colors.grey[400],
                    fontSize: 16.0,
                    fontWeight: FontWeight.w600,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  '${_channel!.videoCount} Videos',
                  style: TextStyle(
                    color: Colors.grey[400],
                    fontSize: 14.0,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  _buildVideo(Video video) {
    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => VideoScreen(id: video.id),
        ),
      ),
      child: Container(
        color: Colors.black,
        child: Column(
          children: [
            Image(
              image: NetworkImage(
                video.thumbnailUrl,
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 5, left: 10),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child:
                Row(
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 20.0,
                      backgroundImage:
                          NetworkImage(_channel!.profilePictureUrl),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                         '',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 17.0,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(right: 170, top: 10),
                          child: Text(
                            _channel!.title,
                            style: TextStyle(
                              color: Colors.grey.shade500,
                              fontSize: 14.0,
                              fontWeight: FontWeight.w600,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                    Container(
                      margin: EdgeInsets.only(bottom: 40, left: 1),
                      child: IconButton(
                        icon: const Icon(Icons.more_vert),
                        tooltip: 'Setting Icon',
                        color: Colors.grey.shade500,
                        onPressed: () {},
                      ),
                    ), //Ic
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 10,
            )
          ],
        ),
      ),

      // child: Container(
      //   margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 5.0),
      //   padding: EdgeInsets.all(10.0),
      //   height: 250,
      //   decoration: BoxDecoration(
      //     color: Colors.black,
      //     boxShadow: [
      //       BoxShadow(
      //         color: Colors.black12,
      //         offset: Offset(0, 1),
      //         blurRadius: 6.0,
      //       ),
      //     ],
      //   ),

      // child: Column(
      //   children: <Widget>[
      //     Image(
      //       image: NetworkImage(video.thumbnailUrl,),
      //     ),
      //     SizedBox(width: 10.0),
      //     Expanded(
      //       child: Text(
      //         video.title,
      //         style: TextStyle(
      //           color: Colors.black,
      //           fontSize: 18.0,
      //         ),
      //       ),
      //     ),
      //   ],
      // ),
      // ),
    );
  }

  _loadMoreVideos() async {
    _isLoading = true;
    List<Video> moreVideos = await APIService.instance
        .fetchVideosFromPlaylist(playlistId: _channel!.uploadPlaylistId);
    List<Video> allVideos = _channel!.videos..addAll(moreVideos);
    setState(() {
      _channel!.videos = allVideos;
    });
    _isLoading = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text("Nasir Ahmad Noori"),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.keyboard_voice_rounded),
            tooltip: 'Comment Icon',
            onPressed: () {},
          ), //IconButton
          IconButton(
            icon: const Icon(Icons.connected_tv_sharp),
            tooltip: 'Setting Icon',
            onPressed: () {},
          ), //I
          IconButton(
            icon: const Icon(Icons.more_vert),
            tooltip: 'Setting Icon',
            onPressed: () {},
          ), //IconButton
        ], //<Widget>[]
        backgroundColor: Colors.black,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          tooltip: 'Menu Icon',
          onPressed: () {},
        ),
      ), //AppBar
      body: _channel != null
          ? NotificationListener<ScrollNotification>(
              onNotification: (ScrollNotification scrollDetails) {
                if (!_isLoading &&
                    _channel!.videos.length !=
                        int.parse(_channel!.videoCount) &&
                    scrollDetails.metrics.pixels ==
                        scrollDetails.metrics.maxScrollExtent) {
                  _loadMoreVideos();
                }
                return false;
              },
              child: ListView.builder(
                itemCount: 1 + _channel!.videos.length,
                itemBuilder: (BuildContext context, int index) {
                  if (index == 0) {
                    return _buildProfileInfo();
                  }
                  Video video = _channel!.videos[index - 1];
                  return _buildVideo(video);
                },
              ),
            )
          : Center(
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(
                  Theme.of(context).primaryColor, // Red
                ),
              ),
            ),
    );
  }
}
