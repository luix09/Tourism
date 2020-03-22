import 'package:flutter/material.dart';
import 'package:tourism/widgets/dashboard_widgets.dart';

class SearchPage extends StatefulWidget {
  final String hintText;

  SearchPage({Key key, this.hintText}) : super(key: key);

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  //this could be put into a data model
  final Map<String, Color> chipLabels = {
    "Agency": Colors.red,
    "City": Colors.purple,
    "Country": Colors.yellow,
    "Tour": Colors.blue,
  };

  int _indexSelected = 0;

  Widget getChip({String label, Color color, bool selected, int index}) {
    return ChoiceChip(
      backgroundColor: color,
      avatar: selected ? Icon(Icons.check) : Icon(Icons.fiber_manual_record, size: 15,),
      elevation: 3,
      selectedShadowColor: Colors.black,
      pressElevation: 5,
      padding: const EdgeInsets.symmetric(horizontal: 15),
      labelPadding: const EdgeInsets.all(0),
      selected: selected,
      selectedColor: color,
      onSelected: (bool selected) {
        setState(() {
          if(selected == true && _indexSelected != index)
            _indexSelected = index;
          else
            _indexSelected = null;
        });
      },
      label: Text(
        label,
        style: TextStyle(
          fontSize: 17,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(top: 10),
                child: Hero(
                  tag: 'search',
                  child: SearchBar(
                    hintText: widget.hintText,
                  ),
                ),
              ),
              Container(
                height: 150,
                padding: const EdgeInsets.all(8),
                child: Wrap(
                  direction: Axis.horizontal,
                  children: <Widget>[
                    ...List.generate(chipLabels.length, (index) {
                      // A bit hardcoded heh? :D
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 9.0),
                          child: getChip(
                            label: chipLabels.keys.toList()[index],
                            color: chipLabels[chipLabels.keys.toList()[index]],
                            selected: _indexSelected == index,
                            index: index
                          ),
                        );
                    }),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
