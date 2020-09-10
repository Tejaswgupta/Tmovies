import 'dart:math';

import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:movie/globalbasestate/state.dart';
import 'package:movie/globalbasestate/store.dart';
import 'package:movie/models/base_api_model/account_state.dart';
import 'package:movie/models/credits_model.dart';
import 'package:movie/models/enums/theme_color.dart';
import 'package:movie/models/app_user.dart';
import 'package:movie/models/image_model.dart';
import 'package:movie/models/keyword.dart';
import 'package:movie/models/review.dart';
import 'package:movie/models/tvshow_detail.dart';
import 'package:movie/models/video_list.dart';
import 'package:movie/models/video_model.dart';
import 'package:palette_generator/palette_generator.dart';

class TVDetailPageState
    implements GlobalBaseState, Cloneable<TVDetailPageState> {
  GlobalKey<ScaffoldState> scaffoldkey;
  TVDetailModel tvDetailModel;
  int tvid;
  String name;
  String posterPic;
  CreditsModel creditsModel;
  PaletteGenerator palette;
  ImageModel imagesmodel;
  ReviewModel reviewModel;
  VideoListModel recommendations;
  KeyWordModel keywords;
  VideoModel videomodel;
  String backdropPic;
  Color mainColor;
  Color tabTintColor;
  AccountState accountState;
  AnimationController animationController;

  @override
  TVDetailPageState clone() {
    return TVDetailPageState()
      ..scaffoldkey = scaffoldkey
      ..tvDetailModel = tvDetailModel
      ..palette = palette
      ..mainColor = mainColor
      ..tabTintColor = tabTintColor
      ..creditsModel = creditsModel
      ..tvid = tvid
      ..reviewModel = reviewModel
      ..imagesmodel = imagesmodel
      ..recommendations = recommendations
      ..keywords = keywords
      ..videomodel = videomodel
      ..backdropPic = backdropPic
      ..posterPic = posterPic
      ..name = name
      ..accountState = accountState
      ..animationController = animationController;
  }

  @override
  Color themeColor;

  @override
  Locale locale;

  @override
  AppUser user;
}

TVDetailPageState initState(Map<String, dynamic> args) {
  Random random = new Random(DateTime.now().millisecondsSinceEpoch);
  var state = TVDetailPageState();
  state.scaffoldkey =
      GlobalKey<ScaffoldState>(debugLabel: '_TvShowDetailPagekey');
  state.tvid = args['tvid'];
  if (args['bgpic'] != null) state.backdropPic = args['bgpic'];
  if (args['posterpic'] != null) state.posterPic = args['posterpic'];
  if (args['name'] != null) state.name = args['name'];
  state.tvDetailModel = new TVDetailModel.fromParams();
  state.creditsModel = new CreditsModel.fromParams(
      cast: List<CastData>(), crew: List<CrewData>());
  state.mainColor = ThemeColor.color[random.nextInt(10)];
  state.tabTintColor = ThemeColor.color[random.nextInt(10)];
  /*state.mainColor = Color.fromRGBO(
      random.nextInt(200), random.nextInt(100), random.nextInt(200), 1);
  state.tabTintColor = Color.fromRGBO(
      random.nextInt(200), random.nextInt(100), random.nextInt(200), 1);*/
  state.palette = new PaletteGenerator.fromColors(
      List<PaletteColor>()..add(new PaletteColor(Colors.black87, 0)));
  state.imagesmodel = new ImageModel.fromParams(
      posters: List<ImageData>(), backdrops: List<ImageData>());
  state.reviewModel = new ReviewModel.fromParams(results: List<ReviewResult>());
  state.recommendations =
      new VideoListModel.fromParams(results: List<VideoListResult>());
  state.keywords = new KeyWordModel.fromParams(
      keywords: List<KeyWordData>(), results: List<KeyWordData>());
  state.videomodel = new VideoModel.fromParams(results: List<VideoResult>());
  state.accountState = AccountState.fromParams(
      id: 0,
      uid: GlobalStore.store.getState().user?.firebaseUser?.uid,
      mediaId: state.tvid,
      favorite: false,
      watchlist: false,
      mediaType: 'tv');
  return state;
}
