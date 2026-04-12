import 'package:flutter/material.dart';
import 'dart:io';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:wallpaper_manager_flutter/wallpaper_manager_flutter.dart';
import 'package:wallpaper_manager_flutter/wallpaper_manager_flutter_platform_interface.dart';

class FullScreen extends StatefulWidget {
  final String imageurl;

  const FullScreen({super.key, required this.imageurl});
  @override
  _FullScreenState createState() => _FullScreenState();
}

class _FullScreenState extends State<FullScreen> {
  Future<void> setwallpaper() async {
    int location = WallpaperManagerFlutter.bothScreens;

    var file = await DefaultCacheManager().getSingleFile(widget.imageurl);
    final bool result = await WallpaperManagerFlutter().setWallpaper(
        File(file.path),
      location,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          child: Column(
            children: [
              Expanded(
                child: Container(
                  child: Image.network(widget.imageurl),
                ),
              ),
              InkWell(
                onTap: () {
                  setwallpaper();
                },
                child: Container(
                  height: 60,
                  width: double.infinity,
                  color: Colors.blueAccent,
                  child: Center(
                    child: Text('Set Wallpaper',
                        style: TextStyle(fontSize: 20, color: Colors.white)),
                  ),
                ),
              )
            ],
          )),
    );
  }
}