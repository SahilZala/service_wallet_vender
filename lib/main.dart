import 'dart:async';

import 'package:amplify_analytics_pinpoint/amplify_analytics_pinpoint.dart';
import 'package:amplify_api/amplify_api.dart';
import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_datastore/amplify_datastore.dart';
import 'package:amplify_flutter/amplify.dart';
import 'package:amplify_storage_s3/amplify_storage_s3.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:service_wallet_vender/amplifyconfiguration.dart';
import 'package:service_wallet_vender/login_signup.dart';

import 'models/ModelProvider.dart';


Future<void> main()
async {
  WidgetsFlutterBinding.ensureInitialized();


  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown
  ]);
  await  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    // navigation bar color
    statusBarColor: Color.fromRGBO(0, 0, 102, 1), // status bar color
  ));
  await runApp(

      MaterialApp(
          home: SplashScreen()));
}

class SplashScreen extends StatefulWidget
{
  _SplashScreen createState() => _SplashScreen();
}
class _SplashScreen extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();

    _configureAmplify();

  }


  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return Scaffold(
      body: SafeArea(
        child: Container(
          color: Colors.white,
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      alignment: Alignment.center,
                      height: 90,
                      width: 220,
                      decoration: BoxDecoration(
                        image: DecorationImage(image: AssetImage("assets/logo.png"),fit: BoxFit.fill),
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),

                    ),

                  ],
                ),
              ),

              Expanded(
                child: Container(
                  padding: EdgeInsets.all(25),
                  alignment: Alignment.bottomCenter,
                  child: Text(
                    "Parteners edition",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Color.fromRGBO(0, 0, 102, 1),fontSize: 18),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }




void _configureAmplify() async {

    // Add Pinpoint and Cognito Plugins, or any other plugins you want to use
    AmplifyAnalyticsPinpoint analyticsPlugin = AmplifyAnalyticsPinpoint();
    AmplifyAuthCognito authPlugin = AmplifyAuthCognito();
    AmplifyStorageS3 as = AmplifyStorageS3();
    Amplify.addPlugins([authPlugin, analyticsPlugin,as]);

    Amplify.addPlugin(AmplifyAPI());


    // Once Plugins are added, configure Amplify
    // Note: Amplify can only be configured once.

    try {
      await Amplify.configure(amplifyconfig).whenComplete(() async {
        print("configure succesfully");





        Fluttertoast.showToast(
          msg: "Configured succesfully",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Color.fromRGBO(0, 0, 102, 1),
          textColor: Colors.white,
          fontSize: 16.0,
        );


        Timer(Duration(seconds: 3),
                () =>
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder:
                        (context) =>
                        LoginSignup()
                    )
                )
        );

      });

    } on AmplifyAlreadyConfiguredException {
      print("Tried to reconfigure Amplify; this can occur when your app restarts on Android.");
    }
  }



}















// void main() {
//   runApp(MyApp());
// }
//
// class MyApp extends StatelessWidget {
//
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: MyHomePage(title: 'Flutter Demo Home Page'),
//     );
//   }
// }
//
// class MyHomePage extends StatefulWidget {
//   MyHomePage({Key key, this.title}) : super(key: key);
//
//
//   final String title;
//
//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }
//
// class _MyHomePageState extends State<MyHomePage> {
//   int _counter = 0;
//
//   void _incrementCounter() {
//     setState(() {
//       // This call to setState tells the Flutter framework that something has
//       // changed in this State, which causes it to rerun the build method below
//       // so that the display can reflect the updated values. If we changed
//       // _counter without calling setState(), then the build method would not be
//       // called again, and so nothing would appear to happen.
//       _counter++;
//     });
//   }
//
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//
// //    _configureAmplify();
//
//   }
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(widget.title),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             Text(
//               'You have pushed the button this many times:',
//             ),
//             Text(
//               '$_counter',
//               style: Theme.of(context).textTheme.headline4,
//             ),
//           ],
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: _incrementCounter,
//         tooltip: 'Increment',
//         child: Icon(Icons.add),
//       ), // This trailing comma makes auto-formatting nicer for build methods.
//     );
//   }
//
//   // void _configureAmplify() async {
//   //
//   //   // Add Pinpoint and Cognito Plugins, or any other plugins you want to use
//   //   AmplifyAnalyticsPinpoint analyticsPlugin = AmplifyAnalyticsPinpoint();
//   //   AmplifyAuthCognito authPlugin = AmplifyAuthCognito();
//   //   Amplify.addPlugins([authPlugin, analyticsPlugin]);
//   //
//   //   Amplify.addPlugin(AmplifyAPI());
//   //
//   //   // Once Plugins are added, configure Amplify
//   //   // Note: Amplify can only be configured once.
//   //
//   //   try {
//   //     await Amplify.configure(amplifyconfig);
//   //
//   //     String graphQLDocument =
//   //     '''mutation CreateTodo(\$name: String!, \$description: String) {
//   //             createTodo(input: {name: \$name, description: \$description}) {
//   //               id
//   //               name
//   //               description
//   //             }
//   //       }''';
//   //     var variables = {
//   //       "name": "dot dot",
//   //       "description": "todo description",
//   //     };
//   //     var request = GraphQLRequest<String>(document: graphQLDocument, variables: variables);
//   //
//   //     var operation = Amplify.API.mutate(request: request);
//   //     var response = await operation.response;
//   //
//   //     var data = response.data;
//   //
//   //     print('Mutation result: ' + data);
//   //   } on AmplifyAlreadyConfiguredException {
//   //     print("Tried to reconfigure Amplify; this can occur when your app restarts on Android.");
//   //   }
//   // }
//
// }
