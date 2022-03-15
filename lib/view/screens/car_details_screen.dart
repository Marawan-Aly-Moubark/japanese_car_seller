import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../data/model/car_model.dart';

class CarDetailsScreen extends StatelessWidget {
  const CarDetailsScreen({Key? key, required this.car, required this.index})
      : super(key: key);
  final Car car;
  final int index;

  Widget buildSliverAppBar() {
    return SliverAppBar(
      iconTheme: const IconThemeData(
        color: Colors.black,
      ),
      systemOverlayStyle: const SystemUiOverlayStyle(
        statusBarColor: Colors.white,
      ),
      expandedHeight: 600,
      pinned: true,
      stretch: true,
      backgroundColor: Colors.white,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        title: Text(
          car.title!,

          style: const TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
          //textAlign: TextAlign.start,
        ),
        background: Hero(
          tag: car.id!,
          child: car.image!,
        ),
      ),
    );
  }

  Widget characterInfo(String title, String value) {
    return RichText(
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      text: TextSpan(
        children: [
          TextSpan(
            text: title,
            style: const TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 18,
              wordSpacing: 2.0,
              letterSpacing: 2.0,
            ),
          ),
          TextSpan(
            text: value,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }

  Widget buildDivider(double endIndent) {
    return Divider(
      color: Colors.black45,
      height: 30,
      endIndent: endIndent,
      thickness: 2,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          buildSliverAppBar(),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Container(
                  margin: const EdgeInsets.fromLTRB(14, 14, 14, 0),
                  padding: const EdgeInsets.all(8),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      characterInfo('Price :    ', car.price!),
                      buildDivider(170),
                      characterInfo('Model Of The Car :    ', car.year!),
                      buildDivider(80),
                      characterInfo('Status :    ', car.statue!),
                      buildDivider(200),
                      characterInfo('Kilometres :    ', car.kilometres!),
                      buildDivider(110),
                      characterInfo('Engine :    ', car.engine!),
                      buildDivider(170),
                      characterInfo('Place :    ', car.place!),
                      buildDivider(170),
                      characterInfo('Description  : ', car.description!),
                      buildDivider(250),
                      const SizedBox(
                        height: 200,
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 500,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
