import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:styled_widget/styled_widget.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          actions: <Widget>[
            Padding(
              padding: EdgeInsets.only(right: 20.0),
              child: GestureDetector(
                onTap: () {
                  // You can add your functionality here for when the icon is pressed
                },
                child: Icon(
                  Icons.abc,
                  color: Colors.white,
                ),
              ),
            ),
          ],
          backgroundColor: Color(0xff3977ff),
          title: Text(
            "Home",
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: SafeArea(child: UserPage()),
      ),
    );
  }
}

class UserPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final page = ({required Widget child}) => Styled.widget(child: child)
        .padding(vertical: 30, horizontal: 20)
        .constrained(minHeight: MediaQuery.of(context).size.height - (2 * 30))
        .scrollable();

    return <Widget>[
      UserCard(),
      ActionsRow(),
      Settings(),
    ].toColumn().parent(page);
  }
}

class UserCard extends StatelessWidget {
  Widget _buildUserRow() {
    return <Widget>[
      Icon(Icons.account_circle)
          .decorated(
            color: Colors.white,
            borderRadius: BorderRadius.circular(30),
          )
          .constrained(height: 50, width: 50)
          .padding(right: 10),
      <Widget>[
        Text(
          'Silentacht',
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ).padding(bottom: 5),
        Text(
          'Mobile Apps Developer',
          style: TextStyle(
            color: Colors.white.withOpacity(0.6),
            fontSize: 12,
          ),
        ),
      ].toColumn(crossAxisAlignment: CrossAxisAlignment.start),
    ].toRow();
  }

  Widget _buildUserStats() {
    return <Widget>[
      _buildUserStatsItem('846', 'Hadir'),
      _buildUserStatsItem('51', 'Sakit'),
      _buildUserStatsItem('267', 'Izin'),
      _buildUserStatsItem('39', 'Alpa'),
    ]
        .toRow(mainAxisAlignment: MainAxisAlignment.spaceAround)
        .padding(vertical: 10);
  }

  Widget _buildUserStatsItem(String value, String text) => <Widget>[
        Text(value).fontSize(20).textColor(Colors.white).padding(bottom: 5),
        Text(text).textColor(Colors.white.withOpacity(0.6)).fontSize(12),
      ].toColumn();

  @override
  Widget build(BuildContext context) {
    return <Widget>[_buildUserRow(), _buildUserStats()]
        .toColumn(mainAxisAlignment: MainAxisAlignment.spaceAround)
        .padding(horizontal: 20, vertical: 10)
        .decorated(
            color: Color(0xff3977ff), borderRadius: BorderRadius.circular(20))
        .elevation(
          5,
          shadowColor: Color(0xff3977ff),
          borderRadius: BorderRadius.circular(20),
        )
        .height(175)
        .alignment(Alignment.center);
  }
}

class ActionsRow extends StatelessWidget {
  Widget _buildActionItem(String name, IconData icon) {
    final Widget actionIcon = Icon(icon, size: 20, color: Color(0xFF42526F))
        .alignment(Alignment.center)
        .ripple()
        .constrained(width: 50, height: 50)
        .backgroundColor(Color(0xfff6f5f8))
        .clipOval()
        .padding(bottom: 5);

    final Widget actionText = Text(
      name,
      style: TextStyle(
        color: Colors.black.withOpacity(0.8),
        fontSize: 12,
      ),
    );

    return <Widget>[
      actionIcon,
      actionText,
    ].toColumn().padding(bottom: 15);
  }

  @override
  Widget build(BuildContext context) => <Widget>[
        Text(
          'Hanya tampilkan: ',
          style: TextStyle(
            color: Color(0xFF42526F),
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ).padding(vertical: 15, left: 20),
        [
          _buildActionItem(
            'Hadir',
            Icons.co_present,
          ),
          _buildActionItem('Sakit', Icons.sick),
          _buildActionItem('Izin', Icons.receipt),
          _buildActionItem('Alpa', Icons.close),
        ].toRow(mainAxisAlignment: MainAxisAlignment.spaceAround),
      ].toColumn(crossAxisAlignment: CrossAxisAlignment.start);
}

class SettingsItemModel {
  final IconData icon;
  final Color color;
  final String title;
  final String description;
  const SettingsItemModel({
    required this.color,
    required this.description,
    required this.icon,
    required this.title,
  });
}

const List<SettingsItemModel> settingsItems = [
  SettingsItemModel(
    icon: Icons.co_present,
    color: Color(0xff8D7AEE),
    title: 'Hadir',
    description: 'Ensure your harvesting address',
  ),
  SettingsItemModel(
    icon: Icons.sick,
    color: Color(0xffF468B7),
    title: 'Sakit',
    description: 'System permission change',
  ),
  SettingsItemModel(
    icon: Icons.receipt,
    color: Color(0xffFEC85C),
    title: 'Izin',
    description: 'Basic functional settings',
  ),
  SettingsItemModel(
    icon: Icons.close,
    color: Color(0xff5FD0D3),
    title: 'Alpa',
    description: 'Take over the news in time',
  ),
];

class Settings extends StatelessWidget {
  @override
  Widget build(BuildContext context) => settingsItems
      .map((settingsItem) => SettingsItem(
            settingsItem.icon,
            settingsItem.color,
            settingsItem.title,
            settingsItem.description,
          ))
      .toList()
      .toColumn();
}

class SettingsItem extends StatefulWidget {
  SettingsItem(this.icon, this.iconBgColor, this.title, this.description);

  final IconData icon;
  final Color iconBgColor;
  final String title;
  final String description;

  @override
  _SettingsItemState createState() => _SettingsItemState();
}

class _SettingsItemState extends State<SettingsItem> {
  bool pressed = false;

  @override
  Widget build(BuildContext context) {
    settingsItem({required Widget child}) => Styled.widget(child: child)
        .alignment(Alignment.center)
        .borderRadius(all: 15)
        .ripple()
        .backgroundColor(Colors.white, animate: true)
        .clipRRect(all: 25) // clip ripple
        .borderRadius(all: 25, animate: true)
        .elevation(
          pressed ? 0 : 20,
          borderRadius: BorderRadius.circular(25),
          shadowColor: Color(0x30000000),
        ) // shadow borderRadius
        .constrained(height: 80)
        .padding(vertical: 12) // margin
        .gestures(
          onTapChange: (tapStatus) => setState(() => pressed = tapStatus),
          onTapDown: (details) => print('tapv Down'),
          onTap: () => print('onTap'),
        )
        .scale(all: pressed ? 0.95 : 1.0, animate: true)
        .animate(Duration(milliseconds: 150), Curves.easeOut);

    final Widget icon = Icon(widget.icon, size: 20, color: Colors.white)
        .padding(all: 12)
        .decorated(
          color: widget.iconBgColor,
          borderRadius: BorderRadius.circular(30),
        )
        .padding(left: 15, right: 10);

    final Widget title = Text(
      widget.title,
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 16,
      ),
    ).padding(bottom: 5);

    final Widget description = Text(
      widget.description,
      style: TextStyle(
        color: Colors.black26,
        fontWeight: FontWeight.bold,
        fontSize: 12,
      ),
    );

    return settingsItem(
      child: <Widget>[
        icon,
        <Widget>[
          title,
          description,
        ].toColumn(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
        ),
      ].toRow(),
    );
  }
}
