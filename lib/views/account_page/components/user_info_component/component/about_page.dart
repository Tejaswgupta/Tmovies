// import 'package:flutter/material.dart';
// import 'package:movie/actions/adapt.dart';
// import 'package:movie/app.dart';

// class AboutPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       // backgroundColor: Colors.grey,
//       appBar: AppBar(
//         title: Text("About"),
//       ),
//       body: Center(
//         child: Container(
//           // alignment: Alignment.center,
//           child: Card(
//             elevation: 8.0,
//             // color: Colors.grey,
//             child: Column(
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 SizedBox(
//                   width: double.infinity,
//                 ),
//                 ClipRRect(
//                   borderRadius: BorderRadius.circular(50.0),
//                   child: Image(
//                     width: 200.0,
//                     height: 200.0,
//                     image: NetworkImage(
//                         'https://avatars1.githubusercontent.com/u/41832833?s=400&u=f239e0720be62f57244156ced6fd830f1aa7e958&v=4'),
//                   ),
//                 ),
//                 SizedBox(
//                   height: 30.0,
//                 ),
//                 Text(
//                   "Developer and Maintained by",
//                   style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w700),
//                 ),
//                 Text(
//                   "Tejaswa Gupta",
//                   style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.w300),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class AboutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: ContactActionButton(),
      appBar: AppBar(
        title: Text("About"),
      ),
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 50.0,
              backgroundImage: NetworkImage(
                  'https://avatars1.githubusercontent.com/u/41832833?s=400&u=f239e0720be62f57244156ced6fd830f1aa7e958&v=4'),
            ),
            SizedBox(
              width: double.infinity,
            ),
            Text(
              "Tejaswa Gupta",
              style: TextStyle(
                fontFamily: 'Rubik',
                color: Colors.white,
                fontSize: 40.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'Developer and Maintainer',
              style: TextStyle(
                  fontSize: 15.0,
                  fontFamily: 'Sans',
                  color: Colors.white30,
                  letterSpacing: 1.5,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 10.0,
              width: 150,
              child: Divider(
                height: 16.0,
                thickness: 0.5,
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ContactActionButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
        child: Icon(FontAwesomeIcons.addressCard),
        onPressed: () => showModalBottomSheet(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.0)),
            context: context,
            builder: (context) => ContactInfoList()));
  }
}

class ContactInfoList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.black54,
        child: Padding(
          padding: EdgeInsets.only(top: 15.0, right: 10.0, left: 10.0),
          child: Column(
            children: [
              ContactTile(
                icon: FontAwesomeIcons.github,
                title: 'Github',
              ),
              ContactTile(
                icon: FontAwesomeIcons.linkedinIn,
                title: "LinkedIn",
              )
            ],
          ),
        ));
  }
}

class ContactTile extends StatelessWidget {
  IconData icon;
  String title;
  Function onCall;

  ContactTile({this.icon, this.title, this.onCall});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
      elevation: 8.0,
      color: Colors.grey[900],
      child: ListTile(
        leading: Icon(icon),
        title: Text(title),
        onTap: onCall,
      ),
    );
  }
}
