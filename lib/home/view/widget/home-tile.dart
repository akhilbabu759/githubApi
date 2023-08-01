import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeListTile extends StatelessWidget {
  const HomeListTile({
    required this.desc,
    required this.img,
    required this.owner,
    required this.star,
    required this.tex,
    super.key,
  });

  final String img;
  final String tex;
  final String desc;
  final String owner;
  final int star;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width,
      height: Get.height * 0.2,
      decoration: BoxDecoration(boxShadow: [BoxShadow(color: Color.fromARGB(106, 0, 0, 0),blurRadius: 10),BoxShadow(color: Colors.white,blurRadius: 10)],
          color: const Color.fromARGB(255, 243, 243, 243),
          borderRadius: BorderRadius.circular(10)),
      child: Center(
          child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              children: [
                CircleAvatar(
                  backgroundImage: NetworkImage(img),
                  radius: 26,
                ),
                SizedBox(width: 30),
                Container(
                    height: MediaQuery.of(context).size.height * 0.034,
                    width: MediaQuery.of(context).size.width * 0.6,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Color.fromARGB(255, 255, 255, 255)),
                    child: Center(
                        child: Text(
                      'owner: ' + owner,
                      style: TextStyle(
                        fontSize: 17,
                      ),
                    )))
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 18.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    'repo: ' + tex,
                    style: TextStyle(fontSize: 18),
                  ),
                  Text(
                    'desc: ' + desc,
                    style: TextStyle(
                        fontSize: 15,
                        color: Color.fromARGB(255, 162, 162, 162)),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 3,
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Icon(
                  Icons.star,
                  color: Colors.amber,
                ),
                Text(
                  star.toString(),
                  style: TextStyle(
                      color: Color.fromARGB(255, 162, 162, 162), fontSize: 14),
                ),
              ],
            ),
          ],
        ),
      )),
    );
  }
}
