import 'package:flutter/material.dart';
import 'package:rick_and_morty_app/components/custom_card_episode.dart';

import '../components/custom_card.dart';
import '../components/custom_card_information.dart';
import '../components/footer.dart';
import '../resources/strings/app_strings.dart';

class CharacterPage extends StatefulWidget {
  const CharacterPage({Key? key}) : super(key: key);

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
    return SafeArea(
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
                                  height:
                                      MediaQuery.of(context).size.height * 0.15,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        'Alive',
                                        style: theme.textTheme.subtitle1,
                                      ),
                                      Text('Beth',
                                          style: theme.textTheme.subtitle1),
                                      Text(
                                        'Human',
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
                                    "https://picsum.photos/250?image=3",
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
                  title: _isShrink
                      ? const Text(
                          "Profile",
                          style: TextStyle(color: Colors.white),
                        )
                      : null,
                ),
                leading: const Icon(Icons.arrow_back),
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
                            const Text('Información'),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: const [
                                CustomCardInformation(
                                    info: 'Gender:', name: 'MALEE'),
                                CustomCardInformation(
                                    info: 'Origin:', name: ''),
                              ],
                            ),
                            const CustomCardInformation(
                                info: 'Type:', name: ''),
                          ],
                        ),
                      ),
                      SizedBox(
                        child: Column(
                          children: [
                            const Text('Información'),
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
                                      name: 'Name',
                                      episode: '5saq45',
                                      airDate: '555554',
                                    );
                                  }),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        child: Column(
                          children: [
                            const Text('Información'),
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
                                    return const CustomCard(
                                      image: 'state.characters![index].image',
                                      status: 'Status',
                                      name: 'Name',
                                      location: 'Location',
                                      origin: 'Origin',
                                    );
                                  }),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 220,
                        height: 50,
                        child: ElevatedButton(
                          onPressed: () {},
                          child: const Text(
                            AppStrings.share,
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
    );
  }
}
