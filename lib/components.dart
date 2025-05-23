
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:bordered_text/bordered_text.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:your_tour_guide/constants.dart';
import 'package:your_tour_guide/models/event_model.dart';
import 'package:your_tour_guide/utils/utils.dart';


//------------------------------------------------------------------------------------
class CustomImageWithoutEndImage extends StatefulWidget {
  CustomImageWithoutEndImage({
    Key? key,
    required this.imageUrl,
    required this.itemName,
    required this.itemLocation,
    required this.fontSize,
    required this.imagesLength,
    required this.dataKey,
    @required this.description,
    this.addToFavourite,
  }) : super(key: key);
  final String imageUrl;
  final String? itemName;
  final String? itemLocation;
  final String? description;
  final double fontSize;
  final String imagesLength;
  final Function? addToFavourite;
  final GlobalKey dataKey ;

  @override
  State<CustomImageWithoutEndImage> createState() =>
      _CustomImageWithoutEndImageState();
}

class _CustomImageWithoutEndImageState
    extends State<CustomImageWithoutEndImage> {
  bool isFavourite = false;
  bool isRated = false;
  Color color = Colors.white;
  Color isRatedColor = Colors.black;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Stack(
        children: [
          Image(
            width: double.infinity,
            height: 350,
            fit: BoxFit.cover,
            image: NetworkImage(widget.imageUrl),
          ),
          //Pyramids
          Positioned(
            top: 245,
            left: 20,
            child: BorderedText(
              strokeColor: Colors.black,
              strokeWidth: 2,
              strokeCap: StrokeCap.butt,
              strokeJoin: StrokeJoin.bevel,
              child: Text(
                widget.itemName!,
                maxLines: 2,
                style: TextStyle(
                  fontSize: widget.fontSize,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          //Giza
          Positioned(
            top: 280,
            left: 20,
            child: BorderedText(
              strokeColor: Colors.black,
              strokeWidth: 2,
              strokeCap: StrokeCap.butt,
              strokeJoin: StrokeJoin.bevel,
              child: Text(
                widget.itemLocation!,
                style: TextStyle(
                  fontSize: widget.fontSize,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          //Favourite
          Positioned(
            right: 25,
            top: 10,
            child: IconButton(
              onPressed: () {
                setState(() {
                  isFavourite = !isFavourite;
                  isFavourite == false
                      ? color = Colors.white
                      : color = Colors.red;
                });
              },
              icon: Icon(
                Icons.favorite,
                color: color,
                size: 40,
              ),
            ),
          ),
          //Back
          Positioned(
            left: 10,
            top: 10,
            child: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.arrow_back_ios_new,
                color: Colors.white,
                size: 40,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

//--------------------------------------------------------------------------------
void showSnackBar(BuildContext context, String text) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: Text(text),
  ));
}

void showToast({required String msg}) {
  Fluttertoast.showToast(
      msg: msg,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.SNACKBAR,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.orange[300],
      textColor: Colors.white,
      fontSize: 14.0);
}

//-------------------------------------------------------------
class BuildAllItemNew extends StatelessWidget {
  BuildAllItemNew({
    Key? key,
    required this.allDocs,
    required this.index,
    required this.pushedPage,
  }) : super(key: key);
  final allDocs;
  final int index;
  final Widget pushedPage;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return pushedPage;
        }));
      },
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: kHorizontalPadding),
        child: Container(
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.grey.shade500,
                spreadRadius: 1,
                blurRadius: 3,
                offset: const Offset(0, 1),
              ),
            ],
          ),
          child: Stack(
            children: [
              Image(
                image: NetworkImage(
                  '${allDocs[index]['imageUrl']}',
                ),
                loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress == null) {
                    return child;
                  } else {
                    return Center(
                      child: Container(
                        width: double.infinity,
                        height: 230,
                        child: Center(
                          child: CircularProgressIndicator(
                            color: Colors.orange,
                          ),
                        ),
                      ),
                    );
                  }
                },
                width: double.infinity,
                height: 230,
                fit: BoxFit.cover,
              ),
              Positioned(
                top: 160,
                left: 20,
                child: BorderedText(
                  strokeColor: Colors.black,
                  strokeWidth: 2,
                  strokeCap: StrokeCap.butt,
                  strokeJoin: StrokeJoin.bevel,
                  child: Text(
                    '${allDocs[index]['name']}',
                    maxLines: 2,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ), //Done
              Positioned(
                top: 190,
                left: 20,
                child: BorderedText(
                  strokeColor: Colors.black,
                  strokeWidth: 2,
                  strokeCap: StrokeCap.butt,
                  strokeJoin: StrokeJoin.bevel,
                  child: Text(
                    '${allDocs[index]['cityName']}',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
//---------------------------------------------
class BuildMallItem extends StatelessWidget {
  BuildMallItem({
    Key? key,
    required this.allDocs,
    required this.currentIndex,
    required this.pushedPage,
  }) : super(key: key);
  final List<QueryDocumentSnapshot> allDocs;
  final int currentIndex;

  final Widget pushedPage;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return pushedPage;
        }));
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 6.0),
        child: Container(
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.grey.shade700,
                spreadRadius: 1,
                blurRadius: 4,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Stack(
            children: [
              Image(
                image: NetworkImage('${allDocs[currentIndex]['imageUrl']}'),
                width: double.infinity,
                height: 200,
                fit: BoxFit.cover,
              ),
              Positioned(
                top: 130,
                left: 20,
                child: BorderedText(
                  strokeColor: Colors.black,
                  strokeWidth: 2,
                  strokeCap: StrokeCap.butt,
                  strokeJoin: StrokeJoin.bevel,
                  child: Text(
                    '${allDocs[currentIndex]['name']}',
                    maxLines: 2,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ), //Done
              Positioned(
                top: 160,
                left: 20,
                child: BorderedText(
                  strokeColor: Colors.black,
                  strokeWidth: 2,
                  strokeCap: StrokeCap.butt,
                  strokeJoin: StrokeJoin.bevel,
                  child: Text(
                    '${allDocs[currentIndex]['cityName']}',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
//---------------------------------------------
class BuildAllOptionsNew extends StatelessWidget {
  BuildAllOptionsNew({
    Key? key,
    required this.allDocs,
    required this.index,
    required this.pushedPage,
  }) : super(key: key);
  final allDocs;
  final int index;
  final Widget pushedPage;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return pushedPage;
        }));
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 6.0),
        child: Container(
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.grey.shade700,
                spreadRadius: 1,
                blurRadius: 4,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Stack(
            children: [
              Image(
                image: NetworkImage(
                  '${allDocs[index]['imageUrl']}',
                ),
                loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress == null) {
                    return child;
                  } else {
                    return Center(
                      child: Container(
                        width: double.infinity,
                        height: 220,
                        child: Center(
                          child: CircularProgressIndicator(
                            color: Colors.orange,
                          ),
                        ),
                      ),
                    );
                  }
                },
                width: double.infinity,
                height: 220,
                fit: BoxFit.cover,
              ),
              Positioned(
                top: 140,
                left: 20,
                child: BorderedText(
                  strokeColor: Colors.black,
                  strokeWidth: 2,
                  strokeCap: StrokeCap.butt,
                  strokeJoin: StrokeJoin.bevel,
                  child: Text(
                    '${allDocs[index]['tourName']}',
                    maxLines: 2,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ), //Done
              Positioned(
                top: 170,
                left: 20,
                child: BorderedText(
                  strokeColor: Colors.black,
                  strokeWidth: 2,
                  strokeCap: StrokeCap.butt,
                  strokeJoin: StrokeJoin.bevel,
                  child: Text(
                    '${allDocs[index]['state']}',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
//-------------------------------------------------------
class BuildAllUpcomingEvents extends StatelessWidget {
  BuildAllUpcomingEvents({
    Key? key,
    required this.model,
    required this.pushedPage,
  }) : super(key: key);
  final EventModel model;
  final Widget pushedPage;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return pushedPage;
        }));
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 6.0),
        child: Container(
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.grey.shade700,
                spreadRadius: 1,
                blurRadius: 4,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Stack(
            children: [
              Image(
                image: NetworkImage(
                  model.imageUrl!,
                ),
                loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress == null) {
                    return child;
                  } else {
                    return Center(
                      child: Container(
                        width: double.infinity,
                        height: 220,
                        child: Center(
                          child: CircularProgressIndicator(
                            color: Colors.orange,
                          ),
                        ),
                      ),
                    );
                  }
                },
                width: double.infinity,
                height: 220,
                fit: BoxFit.cover,
              ),
              Positioned(
                top: 140,
                left: isArabic() ? null :15,
                right: isArabic() ? 15 :null,
                child: BorderedText(
                  strokeColor: Colors.black,
                  strokeWidth: 2,
                  strokeCap: StrokeCap.butt,
                  strokeJoin: StrokeJoin.bevel,
                  child: Text(
                    isArabic() ? model.nameArabic!:
                    model.name!,
                    maxLines: 2,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ), //Done
              Positioned(
                top: 170,
                left: isArabic() ? null :15,
                right: isArabic() ? 15 :null,
                child: BorderedText(
                  strokeColor: Colors.black,
                  strokeWidth: 2,
                  strokeCap: StrokeCap.butt,
                  strokeJoin: StrokeJoin.bevel,
                  child: Text(
                    isArabic() ? model.locationArabic!:
                    model.location!,
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
//-------------------------------------------------------
class DetailScreen extends StatelessWidget {
  DetailScreen({
    Key? key,
    required this.data,
    required this.currentIndex,
    required this.ImageIndex,
  }) : super(key: key);

  final List<QueryDocumentSnapshot> data;
  final int currentIndex;
  final int ImageIndex;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios_new_rounded,
            color: Colors.black,
          ),
        ),
      ),
      body: GestureDetector(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Hero(
            tag: 'imageHero',
            child: Image.network(
              data[currentIndex]['images'][ImageIndex],
              fit: BoxFit.cover,
            ),
          ),
        ),
        onTap: () {
          Navigator.pop(context);
        },
      ),
    );
  }
}

class ImageView extends StatelessWidget {
  ImageView({
    required this.data,
    required this.widgetDataAndIndex,
    required this.currentIndex,
    required this.ImageIndex,
    this.dataKey,
  });

  final int ImageIndex;
  final List<QueryDocumentSnapshot<Object?>> data;
  final int currentIndex;
  final QueryDocumentSnapshot<Object?> widgetDataAndIndex;
  final Key? dataKey;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return DetailScreen(
            ImageIndex: ImageIndex,
            data: data,
            currentIndex: currentIndex,
          );
        }));
      },
      child: Container(
        key: dataKey,
        child: widgetDataAndIndex['images'][ImageIndex].toString().isEmpty
            ? Text('')
            : Image.network(
                widgetDataAndIndex['images'][ImageIndex],
                width: 150,
                height: 200,
                fit: BoxFit.cover,
              ),
      ),
    );
  }
}
//-------------------------------------------------------
