import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/cubit/cubit.dart';
import 'package:news_app/cubit/status.dart';
import 'package:news_app/widgets/build_articles_item.dart';

class BusinessScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsStatus>(
      listener: (context, state) {},
      builder: (context, state) {
        var listNews = NewsCubit.get(context).businessNews;
        return buildeNewsArticle(listNews, context);
      },
    );
  }
}
