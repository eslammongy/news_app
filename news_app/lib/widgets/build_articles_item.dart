import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app/moduls/webview/webview_screen.dart';

Widget buildArticlesItem(article, BuildContext context) => InkWell(
      onTap: () {
        navigateTo(context, WebViewScreen("${article["url"]}"));
      },
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Row(children: [
          Container(
              child: ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Image.network(
              "${article["urlToImage"]}",
              height: 120,
              width: 120,
              fit: BoxFit.cover,
            ),
          )),
          SizedBox(
            width: 10,
          ),
          Expanded(
              child: Container(
            height: 120,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "${article["title"]}",
                      style: Theme.of(context).textTheme.bodyText1,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ),
                Text(
                  "${article["publishedAt"]}",
                  style: Theme.of(context).textTheme.bodyText2,
                ),
              ],
            ),
          ))
        ]),
      ),
    );

Widget buildSourceItem(sourceItem, BuildContext context) => InkWell(
    onTap: () {
      navigateTo(context, WebViewScreen("${sourceItem["url"]}"));
    },
    child: Padding(
      padding: const EdgeInsets.all(15.0),
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.asset(
                  "assets/images/PngItem_1927144.png",
                  height: 120,
                  width: 120,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Center(
              child: Text(
                "${sourceItem["name"]}",
                style: Theme.of(context).textTheme.bodyText1,
                maxLines: 1,
              ),
            ),
          ],
        ),
      ),
    ));
Widget buildeNewsArticle(List listNews, BuildContext context,
        {isSearch = false}) =>
    ConditionalBuilder(
      condition: listNews.length > 0,
      builder: (context) => ListView.separated(
          physics: BouncingScrollPhysics(),
          itemBuilder: (context, index) =>
              buildArticlesItem(listNews[index], context),
          separatorBuilder: (context, index) => Divider(
                thickness: 1,
                indent: 10,
                endIndent: 10,
                color: Colors.blueGrey,
              ),
          itemCount: listNews.length),
      fallback: (context) =>
          isSearch ? Container() : Center(child: CircularProgressIndicator()),
    );

Widget buildeNewsSource(List listNews, BuildContext context) =>
    ConditionalBuilder(
      condition: listNews.length > 0,
      builder: (context) => GridView.builder(
        physics: BouncingScrollPhysics(),
        itemBuilder: (context, index) =>
            buildSourceItem(listNews[index], context),
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200,
            childAspectRatio: 3 / 3,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20),
        itemCount: listNews.length,
      ),
      fallback: (context) => Center(
        child: CircularProgressIndicator(),
      ),
    );

Widget defaultFormField({
  @required TextEditingController controller,
  @required TextInputType type,
  Function onSubmit,
  Function onChange,
  Function onTap,
  bool isPassword = false,
  @required Function validate,
  @required String label,
  @required IconData prefix,
  IconData suffix,
  Function suffixPressed,
  bool isClickable = true,
}) =>
    TextFormField(
      controller: controller,
      keyboardType: type,
      obscureText: isPassword,
      enabled: isClickable,
      onFieldSubmitted: onSubmit,
      onChanged: onChange,
      onTap: onTap,
      validator: validate,
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(
          prefix,
        ),
        suffixIcon: suffix != null
            ? IconButton(
                onPressed: suffixPressed,
                icon: Icon(
                  suffix,
                ),
              )
            : null,
        border: OutlineInputBorder(),
      ),
    );

void navigateTo(context, widget) => Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => widget,
      ),
    );
