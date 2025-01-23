import 'dart:ui';

import 'package:figure_toys/controllers/base.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoadDataBuilder<CubitType extends Cubit<CubitState>,
    DynamicState extends CubitState> extends StatefulWidget {
  final Widget Function(DynamicState) builder;
  final CubitType cubit;
  final dynamic state;
  // final Function(DynamicState) setData;

  const LoadDataBuilder(
      {super.key,
      required this.builder,
      required this.cubit,
      required this.state,
      });

  @override
  State<LoadDataBuilder<CubitType, DynamicState>> createState() =>
      _LoadDataBuilderState();
}

class _LoadDataBuilderState<CubitType extends Cubit<CubitState>,
        DynamicState extends CubitState>
    extends State<LoadDataBuilder<CubitType, DynamicState>> {
  @override
  void initState() {
    super.initState();
    widget.cubit.state;
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return BlocBuilder<CubitType, CubitState>(
      bloc: widget.cubit,
      builder: (context, state) {
        if (state is LoadingCubit) {
          return Center(
              child: CircularProgressIndicator(
            color: Colors.deepOrange,
          ));
        } else if (state is DynamicState) {
          return widget.builder(state);
        } else if (state is ErrorCubit) {
          return Center(child: Text('Error: ${state.error}'));
        }
        return Center(child: Text('No data'));
      },
    );
  }
}
