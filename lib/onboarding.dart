import 'package:Ajreeha/Firsthome.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:Ajreeha/localization/App_localization.dart';

class OnBoardingPage extends StatefulWidget {
  @override
  _OnBoardingPageState createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  final introKey = GlobalKey<IntroductionScreenState>();

  void _onIntroEnd(context) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (_) => FirstHome()),
    );
  }

  Widget _buildImage(String assetName) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Align(
          child: SvgPicture.asset(
            'assets/images/$assetName.svg',
            width: 250,
            height: 250,
          ),
          alignment: Alignment.bottomCenter),
    );
  }

  @override
  Widget build(BuildContext context) {
    const bodyStyle = TextStyle(fontSize: 19.0);
    const pageDecoration = const PageDecoration(
      titleTextStyle: TextStyle(
          fontSize: 30.0,
          fontWeight: FontWeight.w900,
          color: Color(0Xff042E6F),
          fontFamily: 'Tajawal'),
      bodyTextStyle: bodyStyle,
      descriptionPadding: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 10.0),
      pageColor: Colors.white,
      imagePadding: EdgeInsets.zero,
    );

    return IntroductionScreen(
      key: introKey,
      pages: [
        PageViewModel(
          title: AppLocalizations.of(context).translate('cname'),
          bodyWidget: MyList1(),
          // AppLocalizations.of(context).translate('title'),
          image: _buildImage('boarding'),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: AppLocalizations.of(context).translate('boardingname'),
          bodyWidget: MyList(),
          image: _buildImage('boarding'),
          decoration: pageDecoration,
        ),
      ],
      onDone: () => _onIntroEnd(context),
      showSkipButton: true,
      skipFlex: 0,
      nextFlex: 0,
      skip: MyButton(),
      //Text(AppLocalizations.of(context).translate('boardingname'),style: TextStyle(fontWeight: FontWeight.w600,fontFamily: 'Tajawal',fontSize: 18)),
      next: const Icon(Icons.arrow_forward),
      done: MyButton2(),
      //const Text('Done', style: TextStyle(fontWeight: FontWeight.w600,fontFamily: 'Tajawal',fontSize: 18)),
      dotsDecorator: const DotsDecorator(
        size: Size(10.0, 10.0),
        color: Color(0xFFBDBDBD),
        activeSize: Size(22.0, 10.0),
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(25.0)),
        ),
      ),
    );
  }
}

class MyButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text(
      AppLocalizations.of(context).translate('skip'),
      style: TextStyle(
          fontWeight: FontWeight.w600, fontFamily: 'Tajawal', fontSize: 18),
    );
  }
}

class MyButton2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text(
      AppLocalizations.of(context).translate('done'),
      style: TextStyle(
          fontWeight: FontWeight.w600, fontFamily: 'Tajawal', fontSize: 18),
    );
  }
}

class MyList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    //  var appLanguage = Provider.of<AppLanguage>(context);

    return Padding(
      padding: const EdgeInsets.all(0),
      child: new Column(
        children: <Widget>[
          new ListTile(
            minLeadingWidth: 10,
            minVerticalPadding: 0,
            leading: new MyBullet(),
            title: Opacity(
                opacity: 0.54,
                child: new Text(
                  AppLocalizations.of(context).translate('app_description2'),
                  // textScaleFactor: 0.7,
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      fontFamily: 'Tajawal'),
                )),
          ),
          new ListTile(
            minLeadingWidth: 10,
            leading: new MyBullet(),
            title: Opacity(
                opacity: 0.54,
                child: Text(
                  AppLocalizations.of(context).translate(
                    'app_description3',
                  ),
                  // textScaleFactor: 0.6,
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      fontFamily: 'Tajawal'),
                )),
          ),
          // new ListTile(
          //   minLeadingWidth: 10,

          //   leading: new MyBullet(),
          //   title: Opacity(
          //       opacity: 0.54,
          //       child: new Text(
          //         AppLocalizations.of(context).translate('app_description3'),
          //         textScaleFactor: 1.2,
          //         style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
          //       )),
          // ),
          //   new ListTile(
          //   minLeadingWidth: 10,

          //   leading: new MyBullet(),
          //   title: Opacity(
          //       opacity: 0.54,
          //       child: new Text(
          //         AppLocalizations.of(context).translate('app_description3'),
          //         textScaleFactor: 1.2,
          //         style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
          //       )),
          // ),
        ],
      ),
    );
  }
}

class MyBullet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Container(
      height: 10.0,
      width: 10.0,
      decoration: new BoxDecoration(
        color: Color(0xFFFF741A),
        shape: BoxShape.circle,
      ),
    );
  }
}

class MyList1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    //  var appLanguage = Provider.of<AppLanguage>(context);
    return Padding(
      padding: const EdgeInsets.all(0),
      child: Column(children: <Widget>[
        new ListTile(
          minLeadingWidth: 10,
          minVerticalPadding: 0,
          title: Opacity(
            opacity: 0.54,
            child: new Text(
              AppLocalizations.of(context).translate('title'),
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  fontFamily: 'Tajawal'),
            ),
          ),
        ),
      ]),
    );
  }
}
