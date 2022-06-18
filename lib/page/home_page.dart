import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../providers/get_all_characters_bloc.dart';
import '../providers/state/get_all_characters_state.dart';
import '../resources/colors/colors_app.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MultiBlocProvider(
        providers: [
          BlocProvider<GetAllCharactersBloc>(
            create: (context) => GetAllCharactersBloc(),
          )
        ],
        child: CustomScrollView(
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
                  BlocBuilder<GetAllCharactersBloc, GetAllCharactersState>(
                    builder: (context, state) {
                      if (state is GetAllCharactersLoadState) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      } else if (state is GetAllCharactersSuccessState) {
                        return Padding(
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
                                          state.characters![index].image,
                                        ),
                                        Column(
                                          children: [
                                            Text(state.characters![index].name)
                                          ],
                                        )
                                      ],
                                    ),
                                  ]),
                                );
                              }),
                        );
                      } else {
                        return Text(state.message);
                      }
                    },
                  ),
                  Container(
                    color: Colors.black,
                    width: MediaQuery.of(context).size.width,
                    height: 113,
                    child: const Text('Sqda'),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
