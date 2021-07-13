import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HomePage extends StatelessWidget {
  final restaurantName = <String>[
    'Jims Pizza',
    'Toms Pasta',
    'Great Food',
    'Amazing Chow',
    'Tofun',
    'Belly Excited',
    'Ultra Chow',
    'Delicious Intent',
    'Food Hug',
  ];

  final webImagesPrefix = !kIsWeb ? 'assets/' : '';

  HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Chowtime"),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  alignment: Alignment.topCenter,
                  image: AssetImage('${webImagesPrefix}food/header.jpg'),
                ),
              ),
              height: 300,
              child: Align(
                child: Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Text(
                    "Time to eat.",
                    style: Theme.of(context).textTheme.headline2!.copyWith(color: Colors.white),
                  ),
                ),
                alignment: Alignment.bottomLeft,
              ),
            ),
            GridView.count(
              crossAxisCount: (MediaQuery.of(context).size.width / 250).floor(),
              shrinkWrap: true,
              mainAxisSpacing: 5,
              crossAxisSpacing: 5,
              physics: NeverScrollableScrollPhysics(),
              padding: EdgeInsets.all(15),
              children: List.generate(
                  9,
                  (index) => Card(
                        elevation: 5,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Expanded(
                              child: InkWell(
                                child: Ink.image(
                                  image: AssetImage('${webImagesPrefix}food/${index + 1}.jpeg'),
                                  fit: BoxFit.cover,
                                ),
                                onTap: () {
                                  showDialog(
                                      context: context,
                                      builder: (context) => AlertDialog(
                                            title: Text("Sorry, it's just a demo"),
                                            content: Text("You can't actually order food from here."),
                                            actions: [
                                              TextButton(
                                                  onPressed: () {
                                                    Navigator.of(context).pop();
                                                  },
                                                  child: Text("AH THAT'S RIGHT"))
                                            ],
                                          ));
                                },
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: List.generate(5, (index) => Icon(Icons.star)),
                            ),
                            Text(
                              restaurantName[index],
                              style: Theme.of(context).textTheme.headline5,
                              textAlign: TextAlign.center,
                            )
                          ],
                        ),
                      )),
            )
          ],
        ),
      ),
    );
  }
}
