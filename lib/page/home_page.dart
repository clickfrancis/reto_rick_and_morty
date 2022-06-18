import 'package:flutter/material.dart';

import '../resources/colors/colors_app.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 280,
            floating: true,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.asset("assets/images/appbarmobile.png",
                  fit: BoxFit.cover),
            ),
            title: const Text(
              'Teext',
              style: TextStyle(color: Colors.white),
            ),
          ),
          SliverToBoxAdapter(
            child: Column(
              children: [
                Row(
                  children: const [Text('MOSTRAR FAVORITOS:')],
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              childAspectRatio: 2, crossAxisCount: 1),
                      primary: false,
                      shrinkWrap: true,
                      itemCount: 10,
                      itemBuilder: (context, index) {
                        return Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              side: const BorderSide(
                                  color: AppColors.borderCard)),
                          elevation: 0,
                          semanticContainer: true,
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          child: Stack(children: [
                            Row(
                              children: [
                                Image.network(
                                  'https://picsum.photos/250?image=9',
                                ),
                                Column(
                                  children: const [Text('Alive')],
                                )
                              ],
                            ),
                          ]),
                        );
                      }),
                ),
                Container(
                  color: Colors.black,
                  width: MediaQuery.of(context).size.width,
                  height: 113,
                  child: const Text('Sqd'),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
