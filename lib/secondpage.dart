import 'package:flutter/material.dart';
import 'package:projectofprovaider/PROVAIDER/provaiderlist.dart';
import 'package:provider/provider.dart';
class Secondpage extends StatefulWidget {
  const Secondpage({Key? key}) : super(key: key);

  @override
  State<Secondpage> createState() => _SecondpageState();
}

class _SecondpageState extends State<Secondpage> {
  @override
  Widget build(BuildContext context) {
    final secondobject=Provider.of<Provideroperations>(context);
    final List favouritewords=secondobject.words;

    return
       Scaffold(
        appBar: AppBar(
          toolbarHeight: 60,
          title: Text("Englishwords",style: TextStyle(
            fontSize: 23,
            color: Colors.white,
            backgroundColor: Colors.blueAccent,
          ),),
        ),
        body:ListView.builder(
            shrinkWrap: true,
            itemCount: favouritewords.length,
            itemBuilder: (context,index){
              return
                ListTile(
                  leading:Text(favouritewords[index],),
                  trailing: IconButton(onPressed: (){
                    secondobject.favoriteswords(favouritewords[index]);


                  },
                    icon:secondobject.colorchange(favouritewords[index])?
                    Icon (Icons.favorite,color: Colors.red):
                    Icon(Icons.favorite_border),
                  ),

                );


            }
        ),
        floatingActionButton: FloatingActionButton.extended(onPressed:(){
          Navigator.push(context, MaterialPageRoute(builder: (context)=>Secondpage()));
        },label: Text("Favorites"), ),



      );

  }
}
