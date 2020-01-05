import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'utils/data.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Preview App',
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 1.0,
          bottom: PreferredSize(
            child: Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    IconButton(
                      icon: Icon(FontAwesomeIcons.user),
                      onPressed: () {},
                    ),
                    IconButton(
                      icon: Icon(FontAwesomeIcons.bell),
                      onPressed: () {},
                    ),
                  ],
                ),
                TabBar(
                  isScrollable: true,
                  indicatorColor: Colors.orange,
                  unselectedLabelColor: Colors.grey,
                  tabs: <Widget>[
                    Tab(
                      child: Text(
                        'PRINT',
                        style: kActiveTabTextStyle,
                      ),
                    ),
                    Tab(
                      child: Text(
                        'EXPLORE',
                        style: kInActiveTabTextStyle,
                      ),
                    ),
                    Tab(
                      child: Text(
                        'WHAT TO SCAN?',
                        style: kInActiveTabTextStyle,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            preferredSize: Size.fromHeight(40.0),
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(left: 24.0, right: 24.0, top: 24.0),
              child: Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      LargeButton(
                        text: 'Library',
                        icon: FontAwesomeIcons.image,
                        color: Color.fromRGBO(94, 216, 165, 1),
                      ),
                      LargeButton(
                        text: 'Camera',
                        icon: FontAwesomeIcons.camera,
                        color: Color.fromRGBO(80, 181, 253, 1),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 24.0,
                      top: 16.0,
                      bottom: 8.0,
                    ),
                    child: Row(
                      children: <Widget>[
                        Text(
                          'Printed',
                          style: kActiveTabTextStyle,
                        ),
                        SizedBox(
                          width: 20.0,
                        ),
                        Text(
                          'Drafts',
                          style: kInActiveTabTextStyle,
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 24.0),
                      child: StaggeredGridView.countBuilder(
                        crossAxisCount: 4,
                        itemCount: 8,
                        itemBuilder: ((BuildContext context, int index) {
                          return Container(
                            decoration: BoxDecoration(
                              color: Colors.grey[200],
                              borderRadius: BorderRadius.circular(10.0),
                              image: DecorationImage(
                                image: NetworkImage('${imgUrl[index]}'),
                                fit: BoxFit.cover,
                              ),
                            ),
                          );
                        }),
                        staggeredTileBuilder: (int index) =>
                            StaggeredTile.count(2, index.isEven ? 2 : 3),
                        mainAxisSpacing: 16.0,
                        crossAxisSpacing: 12.0,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Icon(FontAwesomeIcons.folderOpen),
            Icon(FontAwesomeIcons.folderOpen),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.orange,
          child: Icon(FontAwesomeIcons.expand),
          onPressed: () {},
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      ),
    );
  }
}

class LargeButton extends StatelessWidget {
  LargeButton({this.text, this.icon, this.color});
  final String text;
  final IconData icon;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(50.0),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(10.0),
        boxShadow: [
          BoxShadow(
            color: color,
            offset: Offset(0.0, 0.0),
            blurRadius: 3.0,
          ),
        ],
      ),
      child: Column(
        children: <Widget>[
          Icon(
            icon,
            color: Colors.white,
          ),
          SizedBox(
            height: 5.0,
          ),
          Text(
            '$text',
            style: TextStyle(
              color: Colors.white,
            ),
          )
        ],
      ),
    );
  }
}
