import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
class AzkarScreen extends StatefulWidget {
  const AzkarScreen({Key? key}) : super(key: key);

  @override
  State<AzkarScreen> createState() => _AzkarScreenState();
}

class _AzkarScreenState extends State<AzkarScreen> {
  int _counter=0;
  String _content='استغفر الله';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text(
            'Azkar',
          style: GoogleFonts.cairo(
            color: Colors.white
          ),
        ),
        centerTitle: true,
        elevation: 0,
        actions: [
          IconButton(
              onPressed: (){
                Navigator.pushNamed(context, '/info_screen');
              },
              icon:Icon(Icons.info)),
          PopupMenuButton<String>(
            onSelected: (value){
              if(_content!=value){
                setState(() {
                  _content=value;
                  _counter=0;
                });
              }
            },
            itemBuilder:(context) {
            return[
              PopupMenuItem(
                child: Text('استغفر الله'),
              height: 30,
              value: 'استغفر الله',
              ),
              PopupMenuDivider(),
              PopupMenuItem(
                child: Text('الحمدلله'),
                height: 30,
                value: 'الحمدلله',),
              PopupMenuDivider(),
              PopupMenuItem(
                child: Text('سبحان الله'),
                height: 30,
                value: 'سبحان الله',),
            ];
          },)

        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          setState(() {
            ++_counter;
          });
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.teal.shade900,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: AlignmentDirectional.topStart,
              end: AlignmentDirectional.bottomEnd,
            colors: [
              Colors.teal.shade700,
              Colors.teal.shade100,
            ]
          )
        ),
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 70,
              height: 70,
              margin: EdgeInsetsDirectional.only(bottom: 20),
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
              ),
            ),
            Card(
              margin: EdgeInsetsDirectional.only(bottom: 20),
              clipBehavior: Clip.antiAlias,
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              child: Row(
                children: [
                  Expanded(child:
                  Text(
                      _content,
                    textAlign: TextAlign.center,
                    style: GoogleFonts.cairo(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  )),
                  Container(
                    color: Colors.teal.shade100,
                    height: 60,
                    width: 60,
                    alignment: Alignment.center,
                    child: Text(
                      _counter.toString(),
                      style: GoogleFonts.cairo(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Row(
              children: [
                Expanded(
                  flex: 2,
                  child: ElevatedButton(
                  onPressed: (){
                    setState(() {
                      ++_counter;
                    });
                  },
                  child: Text('تسبيح'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.teal.shade100,
                    minimumSize: Size(0, 45),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadiusDirectional.only(
                        topStart: Radius.circular(10),
                      )
                    )
                  ),
                ),
                ),
                Expanded(child: ElevatedButton(
                  onPressed: (){
                    setState(() {
                      _counter=0;
                    });
                  },
                  child: Text('اعادة'),
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.teal.shade200,
                      minimumSize: Size(0, 45),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadiusDirectional.only(
                            bottomEnd: Radius.circular(10),
                          )
                      )
                  ),
                ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
