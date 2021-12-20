import 'package:flutter/material.dart';
import 'package:mealapp/Screens/drawer_screen.dart';

class FiltersScreen extends StatefulWidget {
  static const routName = '/filters';
  final Function saveFilters;
  final Map<String, bool> currentFilters;

  const FiltersScreen(this.currentFilters, this.saveFilters);

  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  bool _GlutenFree = false;
  bool _LactoseFree = false;
  bool _Vegan = false;
  bool _Vegetarian = false;

  @override
  initState() {
    _GlutenFree = widget.currentFilters['gluten'];
    _LactoseFree = widget.currentFilters['vegan'];
    _Vegan = widget.currentFilters['vegetarian'];
    _Vegetarian = widget.currentFilters['lactose'];
    super.initState();
  }

  Widget buildSwitchListTile(String title, bool value, Function fun) {
    return SwitchListTile(
      title: Text(title),
      value: value,
      onChanged: fun,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Filters"),
        actions: [
          IconButton(
            onPressed: () {
              final Map<String, bool> selectedFilter = {
                'gluten': _GlutenFree,
                'vegan': _Vegan,
                'vegetarian': _Vegetarian,
                'lactose': _LactoseFree,
              };

              widget.saveFilters(selectedFilter);
            },
            icon: Icon(Icons.save),
            padding: EdgeInsets.only(
              right: 1,
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(10),
            child: Text(
              "Adjust your meal selection",
              style: TextStyle(
                fontSize: 21,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                buildSwitchListTile(
                  "gluten-Free",
                  _GlutenFree,
                  (newValue) {
                    setState(() {
                      _GlutenFree = newValue;
                    });
                  },
                ),
                buildSwitchListTile(
                  "lactose-Free",
                  _LactoseFree,
                  (newValue) {
                    setState(() {
                      _LactoseFree = newValue;
                    });
                  },
                ),
                buildSwitchListTile(
                  "vegetarian",
                  _Vegetarian,
                  (newValue) {
                    setState(() {
                      _Vegetarian = newValue;
                    });
                  },
                ),
                buildSwitchListTile(
                  "vegan",
                  _Vegan,
                  (newValue) {
                    setState(() {
                      _Vegan = newValue;
                    });
                  },
                ),
              ],
            ),
          ),
        ],
      ),
      drawer: MainDrawer(),
    );
  }
}
