import 'package:flutter/material.dart';
import 'package:tourism/widgets/about_us.dart';

class SettingsPage extends StatelessWidget {
  final List<String> settings = ["Enable dark mode", "Language", "About us"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Text(
          "Settings",
          style: TextStyle(
            fontSize: 20,
          ),
        ),
      ),
      body: Container(
        height: 200,
        margin: const EdgeInsets.all(30),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: Colors.white30),
            boxShadow: [
              BoxShadow(
                blurRadius: 3,
                spreadRadius: -2,
                offset: Offset(0.0, 0.0),
              )
            ]),
        child: ListView.separated(
          physics: NeverScrollableScrollPhysics(),
          padding: const EdgeInsets.all(5),
          itemCount: settings.length,
          itemBuilder: (context, index) {
            return SettingsTile(
              title: settings[index],
              tileSwitch: index == 0 ? Switch(
                value: false, onChanged: (sel){},
              ) : null,
              onTap: index == 2 ? (){
                showDialog(context: context, child: AboutUsWidget()
                );
              } : (){},
            );
          },
          separatorBuilder: (context, index) => Divider(),
        ),
      ),
    );
  }
}

class SettingsTile extends StatefulWidget {

  final String title;
  final Switch tileSwitch;
  final Function onTap;

  SettingsTile({
    @required this.title,
    this.tileSwitch,
    @required this.onTap,
});

  @override
  _SettingsTileState createState() => _SettingsTileState();
}

class _SettingsTileState extends State<SettingsTile> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      child: ListTile(
        onTap: widget.onTap,
        title: Text(widget.title),
        trailing: widget.tileSwitch != null ? widget.tileSwitch : null,
      ),
    );
  }
}
