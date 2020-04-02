import 'package:estude_agora/data/data.dart';
import 'package:estude_agora/models/speciality.dart';
import 'package:flutter/material.dart';

String selectedCategorie = "Português";

class DicasScreen extends StatefulWidget {
  @override
  _DicasScreenState createState() => _DicasScreenState();
}

class _DicasScreenState extends State<DicasScreen> {
  List<String> categories = [
    "Português",
    "Trânsito",
    "Informática",
    "Direito Constitucional",
    "Direito Administrativo",
    "Direito Penal",
    "Direito Processo Penal",
  ];

  List<SpecialityModel> specialities;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    specialities = getSpeciality();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          color: Colors.white,
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                height: 10,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 24),
                height: 50,
                decoration: BoxDecoration(
                    color: Color(0xffEFEFEF),
                    borderRadius: BorderRadius.circular(14)),
                child: TextField(
                        obscureText: true,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          icon: Icon(
                            Icons.search,
                            color: Colors.grey,
                          ),
                          hintText: 'Buscar',
                        ),
                      ),
              ),
              SizedBox(
                height: 30,
              ),
              //
              Container(
                height: 30,
                child: ListView.builder(
                    itemCount: categories.length,
                    shrinkWrap: true,
                    physics: ClampingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return CategorieTile(
                        categorie: categories[index],
                        isSelected: selectedCategorie == categories[index],
                        context: this,
                      );
                    }),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                height: 500,
                
                child: ListView.builder(
                    itemCount: specialities.length,
                    shrinkWrap: true,
                    physics: ClampingScrollPhysics(),
                    scrollDirection: Axis.vertical,
                    itemBuilder: (context, index) {
                      return SpecialistTile(
                        imgAssetPath: specialities[index].imgAssetPath,
                        speciality: specialities[index].speciality,
                        noOfDoctors: specialities[index].noOfDoctors,
                        backColor: specialities[index].backgroundColor,
                      );
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CategorieTile extends StatefulWidget {
  String categorie;
  bool isSelected;
  _DicasScreenState context;
  CategorieTile({this.categorie, this.isSelected, this.context});

  @override
  _CategorieTileState createState() => _CategorieTileState();
}

class _CategorieTileState extends State<CategorieTile> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        widget.context.setState(() {
          selectedCategorie = widget.categorie;
        });
      },
      child: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(horizontal: 20),
        margin: EdgeInsets.only(left: 8),
        height: 30,
        decoration: BoxDecoration(
            color: widget.isSelected ? Color(0xffFFD0AA) : Colors.white,
            borderRadius: BorderRadius.circular(30)),
        child: Text(
          widget.categorie,
          style: TextStyle(
              color: widget.isSelected ? Color(0xffFC9535) : Color(0xffA1A1A1)),
        ),
      ),
    );
  }
}

class SpecialistTile extends StatelessWidget {
  String imgAssetPath;
  String speciality;
  int noOfDoctors;
  Color backColor;
  SpecialistTile(
      {@required this.imgAssetPath,
      @required this.speciality,
      @required this.noOfDoctors,
      @required this.backColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: backColor, borderRadius: BorderRadius.circular(24)),
      padding: EdgeInsets.only(top: 16, right: 16, left: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            speciality,
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          SizedBox(
            height: 6,
          ),
          Text(
            "$noOfDoctors sda sdasdasdasdasda a dasd a sdadasd asd asda dad asd asdasd asd asdasdada sd asd asd asd asd asd asd asd asdas dasd",
            style: TextStyle(color: Colors.white, fontSize: 15),
          ),
          Image.asset(
            imgAssetPath,
            height: 100,
            fit: BoxFit.fitHeight,
          )
        ],
      ),
    );
  }
}


