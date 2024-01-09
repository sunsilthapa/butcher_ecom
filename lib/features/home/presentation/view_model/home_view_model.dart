import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meat_shop/config/router/app_route.dart';
import 'package:meat_shop/features/home/presentation/state/home_state.dart';

final homeViewModelProvider = StateNotifierProvider<HomeViewModel,HomeState>((ref) => HomeViewModel());

class HomeViewModel extends StateNotifier<HomeState>{
  HomeViewModel(): super(HomeState.initialState());

  void changeIndex(int index){
    state = state.copyWith(index: index);
  }

  void logout(BuildContext context){
    //TODO: Implement Logout Functionality
    Navigator.pushReplacementNamed(context, AppRoute.loginRoute );
    
  }
}