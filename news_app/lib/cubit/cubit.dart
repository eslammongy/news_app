import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:news_app/cubit/status.dart';
import 'package:news_app/moduls/business/business_screen.dart';
import 'package:news_app/moduls/hospital/hospital_screen.dart';
import 'package:news_app/moduls/science/science_screen.dart';
import 'package:news_app/moduls/settings/setting_screen.dart';
import 'package:news_app/moduls/sourses/sourse_screen.dart';
import 'package:news_app/moduls/sports/sports_screen.dart';
import 'package:news_app/network/local/cach_helper.dart';
import 'package:news_app/network/remote/dio_helper.dart';

class NewsCubit extends Cubit<NewsStatus> {
  NewsCubit() : super(InitialStatus());

  static NewsCubit get(context) => BlocProvider.of(context);

  var indexOfPage = 0;

  bool isDarkTheme = false;
  void chengeAppTheme({bool appTheme}) {
    if (appTheme != null) {
      isDarkTheme = appTheme;
    } else
      isDarkTheme = !isDarkTheme;
    CachHelper.putAppTheme(key: "Dark", value: isDarkTheme)
        .then((value) => emit(StateOfChangeAppTheme()));
  }

  // bottom bar items..
  List<GButton> bottomBarItems = [
    GButton(
      gap: 10,
      icon: Icons.badge,
      iconColor: Colors.black87,
      iconActiveColor: Color(0xffE55800),
      text: "Business",
      textColor: Color(0xffE55800),
      backgroundColor: Colors.deepOrange.withOpacity(0.2),
      iconSize: 24,
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
    ),
    GButton(
      gap: 10,
      icon: Icons.science,
      iconColor: Colors.black,
      iconActiveColor: Color(0xffE55800),
      text: "Science",
      textColor: Color(0xffE55800),
      backgroundColor: Colors.deepOrange.withOpacity(0.2),
      iconSize: 24,
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
    ),
    GButton(
      gap: 10,
      icon: Icons.sports_soccer,
      iconColor: Colors.black,
      iconActiveColor: Color(0xffE55800),
      text: "Sport",
      textColor: Color(0xffE55800),
      backgroundColor: Colors.deepOrange.withOpacity(0.2),
      iconSize: 24,
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
    ),
    GButton(
      gap: 10,
      icon: Icons.local_hospital,
      iconColor: Colors.black,
      iconActiveColor: Color(0xffE55800),
      text: "Health",
      textColor: Color(0xffE55800),
      backgroundColor: Colors.deepOrange.withOpacity(0.2),
      iconSize: 24,
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
    ),
    GButton(
      gap: 10,
      icon: Icons.source,
      iconColor: Colors.black,
      iconActiveColor: Color(0xffE55800),
      text: "Chanles",
      textColor: Color(0xffE55800),
      backgroundColor: Colors.deepOrange.withOpacity(0.2),
      iconSize: 24,
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
    )
  ];

  // method for change Bottom Bar Item..
  void changeBottomBarItem(int index) {
    indexOfPage = index;

    if (indexOfPage == 1) {
      getScienceNews();
    }
    if (indexOfPage == 2) {
      getSportsNews();
    }
    if (indexOfPage == 3) {
      getHealtheNews();
    }
    if (indexOfPage == 4) {
      getSourseNews();
    }
    emit(BottomBarStatus());
  }

  // list 0f app screens..

  List<Widget> appScreens = [
    BusinessScreen(),
    ScienceScreen(),
    SportsScreen(),
    HealthScreen(),
    SourceScreen(),
  ];

  List<dynamic> businessNews = [];
  void getBusinessNews() {
    emit(LoadingBusinessNewsDate());

    DioHelper.getNewsData(
      url: "v2/top-headlines",
      query: {
        'country': 'eg',
        'category': 'business',
        "apiKey": "826f16344a124d39aaa90c5eea733a10",
      },
    ).then((value) {
      //print(value.data);
      businessNews = value.data['articles'];
      // print(businessNews[0]["title"]);
      emit(StateOfSuccessgetBusinessNew());
    }).catchError((onError) {
      print(onError.toString());
      emit(StateOfErrorgetBusinessNew(onError.toString()));
    });
  }

  List<dynamic> sportsNews = [];
  void getSportsNews() {
    emit(LoadingSportsNewsDate());

    DioHelper.getNewsData(
      url: "v2/top-headlines",
      query: {
        'country': 'eg',
        'category': 'sports',
        "apiKey": "826f16344a124d39aaa90c5eea733a10",
      },
    ).then((value) {
      //print(value.data);
      sportsNews = value.data['articles'];
      //print(sportsNews[0]["title"]);
      emit(StateOfSuccessgetSportsNew());
    }).catchError((onError) {
      print(onError.toString());
      emit(StateOfErrorgetSportsNew(onError.toString()));
    });
  }

  List<dynamic> scienceNews = [];
  void getScienceNews() {
    emit(LoadingScienceNewsDate());

    DioHelper.getNewsData(
      url: "v2/top-headlines",
      query: {
        'country': 'eg',
        'category': 'science',
        "apiKey": "826f16344a124d39aaa90c5eea733a10",
      },
    ).then((value) {
      //print(value.data);
      scienceNews = value.data['articles'];
      //print(scienceNews[0]["title"]);
      emit(StateOfSuccessgetScienceNew());
    }).catchError((onError) {
      print(onError.toString());
      emit(StateOfErrorgetScienceNew(onError.toString()));
    });
  }

  List<dynamic> healthNews = [];
  void getHealtheNews() {
    emit(LoadingHealthNewsDate());

    DioHelper.getNewsData(
      url: "v2/top-headlines",
      query: {
        'country': 'eg',
        'category': 'health',
        "apiKey": "826f16344a124d39aaa90c5eea733a10",
      },
    ).then((value) {
      //print(value.data);
      healthNews = value.data['articles'];
      //print(scienceNews[0]["title"]);
      emit(StateOfSuccessgetHealthNew());
    }).catchError((onError) {
      print(onError.toString());
      emit(StateOfErrorgetHealthNew(onError.toString()));
    });
  }

  List<dynamic> searchNews = [];
  void getSearchNews(String value) {
    emit(LoadingSearchNewsDate());

    searchNews = [];
    DioHelper.getNewsData(
      url: "v2/everything",
      query: {
        'q': '$value',
        "apiKey": "826f16344a124d39aaa90c5eea733a10",
      },
    ).then((value) {
      //print(value.data);
      searchNews = value.data['articles'];
      //print(scienceNews[0]["title"]);
      emit(StateOfSuccessgetSearchNew());
    }).catchError((onError) {
      print(onError.toString());
      emit(StateOfErrorgetSearchNew(onError.toString()));
    });
  }

  List<dynamic> sourseNews = [];
  void getSourseNews() {
    emit(LoadingSourseNewsDate());

    DioHelper.getNewsData(
      url: "v2/sources",
      query: {
        "apiKey": "826f16344a124d39aaa90c5eea733a10",
      },
    ).then((value) {
      sourseNews = value.data['sources'];
      // print(sourseNews[0]["id"]);
      emit(StateOfSuccesSourseNew());
    }).catchError((onError) {
      print(onError.toString());
      emit(StateOfErrorSourseNew(onError.toString()));
    });
  }
}
