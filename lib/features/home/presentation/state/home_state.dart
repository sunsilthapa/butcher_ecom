import 'package:flutter/material.dart';
import 'package:meat_shop/features/home/presentation/view/bottom_view/cart_page_view.dart';
import 'package:meat_shop/features/home/presentation/view/bottom_view/dashboard_view.dart';
import 'package:meat_shop/features/home/presentation/view/bottom_view/favorite_page_view.dart';
import 'package:meat_shop/features/home/presentation/view/bottom_view/profile_view.dart';

class HomeState {
  final int index;
  final List<Widget> lstScreen;

  HomeState({required this.index, required this.lstScreen});

  HomeState.initialState() 
  :  index= 0,
   lstScreen= [
      const DashboardView(),
      const FavoritePageView(),
      const CartPageView(),
      const ProfileView(),
    ];
  

  HomeState copyWith({
    int? index,
  }){
    return HomeState(index: index?? this.index, lstScreen: lstScreen);
  }
}

class AddCourseView {
  const AddCourseView();
}
