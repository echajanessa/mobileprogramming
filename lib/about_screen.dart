import 'dart:async';

class AboutScreen extends StatefulWidget {
  late Timer _timer;

  @override
  void initState() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState()
    })
  }
}

class _AboutScreenState extends State<AboutScreen> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
