import 'package:financial_app/core/presentation/bloc/home_bloc.dart';
import 'package:financial_app/shared/widget/not_available.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../../shared/component_list.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    ));

    return BlocProvider<HomeBloc>(
        create: (context) => HomeBloc(), child: _Home());
  }
}

class _Home extends StatefulWidget {
  _Home() : super();

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<_Home> {
  int _selectedIndex = 0;
  bool _visible = true;

  final _animationTime = 250;

  void _onItemTapped(int index, BuildContext context) {
    if (index == 3) {
      Navigator.of(context)
          .push(CupertinoPageRoute(builder: (context) => NotAvailable()));
    } else {
      context.read<HomeBloc>().add(HomeIndexChange(index: index));
    }
  }

  void _onItemTappedMotoboy(int index, BuildContext context) {
    if (index == 2) {
      Navigator.of(context)
          .push(CupertinoPageRoute(builder: (context) => NotAvailable()));
    } else {
      context.read()<HomeBloc>().add(HomeIndexChange(index: index));
    }
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    ));
    return WillPopScope(
      onWillPop: () async {
        if (_selectedIndex == 0) return true;
        _onItemTapped(0, context);
        return false;
      },
      child: SafeArea(
        top: false,
        bottom: false,
        child: Scaffold(
          body: Stack(
            children: [
              BlocListener<HomeBloc, HomeState>(
                listener: (context, state) {
                  _homeBlocHandler(state, context);
                },
                child: AnimatedOpacity(
                  duration: Duration(milliseconds: _animationTime),
                  opacity: _visible ? 1.0 : 0.0,
                  child: componentList[_selectedIndex].widget,
                ),
              ),
            ],
          ),
          bottomNavigationBar: _bottomNavigationBar(context),
        ),
      ),
    );
  }

  void _homeBlocHandler(HomeState state, BuildContext context) {
    if (state is HomeIndexChanged) {
      setState(() {
        _visible = false;
      });

      Future.delayed(Duration(milliseconds: _animationTime), () {
        setState(() {
          _selectedIndex = state.index;
          _visible = true;
        });
      });
    }
  }

  _bottomNavigationBar(BuildContext context) {
    final _selectedItemColor = Color(0xff02285A);
    final _unselectedItemColor = Color(0xff02285A).withOpacity(0.4);
    final _iconSize = 27.0;

    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      items: componentList
          .map((item) => BottomNavigationBarItem(
                icon: item.icon,
                label: item.title,
              ))
          .toList(),
      currentIndex: _selectedIndex,
      selectedItemColor: _selectedItemColor,
      unselectedItemColor: _unselectedItemColor,
      iconSize: _iconSize,
      onTap: (index) => _onItemTapped(index, context),
      showSelectedLabels: true,
      showUnselectedLabels: true,
    );
  }
}
