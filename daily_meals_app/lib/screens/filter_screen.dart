import 'package:daily_meals_app/screens/main_drawer.dart';
import 'package:flutter/material.dart';

class FiltersScreen extends StatefulWidget {
  static const routeName = '/filter';

  final Function(Map<String, bool> filterData) saveFilters;
  final Map<String, bool> filerData;

  const FiltersScreen({
    Key? key,
    required this.filerData,
    required this.saveFilters,
  }) : super(key: key);

  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  var _glutenFree = false;
  var _vegetarian = false;
  var _vegan = false;
  var _lactoseFree = false;

  @override
  void initState() {
    super.initState();

    _glutenFree = widget.filerData['gluten'] as bool;
    _vegetarian = widget.filerData['vegetarian'] as bool;
    _vegan = widget.filerData['vegan'] as bool;
    _lactoseFree = widget.filerData['lactose'] as bool;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Filters'),
        actions: [
          IconButton(
            onPressed: () => widget.saveFilters({
              'gluten': _glutenFree,
              'lactose': _lactoseFree,
              'vegan': _vegan,
              'vegetarian': _vegetarian
            }),
            icon: Icon(Icons.save),
          ),
        ],
      ),
      drawer: MainDrawer(),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(20),
            child: Text(
              'Adjust your meal selection',
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
          Expanded(
              child: ListView(
            children: [
              _buildSwitchListTile(
                  title: 'Gluten Free',
                  description: 'Only include gluten-free meals.',
                  currentValue: _glutenFree,
                  onChangeAction: (newValue) {
                    setState(() {
                      _glutenFree = newValue;
                    });
                  }),
              _buildSwitchListTile(
                  title: 'Lactose Free',
                  description: 'Only include lactose-free meals.',
                  currentValue: _lactoseFree,
                  onChangeAction: (newValue) {
                    setState(() {
                      _lactoseFree = newValue;
                    });
                  }),
              _buildSwitchListTile(
                  title: 'Vegetarian',
                  description: 'Only include vegetarian meals.',
                  currentValue: _vegetarian,
                  onChangeAction: (newValue) {
                    setState(() {
                      _vegetarian = newValue;
                    });
                  }),
              _buildSwitchListTile(
                  title: 'Vegan',
                  description: 'Only include vegan meals.',
                  currentValue: _vegan,
                  onChangeAction: (newValue) {
                    setState(() {
                      _vegan = newValue;
                    });
                  }),
            ],
          ))
        ],
      ),
    );
  }

  Widget _buildSwitchListTile({
    required String title,
    required String description,
    required bool currentValue,
    required Function onChangeAction,
  }) {
    return SwitchListTile(
      value: currentValue,
      title: Text(title),
      subtitle: Text(description),
      onChanged: (newValue) => onChangeAction(newValue),
    );
  }
}
