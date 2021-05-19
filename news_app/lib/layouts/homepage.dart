import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:news_app/cubit/cubit.dart';
import 'package:news_app/cubit/status.dart';
import 'package:news_app/moduls/search/search_screen.dart';
import 'package:news_app/widgets/build_articles_item.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsStatus>(
        listener: (context, state) {},
        builder: (context, state) {
          var myCubit = NewsCubit.get(context);

          return Scaffold(
              appBar: AppBar(
                title: Text("News App"),
                actions: [
                  IconButton(
                      onPressed: () {
                        navigateTo(context, SearchScreen());
                      },
                      icon: Icon(Icons.search)),
                  IconButton(
                      onPressed: () {
                        NewsCubit.get(context).chengeAppTheme();
                      },
                      icon: Icon(Icons.brightness_4_outlined))
                ],
              ),
              body: myCubit.appScreens[myCubit.indexOfPage],
              bottomNavigationBar: LayoutBuilder(
                builder: (context, constraints) => SafeArea(
                  child: buildBottomBarContainer(myCubit),
                ),
              ));
        });
  }

  Widget buildBottomBarContainer(NewsCubit myCubit) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(25)),
          boxShadow: [
            BoxShadow(
              spreadRadius: -10,
              blurRadius: 60,
              color: Colors.black.withOpacity(0.8),
              offset: Offset(0, 15),
            )
          ]),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: GNav(
          curve: Curves.fastOutSlowIn,
          duration: Duration(milliseconds: 600),
          tabs: myCubit.bottomBarItems,
          selectedIndex: myCubit.indexOfPage,
          onTabChange: (index) {
            myCubit.changeBottomBarItem(index);
          },
        ),
      ),
    );
  }
}
