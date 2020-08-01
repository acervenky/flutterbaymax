import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

void main() {
  runApp(BaymaxApp());
}


class BaymaxApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Baymax',
      home: BaymaxScreen(),
      debugShowCheckedModeBanner: false,
      
    );
  }
}

class BaymaxScreen extends StatefulWidget {
  @override
  _BaymaxScreenState createState() => _BaymaxScreenState();
}

class _BaymaxScreenState extends State<BaymaxScreen> with TickerProviderStateMixin {

  Offset hoverPos = Offset.zero;
AudioPlayer audioPlayer = AudioPlayer();
  String eyesPath = 'https://storage.googleapis.com/s3.codeapprun.io/userassets/acervenky/wCIAFughSXeye.png';

 Widget tex() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        width: 150,
        child: Padding(
          padding: EdgeInsets.only(
            bottom: 100,
            top: 10,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Tap On Me!',
                style: TextStyle(
                  fontFamily: 'Roboto',
                  fontSize: 20,
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

    play() async {
    int result = await audioPlayer.play('https://storage.googleapis.com/s3.codeapprun.io/userassets/acervenky/bmfHSiEurehello.mp3');
    if (result == 1) {
      // success
    }
  } 
    
  void _changeImage(){
  
  play();
    setState(() {
      eyesPath = 'https://storage.googleapis.com/s3.codeapprun.io/userassets/acervenky/uRPrtoVazSeyesm.gif';
    });

    Future.delayed(Duration(milliseconds: 5000), () {
      setState(() {
        eyesPath = 'https://storage.googleapis.com/s3.codeapprun.io/userassets/acervenky/wCIAFughSXeye.png';
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Stack(
        fit: StackFit.expand,
        children: [
          Image.network(
            'https://storage.googleapis.com/s3.codeapprun.io/userassets/acervenky/oMbezmgXsJback.png',
            fit: BoxFit.cover,
          ),
          tex(),
          MouseRegion(
            onHover: (details) {
              setState(() {
                final size = context.size;
                final center = size.center(Offset.zero);
                hoverPos = Offset(
                  (details.position.dx - center.dx) / size.width,
                  (details.position.dy - center.dy) / size.height,
                );
              });
            },
            child: GestureDetector(
              onPanUpdate: (details) {
                setState(() {
                  final size = context.size;
                  final center = size.center(Offset.zero);
                  hoverPos = Offset(
                    (details.localPosition.dx - center.dx) / size.width,
                    (details.localPosition.dy - center.dy) / size.height,
                  );
                });
              },
              child: Transform.scale(
                scale: 1.1,
                child: FittedBox(
                  child: SizedBox(
                    height: 800,
                    width: 800,
                    child: GestureDetector(
                      behavior: HitTestBehavior.opaque,
                      onTap: () => _changeImage(),
                      child: Stack(
                        fit: StackFit.expand,
                        children: [
                          Image.network(
                              'https://storage.googleapis.com/s3.codeapprun.io/userassets/acervenky/mUeDJkeudrbay1.png'),
                          Align(
                            alignment: Alignment(
                              hoverPos.dx * 0.05,
                              (hoverPos.dy-17) * 0.05,
                            ),
                            child: GestureDetector(
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Image.network(eyesPath, width: 130),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}