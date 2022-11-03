import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'src/counter_observer.dart';
import 'package:counter/src/app.dart';

void main() {
  Bloc.observer = CounterObserver();
  runApp(const CounterApp());
}
