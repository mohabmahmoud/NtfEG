import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import 'constant.dart';

class Gallery extends StatefulWidget {
  @override
  _GalleryState createState() => _GalleryState();
}

var actorsImage = [
  "https://media.elcinema.com/uploads/_315x420_b23e2e28e6086733f472d465bb4a6ef70aefd45f2369060884836d5aef0e1005.jpg",
  "https://kollelngoom.com/wp-content/uploads/2016/02/1222.jpg",
  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQuQMmdfcbPyaAvzoQrdh4JZaVvmqj--57Cxw&usqp=CAU",
  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRDSbey5HJAUaJjZtAQEojjZVjhe43EeaKlxg&usqp=CAU",
  "https://elmeezan.com/wp-content/uploads/2020/11/%D8%A7%D9%84%D8%B5%D8%AD%D9%81%D9%8A%D8%A9-%D8%A2%D9%85%D8%A7%D9%84-%D8%A8%D9%83%D9%8A%D8%B1.png",
  "https://www.shorouknews.com/uploadedimages/Other/original/84662133456455656.jpg",
  "https://media.elcinema.com/uploads/_315x420_b23e2e28e6086733f472d465bb4a6ef70aefd45f2369060884836d5aef0e1005.jpg",
  "https://kollelngoom.com/wp-content/uploads/2016/02/1222.jpg",
  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQuQMmdfcbPyaAvzoQrdh4JZaVvmqj--57Cxw&usqp=CAU",
  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRDSbey5HJAUaJjZtAQEojjZVjhe43EeaKlxg&usqp=CAU",
  "https://elmeezan.com/wp-content/uploads/2020/11/%D8%A7%D9%84%D8%B5%D8%AD%D9%81%D9%8A%D8%A9-%D8%A2%D9%85%D8%A7%D9%84-%D8%A8%D9%83%D9%8A%D8%B1.png",
  "https://www.shorouknews.com/uploadedimages/Other/original/84662133456455656.jpg",
  "https://media.elcinema.com/uploads/_315x420_b23e2e28e6086733f472d465bb4a6ef70aefd45f2369060884836d5aef0e1005.jpg",
  "https://kollelngoom.com/wp-content/uploads/2016/02/1222.jpg",
  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQuQMmdfcbPyaAvzoQrdh4JZaVvmqj--57Cxw&usqp=CAU",
  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRDSbey5HJAUaJjZtAQEojjZVjhe43EeaKlxg&usqp=CAU",
  "https://elmeezan.com/wp-content/uploads/2020/11/%D8%A7%D9%84%D8%B5%D8%AD%D9%81%D9%8A%D8%A9-%D8%A2%D9%85%D8%A7%D9%84-%D8%A8%D9%83%D9%8A%D8%B1.png",
  "https://www.shorouknews.com/uploadedimages/Other/original/84662133456455656.jpg",
  "https://media.elcinema.com/uploads/_315x420_b23e2e28e6086733f472d465bb4a6ef70aefd45f2369060884836d5aef0e1005.jpg",
  "https://kollelngoom.com/wp-content/uploads/2016/02/1222.jpg",
  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQuQMmdfcbPyaAvzoQrdh4JZaVvmqj--57Cxw&usqp=CAU",
  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRDSbey5HJAUaJjZtAQEojjZVjhe43EeaKlxg&usqp=CAU",
  "https://elmeezan.com/wp-content/uploads/2020/11/%D8%A7%D9%84%D8%B5%D8%AD%D9%81%D9%8A%D8%A9-%D8%A2%D9%85%D8%A7%D9%84-%D8%A8%D9%83%D9%8A%D8%B1.png",
  "https://www.shorouknews.com/uploadedimages/Other/original/84662133456455656.jpg"
];

class _GalleryState extends State<Gallery> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: backGroundDecoration(),
      child: Scaffold(
        appBar: customAppBar("معــرض الصـور", context, false),
        backgroundColor: Colors.transparent,
        body: Directionality(
          textDirection: TextDirection.rtl,
          child: SingleChildScrollView(
            child: Column(children: <Widget>[
              customTxt("2500 صوره", mainColor!),
              GridView.count(
                physics: ScrollPhysics(),
                shrinkWrap: true,
                crossAxisCount: 3,
                children: List.generate(actorsImage.length, (index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(30.0),
                      child: PhotoView(
                        imageProvider: NetworkImage(actorsImage[index]),
                        loadingBuilder: (context, event) => Center(
                          child: Container(
                            width: 20.0,
                            height: 20.0,
                            child: CircularProgressIndicator(

                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                }),
              )
            ]),
          ),
        ),
      ),
    );
  }
}
