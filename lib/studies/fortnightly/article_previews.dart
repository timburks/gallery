import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import 'package:gallery/data/gallery_options.dart';
import 'package:gallery/l10n/gallery_localizations.dart';
import 'package:gallery/layout/image_placeholder.dart';
import 'package:gallery/layout/text_scale.dart';
import 'package:gallery/studies/fortnightly/shared.dart';

class ArticlePreviewItemsWidget extends StatefulWidget {
  ArticlePreviewItemsWidget();
  @override
  _ArticlePreviewItemsWidgetState createState() =>
      _ArticlePreviewItemsWidgetState();
}

class _ArticlePreviewItemsWidgetState extends State<ArticlePreviewItemsWidget> {
  _ArticlePreviewItemsWidgetState();

  List<ArticleData> articles;

  @override
  Widget build(BuildContext context) {
    if (articles == null) {
      // we need to fetch the api from the API

      Future.delayed(Duration(milliseconds: 500)).then((onValue) {
        setState(() {
          _loadArticles();
        });
      });
      return ListView(
        children: _buildArticlePreviewItems(context),
      );
    }

    return ListView(
      children: _buildArticlePreviewItems(context),
    );
  }

  void _loadArticles() {
    articles = [
      ArticleData(
        imageUrl: 'fortnightly/fortnightly_healthcare.jpg',
        imageAspectRatio: 391 / 248,
        category:
            GalleryLocalizations.of(context).fortnightlyMenuWorld.toUpperCase(),
        title: GalleryLocalizations.of(context).fortnightlyHeadlineHealthcare,
      ),
      ArticleData(
        imageUrl: 'fortnightly/fortnightly_war.png',
        imageAspectRatio: 1,
        category: GalleryLocalizations.of(context)
            .fortnightlyMenuPolitics
            .toUpperCase(),
        title: GalleryLocalizations.of(context).fortnightlyHeadlineWar,
      ),
      ArticleData(
        imageUrl: 'fortnightly/fortnightly_gas.png',
        imageAspectRatio: 1,
        category:
            GalleryLocalizations.of(context).fortnightlyMenuTech.toUpperCase(),
        title: GalleryLocalizations.of(context).fortnightlyHeadlineGasoline,
      ),
      ArticleData(
        imageUrl: 'fortnightly/fortnightly_army.png',
        imageAspectRatio: 1,
        category: GalleryLocalizations.of(context)
            .fortnightlyMenuPolitics
            .toUpperCase(),
        title: GalleryLocalizations.of(context).fortnightlyHeadlineArmy,
      ),
      ArticleData(
        imageUrl: 'fortnightly/fortnightly_stocks.png',
        imageAspectRatio: 77 / 64,
        category:
            GalleryLocalizations.of(context).fortnightlyMenuWorld.toUpperCase(),
        title: GalleryLocalizations.of(context).fortnightlyHeadlineStocks,
      ),
      ArticleData(
        imageUrl: 'fortnightly/fortnightly_fabrics.png',
        imageAspectRatio: 76 / 64,
        category:
            GalleryLocalizations.of(context).fortnightlyMenuTech.toUpperCase(),
        title: GalleryLocalizations.of(context).fortnightlyHeadlineFabrics,
      ),
    ];
  }

  List<Widget> _buildArticlePreviewItems(BuildContext context) {
    Widget articleDivider = Container(
      margin: const EdgeInsets.symmetric(vertical: 16),
      color: Colors.black.withOpacity(0.07),
      height: 1,
    );
    Widget sectionDivider = Container(
      margin: const EdgeInsets.symmetric(vertical: 16),
      color: Colors.black.withOpacity(0.2),
      height: 1,
    );
    final textTheme = Theme.of(context).textTheme;

    return <Widget>[
      VerticalArticlePreview(
        data: ArticleData(
          imageUrl: 'fortnightly/fortnightly_healthcare.jpg',
          imageAspectRatio: 391 / 248,
          category: GalleryLocalizations.of(context)
              .fortnightlyMenuWorld
              .toUpperCase(),
          title: GalleryLocalizations.of(context).fortnightlyHeadlineHealthcare,
        ),
        headlineTextStyle: textTheme.headline5.copyWith(fontSize: 20),
      ),
      articleDivider,
      HorizontalArticlePreview(
        data: ArticleData(
          imageUrl: 'fortnightly/fortnightly_war.png',
          imageAspectRatio: 1,
          category: GalleryLocalizations.of(context)
              .fortnightlyMenuPolitics
              .toUpperCase(),
          title: GalleryLocalizations.of(context).fortnightlyHeadlineWar,
        ),
      ),
      articleDivider,
      HorizontalArticlePreview(
        data: ArticleData(
          imageUrl: 'fortnightly/fortnightly_gas.png',
          imageAspectRatio: 1,
          category: GalleryLocalizations.of(context)
              .fortnightlyMenuTech
              .toUpperCase(),
          title: GalleryLocalizations.of(context).fortnightlyHeadlineGasoline,
        ),
      ),
      sectionDivider,
      Text(
        GalleryLocalizations.of(context).fortnightlyLatestUpdates,
        style: textTheme.headline6,
      ),
      articleDivider,
      HorizontalArticlePreview(
        data: ArticleData(
          imageUrl: 'fortnightly/fortnightly_army.png',
          imageAspectRatio: 1,
          category: GalleryLocalizations.of(context)
              .fortnightlyMenuPolitics
              .toUpperCase(),
          title: GalleryLocalizations.of(context).fortnightlyHeadlineArmy,
        ),
        minutes: 2,
      ),
      articleDivider,
      HorizontalArticlePreview(
        data: ArticleData(
          imageUrl: 'fortnightly/fortnightly_stocks.png',
          imageAspectRatio: 77 / 64,
          category: GalleryLocalizations.of(context)
              .fortnightlyMenuWorld
              .toUpperCase(),
          title: GalleryLocalizations.of(context).fortnightlyHeadlineStocks,
        ),
        minutes: 5,
      ),
      articleDivider,
      HorizontalArticlePreview(
        data: ArticleData(
          imageUrl: 'fortnightly/fortnightly_fabrics.png',
          imageAspectRatio: 76 / 64,
          category: GalleryLocalizations.of(context)
              .fortnightlyMenuTech
              .toUpperCase(),
          title: GalleryLocalizations.of(context).fortnightlyHeadlineFabrics,
        ),
        minutes: 4,
      ),
      articleDivider,
    ];
  }
}
