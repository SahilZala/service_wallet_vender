import 'dart:developer';
import 'dart:io';
import 'package:amplify_api/amplify_api.dart';
import 'package:amplify_flutter/amplify.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:service_wallet_vender/DatabaseConection/create_approvel.dart';
import 'package:service_wallet_vender/for_aprovel/file_upload.dart';
import 'package:service_wallet_vender/last_page.dart';
import 'package:service_wallet_vender/service_app/description_vendor.dart';
import 'TrainCenter.dart';
import 'package:service_wallet_vender/DatabaseConection/fetch_my_service.dart';

class HomeDashbord extends StatefulWidget
{
  Map data;

  HomeDashbord(this.data);

  _HomeDashbord createState() => _HomeDashbord(data);
}

class _HomeDashbord extends State<HomeDashbord>
{
  Map data,approvel_data;

  _HomeDashbord(this.data);

  int _selectedIndex = 1;
  List<Widget> _widgetOptions;

  File _image = null;

  var picker = ImagePicker();
  _imgFromGallery() async{

   try{
     File image = await ImagePicker.pickImage(
         source: ImageSource.gallery, imageQuality: 50
     );
     setState(() {
       _image = image;
     });
   }
   catch(e)
    {
      print(e);
    }
  }

  _imgFromCamera() async {
    File image = await ImagePicker.pickImage(
        source: ImageSource.camera, imageQuality: 50
    );

    setState(() {
      _image = image;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    checkAprovel();

    setState(() {
      fms.getData(this.data['userid'],this.data['mobileno']).then((value){

        service_i_have.clear();
        setState(() {
          for(int i=0;i<value.length;i++)
          {
            service_i_have.add(getListView(value.elementAt(i),i));
          }
        });

      });
    });
    get_data();



  }
  FetchMyService fms = new FetchMyService();


  int count = 0;

  @override
  Widget build(BuildContext context) {


    _widgetOptions = <Widget>[

     getListOfService(),
      getHome(),
      getMapScreen()
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(

        backgroundColor:Color.fromRGBO(0,0,102,1),
        elevation:14.0,

        actions: <Widget>[

          IconButton(icon: Icon(Icons.refresh,color: Colors.white,), onPressed: (){
            checkAprovel();
          }),

          IconButton(
            icon: Icon(Icons.notifications_rounded),
            tooltip: 'Comment Icon',
            onPressed: () {},
          ), //IconButton
          IconButton(
            icon: Icon(Icons.menu),
            tooltip: 'Setting Icon',
            onPressed: ()=>Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context)=>Last_Page(),
              ),
            ),
          ), //IconButton
        ], //<Widget>[]

    ),
      bottomNavigationBar:BottomNavigationBar(
        fixedColor: Color.fromRGBO(0,0,102, 1),
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIndex,
        onTap: (value) {
          // Respond to item press.
          setState(() => _selectedIndex = value);
        },
        items: [
          BottomNavigationBarItem(
            title: Text('NEW',style: TextStyle(fontFamily: 'RobotoSlab', color:Colors.grey[600],),),
            icon: Icon(Icons.mail),
          ),
          BottomNavigationBarItem(
            title: Text('DASHBORD', style: TextStyle(fontFamily: 'RobotoSlab', color:Colors.grey[600],),),
            icon: Icon(Icons.dashboard),
          ),
          BottomNavigationBarItem(
            title: Text( 'KC around you', style: TextStyle(fontFamily: 'RobotoSlab', color:Colors.grey[600],),),
            icon: Icon(Icons.map),
          ),
        ],
      ),


      body: Container(
        margin: new EdgeInsets.all(10),
       height: MediaQuery.of(context).size.height,
       width: MediaQuery.of(context).size.width,

       child: SafeArea(
         child: SingleChildScrollView(
           child: Column(
             children: [
               Center(
                 child: _widgetOptions.elementAt(_selectedIndex),
               ),
             ],
           ),
         ),
       ),
     ),
   );
  }

  Widget getHome()
  {
    return Column(
      children: [
        getFirstBanner(),
        getMenuBanners("Training Center","video about how to start with service",openTrainCenter,),
        getMenuBanners("Onboarding Documents","Pan, Address Proof, Documents for loan",openDocumnetUpload,),
        getMenuBanners("About me","Details about me",openTrainCenter),
        getMenuBanners("Bank Details","Payout will be deposited in your account",openTrainCenter),
        _for_approve == 0 ? getContainerForPrice() : approvel_status != null ? approvel_status['approved'] == "true" ?Column(children: [
          getMenuBanners("Create Services","create services which you can",openCreateService),
          approvelDone(),
        ],) : SizedBox() : SizedBox(),
      ],
    );
  }

  Widget getFirstBanner()
  {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.fromLTRB(15, 30, 15, 30),
      width: MediaQuery.of(context).size.width,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Profile Progress",style: TextStyle(
                fontFamily: 'RobotoSlab',color:Color.fromRGBO(0,0,102,1),fontSize: 30,fontWeight: FontWeight.bold),),
                SizedBox(height: 10,),
                Text("Complete the below steps to",style: TextStyle(color: Color.fromRGBO(0,0,102,1),fontSize: 15),textAlign: TextAlign.start,),
                SizedBox(height: 5,),
                Text("Become a KC Partner",style: TextStyle(color: Color.fromRGBO(0,0,102,1),fontSize: 15),textAlign: TextAlign.start,)
              ],
            ),
          ),

          GestureDetector(
            onTap: (){
              //_showPicker(context);
              },
            child: Container(
              alignment: Alignment.centerRight,
              height: 80,
              width: 80,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Color.fromRGBO(52, 73, 94, 1))
              ),
              child: CircleAvatar(
                radius: 55,
                backgroundColor: Color(0xffFDCF09),
                child: Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(data['profile']),onError: (object,val){
                        return NetworkImage("https://cdn.dnaindia.com/sites/default/files/styles/full/public/2020/06/13/909277-ima-pop.jpg");
                      }
                    ),
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(50)),
                  width: 100,
                  height: 100,

                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget getMenuBanners(String s1,String s2,callFunc)
  {
    return GestureDetector(
      onTap: (){
        callFunc();
      },
      child: Container(
        color: Colors.white,
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            Material(
              elevation: 6,
              borderRadius: BorderRadius.circular(10),
              child: Container(
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  color: Colors.white,
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.all(15),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(s1,style: TextStyle(color: Color.fromRGBO(52, 73, 94, 1),fontSize: 20,fontWeight: FontWeight.bold),),
                            SizedBox(height: 5,),
                            Text(s2,style: TextStyle(color: Color.fromRGBO(52, 73, 94, 1),fontSize: 12),)
                          ],
                        ),
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.all(15),
                      child: Icon(Icons.navigate_next,size: 30,color: Color.fromRGBO(52, 73, 94, 1),),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }


  Widget getContainerForPrice()
  {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          padding: EdgeInsets.all(10),
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(5)),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                  child: Container(
                      child: RaisedButton(
                        padding: EdgeInsets.all(15),
                        elevation: 0,
                        onPressed: (){
                        },
                        child: Text(
                          "Submit for Approval",
                          style: TextStyle(
                              fontFamily: 'RobotoSlab',
                              fontSize: 20,
                              color: Color.fromRGBO(0, 0, 102, 1)
                          ),
                        ),
                        // color: Color.fromRGBO(0, 0, 102, 1),
                  shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(19.0),
                        side: BorderSide(color: Color.fromRGBO(0, 0, 102, 1)),
                    ),
                      )
                  )
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget getMapScreen()
  {
    return Column(
      children: [
        Container(
          color: Colors.white,
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.all(10),

          child: Text("KC Around You",style: TextStyle(color: Color.fromRGBO(52, 73, 94, 1),fontSize: 25,fontWeight: FontWeight.bold),),
        ),


        Container(

          color: Colors.white,
          margin: EdgeInsets.fromLTRB(10, 10, 10, 10),

          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.fromLTRB(15, 15, 15, 15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("New jobs around you",style: TextStyle(color: Colors.grey,fontSize: 20),),

              SizedBox(height: 15,),
              Row(
                children: [
                  Icon(Icons.shopping_bag,size: 20,color: Color.fromRGBO(52, 73, 94, 1)),
                  SizedBox(width: 10,),
                  Text("0 jobs",style: TextStyle(color: Color.fromRGBO(52, 73, 94, 1),fontSize: 18),),
                ],
              ),

              SizedBox(height: 15),

              Row(
                children: [
                  Icon(Icons.money,size: 20,color: Color.fromRGBO(52, 73, 94, 1)),
                  SizedBox(width: 10,),
                  Text("Worth ₹0",style: TextStyle(color: Color.fromRGBO(52, 73, 94, 1),fontSize: 18),),
                ],

              ),

              SizedBox(height: 15),

              Container(
                width: MediaQuery.of(context).size.width,
                color: Color.fromRGBO(52, 73, 94, 1),
                height: 1,
              ),

              SizedBox(height: 5),

              Text("Last updated at 4 pm",style: TextStyle(color: Colors.grey,fontSize: 12),),

              SizedBox(height: 5),

            ],
          ),
        ),
      ],
    );
  }

  int _for_approve = 0;
  Map approvel_status = null;
  void checkAprovel()
  {
    CreateApprovel ca = new CreateApprovel("approvelid", "aid", "uid", "mobileno", "panurl", "adharurl", "adharbackurl", "date", "time", "approved");
    ca.checkMobile(data['mobileno']).then((value){
      if(value != null){
        setState(() {
          approvel_data = value;
          approvel_status = value;
          _for_approve = 1;
        });
      }
      else{
        setState(() {
          _for_approve = 0;
        });
      }

    });
  }

  void _showPicker(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return SafeArea(
            child: Container(
              child: new Wrap(
                children: <Widget>[
                  new ListTile(
                      leading: new Icon(Icons.photo_library),
                      title: new Text('Photo Library'),
                      onTap: () {
                        _imgFromGallery();
                        Navigator.of(context).pop();
                      }),
                  new ListTile(
                    leading: new Icon(Icons.photo_camera),
                    title: new Text('Camera'),
                    onTap: () {
                      _imgFromCamera();
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              ),
            ),
          );
        }
    );
  }
  void openTrainCenter(){
    Navigator.push(context, MaterialPageRoute(builder: (context)=>TrainCenter()));
  }

  void openCreateService(){
    Navigator.push(context, MaterialPageRoute(builder: (context)=>DescriptionVendor(approvel_data['id'],data['id'],data['userid'],data['mobileno'])));
  }

  void openDocumnetUpload(){

    if(_for_approve == 0){
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>ImageUpload(data['id'],data['userid'],data['mobileno'],data)));
    }
    else{
      Fluttertoast.showToast(
        msg: "Applied for approvel",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Color.fromRGBO(0, 0, 102, 1),
        textColor: Colors.white,
        fontSize: 16.0,
      );
    }
  }



  Widget approvelDone()
  {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          padding: EdgeInsets.all(10),
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(5)),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                  child: Container(
                      child: RaisedButton(
                        padding: EdgeInsets.all(15),
                        elevation: 0,
                        child: Text(
                          "Your Request Approved",
                          style: TextStyle(
                              fontFamily: 'RobotoSlab',
                              fontSize: 20,
                              color: Color.fromRGBO(0, 0, 102, 1)
                          ),
                        ),
                        // color: Color.fromRGBO(0, 0, 102, 1),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(19.0),
                          side: BorderSide(color: Color.fromRGBO(0, 0, 102, 1)),
                        ),
                      )
                  )
              ),
            ],
          ),
        ),
      ],
    );
  }



  List<Widget> service_i_have = new List();

  void get_data()
    async {
      const onCreateMessage = '''subscription onCreateService {
      onCreateService {
        servicename
      }
    }''';

      var a = await Amplify.API.subscribe(request: GraphQLRequest(document: onCreateMessage),
          onData: (data){ setState(() {
            fms.getData(this.data['userid'],this.data['mobileno']).then((value){

              service_i_have.clear();
              setState(() {
                for(int i=0;i<value.length;i++)
                {
                  service_i_have.add(getListView(value.elementAt(i),i));
                }
              });

            });
          });
        }, onEstablished: (){print("establish");}, onError: (onError){print(onError);}, onDone: (){});
      print(a.hashCode);
    }


    Widget getListOfService()
    {
      return Column(children: service_i_have,);
    }

    Widget getListView(Map val,int index)
    {
      return Slidable(
        actionPane: SlidableDrawerActionPane(),
        actionExtentRatio: 0.25,
        child: Container(
          color: Colors.white,
          child: ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.indigoAccent,
              child: Text((index+1).toString()),
              foregroundColor: Colors.white,
            ),
            title: Text(val["servicename"]),
            subtitle: Text(val["cartype"]),
          ),
        ),
        actions: <Widget>[
          IconSlideAction(
            caption: 'Deactivate',
            color: Colors.blue,
            icon: Icons.close,
            onTap: () => {}
          ),

        ],
        secondaryActions: <Widget>[
          IconSlideAction(
            caption: 'Edit',
            color: Colors.black45,
            icon: Icons.edit,
            onTap: () => {}
          ),
          IconSlideAction(
            caption: 'Delete',
            color: Colors.red,
            icon: Icons.delete,
            onTap: () => {}
          ),
        ],
      );
    }
}

