import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_complete_guide/screens/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  static const routeName = '/filters';
  final Function saveFilters;
  final Map<String, bool> currentFilters;
  const FiltersScreen(this.currentFilters, this.saveFilters);

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  var _glutenFree = false;
  var _vegetarian = false;
  var _vegan = false;
  var _lactoseFree = false;

  @override
  void initState() {
    _glutenFree = widget.currentFilters['gluten'];
    _lactoseFree = widget.currentFilters['lactose'];
    _vegan = widget.currentFilters['vegan'];
    _vegetarian = widget.currentFilters['vegetarian'];

    super.initState();
  }

  Widget buildSwitchListTile(String title, String description,
      bool currentValue, Function updateValue) {
    return SwitchListTile(
      value: currentValue,
      subtitle: Text(description),
      onChanged: updateValue,
      title: Text(title),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MainDrawer(),
      appBar: AppBar(
        title: Text('Your Filters'),
        actions: [
          IconButton(
              onPressed: () {
                final selectedFilters = {
                  'gluten': _glutenFree,
                  'lactose': _lactoseFree,
                  'vegan': _vegan,
                  'vegetarian': _vegetarian
                };
                widget.saveFilters(selectedFilters);
              },
              icon: Icon(Icons.save))
        ],
      ),
      body: Column(children: [
        Container(
          padding: EdgeInsets.all(20),
          child: Text(
            'Adjust your meal selection',
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ),
        Expanded(
            child: ListView(
          children: [
            buildSwitchListTile(
                'Gluten-Free', 'Only include gluten-free meals', _glutenFree,
                (newValue) {
              setState(() {
                _glutenFree = newValue;
              });
            }),
            buildSwitchListTile(
                'Lactose-Free', 'Only include lactose-free meals', _lactoseFree,
                (newValue) {
              setState(() {
                _lactoseFree = newValue;
              });
            }),
            buildSwitchListTile(
                'Vegetarian', 'Only include vegetarian meals', _vegetarian,
                (newValue) {
              setState(() {
                _vegetarian = newValue;
              });
            }),
            buildSwitchListTile('Vegan', 'Only include vegan meals', _vegan,
                (newValue) {
              setState(() {
                _vegan = newValue;
              });
            })
          ],
        ))
      ]),
    );
  }
}
