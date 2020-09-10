import 'package:fish_redux/fish_redux.dart';
import 'package:movie/models/base_api_model/tvshow_stream_link.dart';

enum BottomPanelAction {
  action,
  commentTap,
  useVideoSource,
  setUseVideoSource,
  streamInBrowser,
  setStreamInBrowser,
  seletedLink,
  setLike,
  likeTvShow,
  setOption,
  reportStreamLink,
  requestStreamLink,
  showStreamlinkFilter,
}

class BottomPanelActionCreator {
  static Action onAction() {
    return const Action(BottomPanelAction.action);
  }

  static Action useVideoSource(bool useVideoSourceApi) {
    return Action(BottomPanelAction.useVideoSource, payload: useVideoSourceApi);
  }

  static Action setUseVideoSource(bool useVideoSource) {
    return Action(BottomPanelAction.setUseVideoSource, payload: useVideoSource);
  }

  static Action streamInBrowser(bool streamInBrowser) {
    return Action(BottomPanelAction.streamInBrowser, payload: streamInBrowser);
  }

  static Action setStreamInBrowser(bool streamInBrowser) {
    return Action(BottomPanelAction.setStreamInBrowser,
        payload: streamInBrowser);
  }

  static Action seletedLink(TvShowStreamLink link) {
    return Action(BottomPanelAction.seletedLink, payload: link);
  }

  static Action setLike(int likeCount, bool userLiked) {
    return Action(BottomPanelAction.setLike, payload: [likeCount, userLiked]);
  }

  static Action likeTvShow() {
    return const Action(BottomPanelAction.likeTvShow);
  }

  static Action commentTap() {
    return const Action(BottomPanelAction.commentTap);
  }

  static Action setOption(bool useVideoSourceApi, bool streamInBrowser) {
    return Action(BottomPanelAction.setOption,
        payload: [useVideoSourceApi, streamInBrowser]);
  }

  static Action reportStreamLink() {
    return const Action(BottomPanelAction.reportStreamLink);
  }

  static Action requestStreamLink() {
    return const Action(BottomPanelAction.requestStreamLink);
  }

  static Action showStreamLinkFilter() {
    return const Action(BottomPanelAction.showStreamlinkFilter);
  }
}
