part of facebook_player;

class FacebookVideoPlayer extends StatefulWidget {
  const FacebookVideoPlayer({
    Key? key,
    required this.urlFb,
  }) : super(key: key);

  final String urlFb;

  @override
  State<FacebookVideoPlayer> createState() => _FacebookVideoPlayerState();
}

class _FacebookVideoPlayerState extends State<FacebookVideoPlayer> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width,
          child: AspectRatio(
            aspectRatio: 16 / 9,
            child: InAppWebView(
              initialOptions: InAppWebViewGroupOptions(
                ios: IOSInAppWebViewOptions(
                  allowsInlineMediaPlayback: true,
                ),
              ),
              initialUrlRequest: URLRequest(
                url: Uri.parse(
                    'https://www.facebook.com/v3.2/plugins/video.php?allowfullscreen=false&href=${widget.urlFb}'),
              ),
              onConsoleMessage: (controller, consoleMessage) {
                log(consoleMessage.message);
              },
            ),
          ),
        ),
      ],
    );
  }
}
