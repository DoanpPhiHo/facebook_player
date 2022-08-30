part of facebook_player;

class TiktokVideoPlayer extends StatefulWidget {
  const TiktokVideoPlayer({
    Key? key,
    required this.url,
  }) : super(key: key);

  final String url;

  @override
  State<TiktokVideoPlayer> createState() => _TiktokVideoPlayerState();
}

class _TiktokVideoPlayerState extends State<TiktokVideoPlayer> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.width * 1.634,
      child: InAppWebView(
        onWebViewCreated: (controller) {
          // controller.evaluateJavascript(source: '''
          //   await window.navigator.getUserMedia(audio: true, video: true);
          // ''');
        },
        initialOptions: InAppWebViewGroupOptions(
          ios: IOSInAppWebViewOptions(
            allowsInlineMediaPlayback: true,
          ),
          crossPlatform: InAppWebViewOptions(
            mediaPlaybackRequiresUserGesture: true,
          ),
        ),
        initialUrlRequest: URLRequest(
          url: Uri.parse(widget.url),
        ),
        onConsoleMessage: (controller, consoleMessage) {
          log(consoleMessage.message);
        },
      ),
    );
  }
}
