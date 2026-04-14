import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:basic_projects/WallpaperApp/full_screen.dart';

    class WallpaperWidget extends StatefulWidget {

      @override
      State<WallpaperWidget> createState() => _WallpaperWidgetState();
    }

    class _WallpaperWidgetState extends State<WallpaperWidget> {
      List image= [];
      int page= 1;

      @override
      void initState(){
        super.initState();
        fetchapi();
      }

      fetchapi() async{
        await http.get(Uri.parse('https://api.pexels.com/v1/curated?per_page=80'),
            headers: {
              'Authorization':
              'API_KEY'
            }).then((value){
              Map result= jsonDecode(value.body);
              setState(() {
                image= result['photos'];
              });
          print(image);
        });
      }

      loadmore() async{
        setState(() {
          page+=1;
        });
        String url=
            'https://api.pexels.com/v1/curated?per_page=80' + page.toString();
        await http.get(Uri.parse(url),
        headers :{
          'Authorization':
          'API_KEY'
        }).then((value){
          Map result= jsonDecode(value.body);
          setState(() {
            image.addAll(result['photos']);
          });
        }
        );
      }

      @override
      Widget build(BuildContext context) {
        return Scaffold(
          body: Column(
            children: [
              Expanded(
                  child: Container(
                    child: GridView.builder(
                      itemCount: image.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          crossAxisSpacing: 2,
                          childAspectRatio: 2/3,
                          mainAxisSpacing: 2,
                        ),
                        itemBuilder: (context, index){
                          return InkWell(
                            onTap: (){
                              Navigator.push(context,
                                  MaterialPageRoute(
                                      builder: (context) => FullScreen(
                                          imageurl: image[index]['src']['large2x'])));
                            },
                            child: Container(
                              color:Colors.white,
                              child: Image.network(
                                image[index]['src']['tiny'],
                                fit: BoxFit.cover,
                              ),
                            ),
                          );
                        }
                    ),
                  )),

              InkWell(
                onTap: (){
                  loadmore();
                },
                child: Container(
                  height: 50,
                  color: Colors.blueAccent,
                  child: Center(
                    child: Text('Load More',
                    style: TextStyle(fontSize: 30, color: Colors.white,),
                    ),
                  ),
                ),
              )
            ],
          ),
        );
      }
    }
