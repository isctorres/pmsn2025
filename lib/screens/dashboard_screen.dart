import 'package:dark_light_button/dark_light_button.dart';
import 'package:flutter/material.dart';
import 'package:pmsn2025/utils/global_values.dart';
import 'package:pmsn2025/utils/theme_settings.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Bienvenido"),
        actions: [
          DarlightButton(
            type: Darlights.DarlightFour,
            options: DarlightFourOption(),
            onChange: (value) {
              if( value == ThemeMode.light ){
                GlobalValues.themeApp.value = ThemeSettings.lightTheme();
              }else{
                GlobalValues.themeApp.value = ThemeSettings.darkTheme();
              }
            },
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            const UserAccountsDrawerHeader(
              currentAccountPicture: CircleAvatar(
                backgroundImage: NetworkImage('https://i.pravatar.cc/300') ,
              ),
              accountName: Text('Rubensin Torres Frias'), 
              accountEmail: Text('ruben.torres@itcelaya.edu.mx')
            ),
            ListTile(
              onTap: (){},
              leading: Icon(Icons.design_services),
              title: Text('Práctica Figma'),
              subtitle: Text('Frontend App'),
              trailing: Icon(Icons.chevron_right),
            )
          ],
        ),
      ),
      //endDrawer: Drawer(),
    );
  }
}