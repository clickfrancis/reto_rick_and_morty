import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty_app/page/characters_genderless.dart';

import '../components/custom_sliveappbar.dart';
import '../providers/get_all_characters_bloc.dart';
import '../providers/get_female_characters_bloc.dart';
import '../providers/get_genderless_characters_bloc.dart';
import '../providers/get_male_characters_bloc.dart';
import '../providers/get_unknown_characters_bloc.dart';
import 'allcharacters.dart';
import 'characters_female.dart';
import 'characters_male.dart';
import 'characters_unknown.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MultiBlocProvider(
        providers: [
          BlocProvider<GetAllCharactersBloc>(
            create: (context) => GetAllCharactersBloc(),
          ),
          BlocProvider<GetUnknownCharactersBloc>(
            create: (context) => GetUnknownCharactersBloc(),
          ),
          BlocProvider<GetMaleCharactersBloc>(
            create: (context) => GetMaleCharactersBloc(),
          ),
          BlocProvider<GetFemaleCharactersBloc>(
            create: (context) => GetFemaleCharactersBloc(),
          ),
          BlocProvider<GetGenderlessCharactersBloc>(
            create: (context) => GetGenderlessCharactersBloc(),
          ),
        ],
        child: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return [const CustomSliverAppBar()];
          },
          body: PageView(
            children: const [
              AllGetCharacters(),
              UnknownCharacters(),
              MaleCharacters(),
              FemaleCharacters(),
              GenderlessCharacters(),
            ],
          ),
        ),
      ),
    );
  }
}
