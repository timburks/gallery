import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import 'package:gallery/layout/adaptive.dart';
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

  List<ArticleData> features;
  List<ArticleData> updates;

  @override
  Widget build(BuildContext context) {
    if (features == null) {
      Future<dynamic>.delayed(const Duration(milliseconds: 1000))
          .then((dynamic onValue) {
        setState(() {
          _loadArticles();
        });
      });
    }
    if (isDisplayDesktop(context)) {
      return ListView(
        children: _buildArticlePreviewItems(context),
      );
    } else {
      return ListView(
        children: [
          HashtagBar(),
          for (final item in _buildArticlePreviewItems(context))
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: item,
            ),
        ],
      );
    }
  }

  void _loadArticles() {
    features = [
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
      )
    ];
    updates = [
      ArticleData(
        imageUrl: 'fortnightly/fortnightly_army.png',
        imageAspectRatio: 1,
        category: GalleryLocalizations.of(context)
            .fortnightlyMenuPolitics
            .toUpperCase(),
        title: GalleryLocalizations.of(context).fortnightlyHeadlineArmy,
        readingTime: 2,
      ),
      ArticleData(
        imageUrl: 'fortnightly/fortnightly_stocks.png',
        imageAspectRatio: 77 / 64,
        category:
            GalleryLocalizations.of(context).fortnightlyMenuWorld.toUpperCase(),
        title: GalleryLocalizations.of(context).fortnightlyHeadlineStocks,
        readingTime: 5,
      ),
      ArticleData(
        imageUrl: 'fortnightly/fortnightly_fabrics.png',
        imageAspectRatio: 76 / 64,
        category:
            GalleryLocalizations.of(context).fortnightlyMenuTech.toUpperCase(),
        title: GalleryLocalizations.of(context).fortnightlyHeadlineFabrics,
        readingTime: 4,
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

    var items = <Widget>[];
    if (features != null && features.isNotEmpty) {
      items.add(VerticalArticlePreview(
        data: features[0],
        headlineTextStyle: textTheme.headline5.copyWith(fontSize: 20),
      ));
      features.sublist(1).forEach((feature) {
        items.add(articleDivider);
        items.add(HorizontalArticlePreview(
          data: feature,
        ));
      });
    }
    if (updates != null) {
      items.add(sectionDivider);
      items.add(Text(
        GalleryLocalizations.of(context).fortnightlyLatestUpdates,
        style: textTheme.headline6,
      ));
      updates.forEach((update) {
        items.add(articleDivider);
        items.add(HorizontalArticlePreview(
          data: update,
          minutes: update.readingTime,
        ));
      });
    }
    return items;
  }
}
