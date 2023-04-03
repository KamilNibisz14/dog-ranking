import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/view_bloc.dart';


class SwitchThemeWidget extends StatelessWidget {
  const SwitchThemeWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ViewBloc, ViewState>(
      builder: (context, state) {
        return Switch(
          value: !state.isViewNormal,
          onChanged: (bool value) {
            context.read<ViewBloc>().add(ChangeView());
          },
        );
      },
    );
  }
}
