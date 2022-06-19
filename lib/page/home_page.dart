import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../components/custom_sliveappbar.dart';
import '../providers/get_all_characters_bloc.dart';
import '../resources/colors/colors_app.dart';
import 'allcharacters.dart';

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
          )
        ],
        child: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return [const CustomSliverAppBar()];
          },
          body: PageView(
            children: [
              const AllGetCharacters(),
              Container(color: AppColors.aliveCircle),
            ],
          ),
        ),
      ),
    );
  }
}
