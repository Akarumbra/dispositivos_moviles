import 'package:dispositivos_moviles/User/app_user.dart';
import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:dispositivos_moviles/User/information/user_information.dart';
import 'package:dispositivos_moviles/global_elements/background.dart';

class UserProfile extends StatelessWidget {
  AppUser appUser;
  UserInformation userinformation;

  @override
  Widget build(BuildContext context) {
    appUser = BlocProvider.of<AppUser>(context);

    return StreamBuilder(
      stream: appUser.streamFirebase,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        switch(snapshot.connectionState) {
          case ConnectionState.waiting:
            return ProfileData(snapshot); //Permanent CircularProgressIndicator if called there ;-;
          case ConnectionState.none:
            return CircularProgressIndicator();
          case ConnectionState.active:
            return ProfileData(snapshot);
          case ConnectionState.done:
            return ProfileData(snapshot);
        }
        return ProfileData(snapshot);
      },
    );
  }

  Widget ProfileData(AsyncSnapshot snapshot) {
    if(!snapshot.hasData || snapshot.hasError) {
      print("error with login");
      return Container(
        child: Column(
          children: <Widget>[
            CircularProgressIndicator(),
            Text("Information not available"),
            FloatingActionButton(
              backgroundColor: Colors.orange,
              onPressed: appUser.signOut,
              child: Icon(Icons.exit_to_app),
            ),
          ],
        )
      );
    }else{
      print("Successful login");
      print(snapshot.data);
      userinformation = UserInformation(name: snapshot.data.displayName, profileImage: snapshot.data.photoUrl);
      return Container(
        color: Colors.orange,
          child: Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  //title
                ],
              ),
              UserData(userinformation),
              FloatingActionButton(
                backgroundColor: Colors.orange,
                onPressed: appUser.signOut,
                child: Icon(Icons.exit_to_app),
              ),
              
            ],

          )

      );

    }
}

}

class UserData extends StatelessWidget{
  UserInformation userInformation;

  UserData(this.userInformation);

  @override
  Widget build(BuildContext context) {
    final userImage = Container(
      width: 100.0,
      height: 100.0,
      margin: EdgeInsets.only(
        right:25.0,
        left: 25.0
      ),
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.white,
          width:4.0,
          style:BorderStyle.solid
        ),
        shape: BoxShape.circle,
        image: DecorationImage(
          fit: BoxFit.cover,
          image: NetworkImage(userInformation.profileImage)
        )
      )
    );

    final userName = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children:<Widget>[
        Container(
          margin: EdgeInsets.only(
            bottom: 10.0
          ),
          child: Text(
            userInformation.name,
            style: TextStyle(
              fontSize: 20.0,
              color: Colors.white
            ),
          ),
        )
      ],
    );

    return Container(
      margin: EdgeInsets.symmetric(
          vertical: 20.0,
          horizontal: 0.0
      ),
      child: Row(
        children: <Widget>[
          userImage,
          userName
        ],
      ),
    );
  }

}