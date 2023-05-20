import 'package:flutter/material.dart';
import '../widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  static const routeName = '/filter';

  final Function saveFilters;
  final Map<String,bool> currentFilters;
  FiltersScreen(this.currentFilters,this.saveFilters);

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

Widget _builSwitchListTile(
    String title, String description, bool currentValue, Function updateValue) {
  return SwitchListTile(
    title: Text(title),
    subtitle: Text(description),
    value: currentValue,
    onChanged: updateValue,
  );
}

class _FiltersScreenState extends State<FiltersScreen> {
  var _glutenFree = false;
  var _lactoseFree = false;
  var _vegetarian = false;
  var _vegan = false;

  @override
  void initState() {
    // TODO: implement initState
    _glutenFree = widget.currentFilters['gluten'];
    _lactoseFree = widget.currentFilters['lactose'];
    _vegetarian = widget.currentFilters['vegetarian'];
    _vegan = widget.currentFilters['vegan'];
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Filters'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.save),
            onPressed: () {
              final selectedFilters = {
                'gluten': _glutenFree,
                'lactose': _lactoseFree,
                'vegetarian': _vegetarian,
                'vegan': _vegan,
              };
              widget.saveFilters(selectedFilters);
            },
          ),
        ],
      ),
      drawer: MainDrawer(),
      body: Column(children: [
        Container(
          padding: EdgeInsets.all(20),
          child: Text('Adjust your Meal Selection',
              style: Theme.of(context).textTheme.bodyText1),
        ),
        Expanded(
          child: ListView(children: [
            _builSwitchListTile(
              'Gluten-free',
              'Only include gluten-free meals',
              _glutenFree,
              (newValue) {
                setState(() {
                  _glutenFree = newValue;
                });
              },
            ),
            _builSwitchListTile(
              'Lactose-free',
              'Only include lactose-free meals',
              _lactoseFree,
              (newValue) {
                setState(() {
                  _lactoseFree = newValue;
                });
              },
            ),
            _builSwitchListTile(
              'Vegetarian',
              'Only include Vegetarian meals',
              _vegetarian,
              (newValue) {
                setState(() {
                  _vegetarian = newValue;
                });
              },
            ),
            _builSwitchListTile(
              'Vegan',
              'Only include Vegan meals',
              _vegan,
              (newValue) {
                setState(() {
                  _vegan = newValue;
                });
              },
            ),
          ]),
        ),
      ]),
    );
  }
}
