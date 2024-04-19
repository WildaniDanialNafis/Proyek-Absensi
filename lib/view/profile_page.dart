import 'package:flutter/material.dart';
import 'package:styled_widget/styled_widget.dart';

class ProfileDetailPage extends StatefulWidget {
  const ProfileDetailPage({super.key});

  @override
  State<ProfileDetailPage> createState() => _ProfileDetailPageState();
}

class _ProfileDetailPageState extends State<ProfileDetailPage> {
  final myController = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    myController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    page({required Widget child}) =>
        Styled.widget(child: child).padding(vertical: 30);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        title: Text(
          "Profil",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Color(0xff3977ff),
      ),
      body: <Widget>[
        Center(
          child: Container(
            width: 200,
            height: 200,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Colors.black),
                image: DecorationImage(
                    image: NetworkImage(
                        "https://www.bing.com/images/search?view=detailV2&ccid=zW2hTWOL&id=3E0829F2DE20BB47C62C53C86424E3273CC5EC1D&thid=OIP.zW2hTWOLRINP9ZVsUmoPlwHaGQ&mediaurl=https%3a%2f%2frei.animecharactersdatabase.com%2fuploads%2fchars%2f11498-1661414449.jpg&exph=730&expw=863&q=boruto&simid=608048549580445653&FORM=IRPRST&ck=F88E636FA7CE3A5240EB7814598FDBF1&selectedIndex=12&itb=0&ajaxhist=0&ajaxserp=0"),
                    fit: BoxFit.cover)),
          ),
        ),
        SizedBox(
          height: 30,
        ),
        BuildProfileField(
          icon: Icons.password,
          title: "Nis",
          value: "982734924",
          description: "deskripsi asdlkandsalkndsaknasd",
        ),
        BuildProfileField(
          icon: Icons.person,
          title: "Nama",
          value: "Wildani",
          enableEdit: true,
        ),
        BuildProfileField(
          icon: Icons.call,
          title: "Telepon",
          value: "21987231",
          enableEdit: true,
        ),
      ].toColumn(mainAxisAlignment: MainAxisAlignment.start).parent(page),
    );
  }
}

class BuildProfileField extends StatefulWidget {
  final IconData icon;
  final String title;
  final String value;
  final String? description;
  final bool enableEdit;

  BuildProfileField(
      {required this.icon,
      required this.title,
      required this.value,
      this.description,
      this.enableEdit = false});

  @override
  State<BuildProfileField> createState() => _BuildProfileFieldState();
}

class _BuildProfileFieldState extends State<BuildProfileField> {
  bool pressed = false;
  @override
  Widget build(BuildContext context) {
    settingsItem({required Widget child}) => Styled.widget(child: child)
        .alignment(Alignment.center)
        .ripple()
        .backgroundColor(Colors.white, animate: true)
        .constrained(height: 80)
        .gestures(
          onTapChange: (tapStatus) => setState(() => pressed = tapStatus),
          onTapDown: (details) => print('tapv Down'),
          onTap: () => FloatingActionButton(
            // When the user presses the button, show an alert dialog containing
            // the text that the user has entered into the text field.
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    // Retrieve the text that the user has entered by using the
                    // TextEditingController.
                    content: Text("asda"),
                  );
                },
              );
            },
            tooltip: 'Show me the value!',
            child: const Icon(Icons.text_fields),
          ),
        )
        .scale(all: 1.0, animate: true)
        .animate(Duration(milliseconds: 150), Curves.easeOut);

    final Widget icon = Icon(widget.icon, size: 20, color: Colors.grey)
        .padding(all: 12)
        .decorated(
          borderRadius: BorderRadius.circular(30),
        )
        .padding(left: 15, right: 10);

    final Widget title = Text(
      widget.title,
      style: TextStyle(
        color: Colors.black26,
        fontWeight: FontWeight.bold,
        fontSize: 16,
      ),
    );

    final Widget value = Text(
      widget.value,
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 16,
      ),
    );

    final Widget editButton = Icon(Icons.edit, size: 20, color: Colors.blue)
        .padding(all: 12)
        .decorated(
          borderRadius: BorderRadius.circular(30),
        )
        .padding(left: 15, right: 10);

    Widget createDescription(String description) {
      return Text(
        description,
        style: TextStyle(
          color: Colors.black26,
          fontWeight: FontWeight.bold,
          fontSize: 12,
        ),
      );
    }

    if (widget.enableEdit == true) {
      if (widget.description != null) {
        return settingsItem(
          child: <Widget>[
            icon,
            Expanded(
                child: <Widget>[
              <Widget>[
                <Widget>[
                  title,
                  value,
                ].toColumn(crossAxisAlignment: CrossAxisAlignment.start),
                editButton,
              ].toRow(mainAxisAlignment: MainAxisAlignment.spaceBetween),
              createDescription(widget.description!),
            ].toColumn(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start)),
          ].toRow(crossAxisAlignment: CrossAxisAlignment.start),
        );
      } else {
        return settingsItem(
          child: <Widget>[
            icon,
            Expanded(
                child: <Widget>[
              <Widget>[
                <Widget>[
                  title,
                  value,
                ].toColumn(crossAxisAlignment: CrossAxisAlignment.start),
                editButton,
              ].toRow(mainAxisAlignment: MainAxisAlignment.spaceBetween),
            ].toColumn(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start)),
          ].toRow(),
        );
      }
    } else {
      if (widget.description != null) {
        return settingsItem(
          child: <Widget>[
            icon,
            Expanded(
                child: <Widget>[
              <Widget>[
                <Widget>[
                  title,
                  value,
                ].toColumn(crossAxisAlignment: CrossAxisAlignment.start),
              ].toRow(mainAxisAlignment: MainAxisAlignment.spaceBetween),
              createDescription(widget.description!),
            ].toColumn(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start)),
          ].toRow(crossAxisAlignment: CrossAxisAlignment.start),
        );
      } else {
        return settingsItem(
          child: <Widget>[
            icon,
            Expanded(
                child: <Widget>[
              <Widget>[
                <Widget>[
                  title,
                  value,
                ].toColumn(crossAxisAlignment: CrossAxisAlignment.start),
              ].toRow(mainAxisAlignment: MainAxisAlignment.spaceBetween),
            ].toColumn(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start)),
          ].toRow(crossAxisAlignment: CrossAxisAlignment.center),
        );
      }
    }
  }
}
