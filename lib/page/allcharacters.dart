import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../components/custom_card.dart';
import '../components/favorites.dart';
import '../components/footer.dart';
import '../providers/get_all_characters_bloc.dart';
import '../providers/state/get_all_characters_state.dart';

class AllGetCharacters extends StatelessWidget {
  const AllGetCharacters({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Favorites(),
        Expanded(
          child: BlocBuilder<GetAllCharactersBloc, GetAllCharactersState>(
            builder: (context, state) {
              if (state is GetAllCharactersLoadState) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (state is GetAllCharactersSuccessState) {
                return Padding(
                  padding: const EdgeInsets.only(
                    left: 16,
                    right: 16,
                  ),
                  child: GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              childAspectRatio: 2,
                              crossAxisCount: 1,
                              mainAxisSpacing: 20),
                      primary: false,
                      shrinkWrap: true,
                      itemCount: 10,
                      itemBuilder: (context, index) {
                        return CustomCard(
                          image: state.characters![index].image,
                          status:
                              '${state.characters![index].status} - ${state.characters![index].species}',
                          name: state.characters![index].name,
                          location: state.characters![index].location.name,
                          origin: state.characters![index].origin.name,
                        );
                      }),
                );
              } else {
                return Text(state.message);
              }
            },
          ),
        ),
        const Padding(
          padding: EdgeInsets.only(top: 20.0),
          child: Footer(),
        ),
      ],
    );
  }
}
