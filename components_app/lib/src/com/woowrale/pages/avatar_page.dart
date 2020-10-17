import 'package:flutter/material.dart';

class AvatarPage extends StatelessWidget {

  static String pageName = 'avatar';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Avatar Page'),
        actions: <Widget>[
          Container(
            margin: EdgeInsets.all(5.0),
            child: CircleAvatar(
              backgroundImage: NetworkImage(
                  'https://pbs.twimg.com/profile_images/1018943227791982592/URnaMrya_400x400.jpg'),
              radius: 25.0,
            ),
          ),
          Container(
              margin: EdgeInsets.only(right: 10.0),
              child: CircleAvatar(
                child: Text('SL'),
                backgroundColor: Colors.brown,
              ))
        ],
      ),
      body: Center(
        child: FadeInImage(
          image: NetworkImage('https://dam.smashmexico.com.mx/wp-content/uploads/2017/08/12220644/marvel-mensaje-stan-lee-contra-odio-carta-cover.jpg'),
          placeholder: AssetImage('assets/images/jar-loading.gif'),
          fadeInDuration: Duration(milliseconds: 200),
        ),
      ),
    );
  }
}
