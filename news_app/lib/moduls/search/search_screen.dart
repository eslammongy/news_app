import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/cubit/cubit.dart';
import 'package:news_app/cubit/status.dart';
import 'package:news_app/layouts/homepage.dart';
import 'package:news_app/widgets/build_articles_item.dart';

class SearchScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var searchController = TextEditingController();

    return BlocConsumer<NewsCubit, NewsStatus>(
      listener: (context, state) {},
      builder: (context, state) {
        var listNews = NewsCubit.get(context).searchNews;
        return Scaffold(
          appBar: AppBar(
            title: Text("Search"),
            leading: IconButton(
                onPressed: () {
                  navigateTo(context, HomePage());
                },
                icon: Icon(Icons.arrow_back)),
          ),
          body: Column(children: [
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: defaultFormField(
                controller: searchController,
                type: TextInputType.text,
                onChange: (value) {
                  NewsCubit.get(context).getSearchNews(value);
                },
                validate: (String value) {
                  if (value.isEmpty) {
                    return 'search must not be empty';
                  }
                  return null;
                },
                label: 'Search',
                prefix: Icons.search,
              ),
            ),
            Expanded(
              child: buildeNewsArticle(listNews, context, isSearch: true),
            ),
          ]),
        );
      },
    );
  }
}
