import 'package:flutter/material.dart';

class NearlyPlaceItem extends StatelessWidget {
  NearlyPlaceItem({
    Key? key,
    required this.containerColor,
    required this.iconName,
    required this.iconColor,
    required this.containerName,
    required this.pushedPage,
  }) : super(key: key);

  final Color containerColor;
  final IconData iconName;
  final Color iconColor;
  final String containerName;
  final Widget pushedPage;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (_){
          return pushedPage;
        }));
      },
      child: Container(
        width: 150,
        height: 50,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        child: Container(
          width: 35,
          height: 35,
          decoration: BoxDecoration(
            color: containerColor,
            borderRadius: BorderRadius.all(
              Radius.circular(8),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.only(right: 6.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Container(
                    width: 35,
                    height: 35,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(
                        Radius.circular(8),
                      ),
                    ),
                    child: Center(
                        child: Icon(
                          iconName,
                          color: iconColor,
                        )),
                  ),
                ),
                SizedBox(
                  width: 15,
                ),
                Text(
                  containerName,
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}