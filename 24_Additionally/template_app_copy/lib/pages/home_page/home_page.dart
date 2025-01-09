// Import Flutter
import 'package:flutter/material.dart';

// Import Packages
import 'package:flutter_bloc/flutter_bloc.dart';

// Import Localizations
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

// Import Layers
import 'package:business_layer/business_layer.dart';
import 'package:design_layer/design_layer.dart';

// Import Widgets
import 'package:template_app/pages/home_page/widgets/gradient_colors.dart';

// Import Navigation
import '../../fluro_router.dart';

class HomePage extends StatefulWidget {
  static const routeName = '/';

  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void didChangeDependencies() {
    context.read<ThemeBloc>().add(ChangeEvent());
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, DefaultTheme>(
      builder: (BuildContext ctx, DefaultTheme state) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Theme.of(context).colorScheme.inversePrimary,
            title: Text(AppLocalizations.of(context)!.home_title),
            centerTitle: true,
            actions: [
              IconButton(
                icon: const Icon(Icons.settings),
                onPressed: () =>  MyFluroRouter.router.navigateTo(context, '/settings'),
              ),
            ],
          ),
          body: Center(
             child: Column(
               mainAxisSize: MainAxisSize.min,
               children: [
                 BlocBuilder<CounterBloc, int>(
                   builder: (_, int state) {
                     return
                       Column(
                         mainAxisAlignment: MainAxisAlignment.center,
                         children: <Widget>[
                           Text('${AppLocalizations.of(context)!.home_text}:'),
                           Text('$state', style: Theme.of(context).textTheme.headlineMedium),
                         ],
                       );
                   },
                 ),
                 GradientColors(state: state),
               ],
             ),
          ),
          floatingActionButton: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              FloatingActionButton(
                heroTag: 'Inc',
                onPressed: () => context.read<CounterBloc>().add(Increase()),
                tooltip: AppLocalizations.of(context)!.home_btInc_tooltip,
                child: const Icon(Icons.add),
              ),
              SizedBox(height: 15.0),
              FloatingActionButton(
                heroTag: 'Dec',
                onPressed: () => context.read<CounterBloc>().add(Decrease()),
                tooltip: AppLocalizations.of(context)!.home_btDec_tooltip,
                child: const Icon(Icons.remove),
              ),
            ],
          ),
        );
      },
    );
  }
}
