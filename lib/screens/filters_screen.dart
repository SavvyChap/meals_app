import 'package:flutter/material.dart';
import 'package:meals_app/widgets/drawer_main.dart';

class FilterScreen extends StatefulWidget {
  static const routeName = '/filters';

  @override
  _FilterScreenState createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  bool _glutenFree = false;
  bool _vegetarian = false;
  bool _vegan = false;
  bool _lactosFree = false;

  Widget _buildSwitchListTile(
      String title,
      String description,
      bool currentValue,
      Function updateValue,
      ) {
    return SwitchListTile(
      title: Text(title),
      value: currentValue,
      subtitle: Text(description),
      onChanged: updateValue,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Filter Selection'),
      ),
      drawer: MainDrawer(),
      body: Column(children: <Widget>[
        Container(
          padding: EdgeInsets.all(20),
          child: Text(
            'Adjust your meal selection',
            style: Theme.of(context).textTheme.title,
          ),
        ),
        Expanded(
          child: ListView(
            children: <Widget>[
              _buildSwitchListTile(
                  'Vegetarian',
                  'Only show vegetarian meals',
                  _vegetarian,
                      (newValue) {
                    setState(() {
                      _vegetarian = newValue;
                    });
                      }),
              _buildSwitchListTile(
                  'Vegan',
                  'Only show vegan meals',
                  _vegan,
                      (newValue) {
                    setState(() {
                      _vegan = newValue;
                    });
                  }),
              _buildSwitchListTile(
                  'Gluten Free',
                  'Only show gluten free meals',
                  _glutenFree,
                      (newValue) {
                    setState(() {
                      _glutenFree = newValue;
                    });
                  }),
              _buildSwitchListTile(
                  'Lactose Free',
                  'Only show lactose free meals',
                  _lactosFree,
                      (newValue) {
                    setState(() {
                      _lactosFree = newValue;
                    });
                  }),
            ],
          ),
        ),
      ],),
    );
  }
}
