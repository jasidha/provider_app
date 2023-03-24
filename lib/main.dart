import 'package:flutter/material.dart';
import 'package:projectofprovaider/PROVAIDER/provaiderlist.dart';
import 'package:projectofprovaider/secondpage.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
  ChangeNotifierProvider(create: (context) => Provideroperations(),
  child: MaterialApp(
    debugShowCheckedModeBanner: false,
    home: const Words(),
  ) ,
  ));



}

class Words extends StatefulWidget {
  const Words({Key? key}) : super(key: key);


  @override
  State<Words> createState() => _WordsState();
}

class _WordsState extends State<Words> {
  List word=["Time","Year","People","Way","Day","Man","Thing","Women","Life",
  "Child","World"];

  @override
  Widget build(BuildContext context) {
   final objectword=Provider.of<Provideroperations>(context);
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 60,
        backgroundColor: Colors.black45,
        title: Text("Englishwords",style: TextStyle(
          fontSize: 23,
          color: Colors.white,
          fontFamily: "Gloock",
        ),),
      ),
      body:ListView.builder(
        shrinkWrap: true,
        itemCount: word.length,
          itemBuilder: (context,index){
          return
              ListTile(
                leading:Text(word[index],),
                trailing: IconButton(onPressed: (){
                  objectword.favoriteswords(word[index]);


                },
                  icon:objectword.colorchange(word[index])?
                   Icon (Icons.favorite,color: Colors.red,):
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
