import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty_app/components/custom_card_episode.dart';
import 'package:rick_and_morty_app/resources/colors/colors_app.dart';

import '../components/custom_card.dart';
import '../components/custom_card_information.dart';
import '../components/footer.dart';
import '../models/character.dart';
import '../providers/get_favorite_characters_bloc.dart';
import '../providers/state/get_favorite_characters_state.dart';
import '../resources/strings/app_strings.dart';

class CharacterPage extends StatefulWidget {
  final Character character;
  const CharacterPage({Key? key, required this.character}) : super(key: key);

  @override
  State<CharacterPage> createState() => _CharacterPageState();
}

class _CharacterPageState extends State<CharacterPage> {
  double height = 200;
  bool lastStatus = true;

  bool get _isShrink {
    return _scrollController != null &&
        _scrollController!.hasClients &&
        _scrollController!.offset > (height - kToolbarHeight);
  }

  void _scrollListener() {
    if (_isShrink != lastStatus) {
      setState(() {
        lastStatus = _isShrink;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController()..addListener(_scrollListener);
  }

  @override
  void dispose() {
    _scrollController?.removeListener(_scrollListener);
    _scrollController?.dispose();
    super.dispose();
  }

  ScrollController? _scrollController;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    String type =
        widget.character.type == '' ? 'Unknown' : widget.character.type;
    return SafeArea(
      child: BlocProvider(
        create: (context) => GetFavoriteCharactersBloc(),
        child: Scaffold(
          body: NestedScrollView(
            controller: _scrollController,
            headerSliverBuilder: (context, innerBoxIsScrolled) {
              return [
                SliverAppBar(
                  expandedHeight: 400,
                  floating: true,
                  pinned: true,
                  flexibleSpace: FlexibleSpaceBar(
                    background: SizedBox(
                      child: Stack(
                        children: [
                          SizedBox(
                            child: Column(
                              children: [
                                SizedBox(
                                  width: MediaQuery.of(context).size.width,
                                  child: Image.asset(
                                    "assets/images/background_character.png",
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                Expanded(
                                  child: SizedBox(
                                    width: MediaQuery.of(context).size.width,
                                    height: MediaQuery.of(context).size.height *
                                        0.15,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          widget.character.status,
                                          style: theme.textTheme.subtitle1,
                                        ),
                                        Text(widget.character.name,
                                            style: theme.textTheme.subtitle1),
                                        Text(
                                          widget.character.species,
                                          style: theme.textTheme.subtitle1,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Positioned.fill(
                            child: Align(
                              alignment: Alignment.center,
                              child: Container(
                                width: 125,
                                height: 125,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(100),
                                  color: Colors.white,
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(4.0),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(100),
                                    child: Image.network(
                                      widget.character.image,
                                      fit: BoxFit.cover,
                                      height: 120,
                                      width: 120,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    centerTitle: true,
                    title: _isShrink
                        ? Text(
                            widget.character.name,
                            style: const TextStyle(color: Colors.white),
                          )
                        : null,
                  ),
                  leading: IconButton(
                    icon: const Icon(Icons.arrow_back),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
              ];
            },
            body: CustomScrollView(
              scrollBehavior: const ScrollBehavior(),
              slivers: [
                SliverToBoxAdapter(
                  child: SizedBox(
                    child: Column(
                      children: [
                        SizedBox(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 30.0, horizontal: 20.0),
                                child: Text(
                                  AppStrings.information,
                                  style: theme.textTheme.subtitle1!.copyWith(
                                      color: AppColors.info,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 18.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    SizedBox(
                                      width: 180,
                                      child: CustomCardInformation(
                                          info: 'Gender:',
                                          name: widget.character.gender),
                                    ),
                                    SizedBox(
                                      width: 180,
                                      child: CustomCardInformation(
                                          info: 'Origin:',
                                          name: widget.character.origin.name),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 12, horizontal: 18.0),
                                child: SizedBox(
                                  width: 180,
                                  child: CustomCardInformation(
                                      info: 'Type:', name: type),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 30.0, horizontal: 20.0),
                                child: Text(
                                  AppStrings.episodes,
                                  style: theme.textTheme.subtitle1!.copyWith(
                                      color: AppColors.info,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                  left: 16,
                                  right: 16,
                                ),
                                child: GridView.builder(
                                    gridDelegate:
                                        const SliverGridDelegateWithFixedCrossAxisCount(
                                            childAspectRatio: 2,
                                            crossAxisCount: 2,
                                            mainAxisSpacing: 20),
                                    primary: false,
                                    shrinkWrap: true,
                                    itemCount: 4,
                                    itemBuilder: (context, index) {
                                      return const CustomCardEpisode(
                                        name: 'Pilot',
                                        episode: 'S01E01',
                                        airDate: 'DECEMBER 2, 2013',
                                      );
                                    }),
                              )
                            ],
                          ),
                        ),
                        BlocBuilder<GetFavoriteCharactersBloc,
                            GetFavoriteCharactersState>(
                          builder: (context, state) {
                            return SizedBox(
                              child: Column(
                                children: [
                                  Align(
                                      alignment: Alignment.centerLeft,
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 30.0, horizontal: 20.0),
                                        child: Text(
                                          AppStrings.personage,
                                          style: theme.textTheme.subtitle1!
                                              .copyWith(
                                                  color: AppColors.info,
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w500),
                                        ),
                                      )),
                                  Padding(
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
                                        itemCount: 2,
                                        itemBuilder: (context, index) {
                                          return CustomCard(
                                            image:
                                                state.characters![index].image,
                                            status:
                                                state.characters![index].status,
                                            name: state.characters![index].name,
                                            location: state.characters![index]
                                                .location.name,
                                            origin: state
                                                .characters![index].origin.name,
                                          );
                                        }),
                                  )
                                ],
                              ),
                            );
                          },
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 30.0, horizontal: 20.0),
                          child: SizedBox(
                            width: 220,
                            height: 50,
                            child: ElevatedButton(
                              onPressed: () {},
                              child: const Text(
                                AppStrings.share,
                              ),
                            ),
                          ),
                        ),
                        const Footer(),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
