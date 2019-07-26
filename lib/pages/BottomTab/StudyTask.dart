import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:video_player/video_player.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class StudyTask extends StatefulWidget {
  StudyTask({Key key}) : super(key: key);
  _StudyTaskState createState() => _StudyTaskState();
}

class _StudyTaskState extends State<StudyTask> {
  var _image;
  var _selectIamge;
  Future getImage() async {
    var image = await ImagePicker.pickImage(source: ImageSource.camera);
    print('image: ${image}');
    setState(() {
      _image = image;
    });
  }

  Future selectImage() async {
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);
    print('image: ${image}');
    setState(() {
      _selectIamge = image;
    });
  }

  @override
  VideoPlayerController _controller;
  void initState() {
    super.initState();
    _controller = VideoPlayerController.network(
        'http://www.sample-videos.com/video123/mp4/720/big_buck_bunny_720p_20mb.mp4')
      ..initialize().then((_) {
        // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
        setState(() {});
      });
  }

  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  Widget build(BuildContext context) {
    print(MediaQuery.of(context).size);
    print(MediaQuery.of(context).size.width);
    print(MediaQuery.of(context).size.height);
    print(MediaQuery.of(context).devicePixelRatio);
    print(window.physicalSize);
    print(window.physicalSize.width);
    print(window.physicalSize.height);
    return ListView(
      padding: EdgeInsets.all(20),
      children: <Widget>[
        FlatButton(
          child: Text('self html 功能'),
          onPressed: () {
            print('self html 功能');
            Navigator.of(context).pushNamed('/selfHtml');
          },
        ),
        FlatButton(
          child: Text('webview 功能'),
          onPressed: () {
            print('webview 功能');
            Navigator.of(context).pushNamed('/web_view');
          },
        ),
        FlatButton(
          child: Text('canvas 功能'),
          onPressed: () {
            Navigator.of(context).pushNamed('/canvas');
          },
        ),
        FlatButton(
          child: Text('自定义事件 功能'),
          onPressed: () {
            Navigator.of(context).pushNamed('/AddEvent');
          },
        ),
        FlatButton(
          child: Text('flutter html 功能'),
          onPressed: () {
            Navigator.of(context).pushNamed('/flutterHtml');
          },
        ),
        FlatButton(
          child: Text('查看设备的宽高'),
          onPressed: () {
            print(MediaQuery.of(context).size.height);
            print(MediaQuery.of(context).size.width);
          },
        ),
        FlatButton(
          child: Text('charts 功能'),
          onPressed: () {
            Navigator.of(context).pushNamed('/charts');
          },
        ),
        FlatButton(
          child: Text('charts_flutter 功能'),
          onPressed: () {
            print('charts_flutter 功能');
            Navigator.of(context).pushNamed('/chartsFlutter');
          },
        ),
        GestureDetector(
          child: Image.asset(
            'images/01.jpeg',
            width: 100,
            height: 100,
          ),
          onTap: () {
            Navigator.of(context).pushNamed('/imageView',
                arguments: {'imgUrl': 'images/01.jpeg'});
          },
        ),
        Text('图片点击放大功能的实现'),
        GestureDetector(
          child: Image.asset(
            'images/02.jpeg',
            width: 100,
            height: 100,
          ),
          onTap: () {
            Navigator.of(context).pushNamed('/imageView',
                arguments: {'imgUrl': 'images/02.jpeg'});
          },
        ),
        GestureDetector(
          child: Image.asset(
            'images/03.jpeg',
            width: 100,
            height: 100,
          ),
          onTap: () {
            Navigator.of(context).pushNamed('/imageView',
                arguments: {'imgUrl': 'images/03.jpeg'});
          },
        ),
        GestureDetector(
          child: Image.asset(
            'images/04.jpeg',
            width: 100,
            height: 100,
          ),
          onTap: () {
            Navigator.of(context).pushNamed('/imageView',
                arguments: {'imgUrl': 'images/04.jpeg'});
          },
        ),
        Divider(
          height: 2,
        ),
        SizedBox(
          height: 20,
        ),
        Center(
          child: _image == null
              ? Text('Pick Image')
              : Image.file(
                  _image,
                  width: 100,
                  height: 100,
                ),
        ),
        FlatButton(
          textColor: Colors.blue,
          onPressed: getImage,
          child: Text('点我拍照'),
        ),
        Divider(
          height: 2,
        ),
        SizedBox(
          height: 20,
        ),
        Center(
          child: _image == null
              ? Text('Select Image')
              : Image.file(
                  _selectIamge,
                  width: 100,
                  height: 100,
                ),
        ),
        FlatButton(
          textColor: Colors.blue,
          onPressed: selectImage,
          child: Text('选择照片'),
        ),
        Text('视频播放'),
        Center(
          child: _controller.value.initialized
              ? AspectRatio(
                  aspectRatio: _controller.value.aspectRatio,
                  child: VideoPlayer(_controller),
                )
              : Container(
                  child: Text('haha'),
                ),
        ),
        FlatButton(
          onPressed: () {
            setState(() {
              _controller.value.isPlaying
                  ? _controller.pause()
                  : _controller.play();
            });
          },
          child: Icon(
            _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
          ),
        ),
        Column(
          children: <Widget>[
            SpinKitFadingCircle(
              itemBuilder: (_, int index) {
                return DecoratedBox(
                  decoration: BoxDecoration(
                    color: index.isEven ? Colors.red : Colors.green,
                  ),
                );
              },
            ),
             Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SpinKitRotatingCircle(color: Colors.red),
                SpinKitRotatingPlain(color: Colors.red),
                SpinKitChasingDots(color: Colors.red),
              ],
            ),
            const SizedBox(height: 48.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SpinKitPumpingHeart(color: Colors.red),
                SpinKitPulse(color: Colors.red),
                SpinKitDoubleBounce(color: Colors.red),
              ],
            ),
            const SizedBox(height: 48.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SpinKitWave(color: Colors.red, type: SpinKitWaveType.start),
                SpinKitWave(color: Colors.red, type: SpinKitWaveType.center),
                SpinKitWave(color: Colors.red, type: SpinKitWaveType.end),
              ],
            ),
            const SizedBox(height: 48.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SpinKitThreeBounce(color: Colors.red),
                SpinKitWanderingCubes(color: Colors.red),
                SpinKitWanderingCubes(
                    color: Colors.red, shape: BoxShape.circle),
              ],
            ),
            const SizedBox(height: 48.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SpinKitCircle(color: Colors.red),
                SpinKitFadingFour(color: Colors.red),
                SpinKitFadingFour(
                    color: Colors.red, shape: BoxShape.rectangle),
              ],
            ),
            const SizedBox(height: 48.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SpinKitFadingCube(color: Colors.red),
                SpinKitCubeGrid(size: 51.0, color: Colors.red),
                SpinKitFoldingCube(color: Colors.red),
              ],
            ),
            const SizedBox(height: 48.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SpinKitRing(color: Colors.red),
                SpinKitDualRing(color: Colors.red),
                SpinKitRipple(color: Colors.red),
              ],
            ),
            const SizedBox(height: 48.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SpinKitFadingGrid(color: Colors.red),
                SpinKitFadingGrid(
                    color: Colors.red, shape: BoxShape.rectangle),
                SpinKitHourGlass(color: Colors.red),
              ],
            ),
            const SizedBox(height: 48.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SpinKitSpinningCircle(color: Colors.red),
                SpinKitSpinningCircle(
                    color: Colors.red, shape: BoxShape.rectangle),
                SpinKitFadingCircle(color: Colors.red),
              ],
            ),
            const SizedBox(height: 48.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SpinKitPouringHourglass(color: Colors.red),
              ],
            ),
          ],
        )
      ],
    );
  }
}
