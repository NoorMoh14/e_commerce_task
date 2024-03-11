import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:task/feature/add_item_screen/add_item_screen.dart';
import 'package:task/feature/home_Screen/home_Screen.dart';
import '../domain/use_casess/fetch_home_use_case.dart';
import '../feature/home_Screen/home_screen_view_model.dart';
import '../injection.dart';
import '../../generated/l10n.dart';
import '../styles/styles.dart';
import 'main_view_model.dart';

main() {
  WidgetsFlutterBinding.ensureInitialized();
  configureDependencies("Dev");
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (_) => HomeScreenViewModel(getIt<FetchHomeUseCase>())),
    ChangeNotifierProvider(create: (_) => MainViewModel()),
    ], child: const MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<StatefulWidget> createState() {
    return _MyApp();
  }
}

class _MyApp extends State<MyApp> implements AddLanguageDefaultListeners {
  _MyApp();

  late final MainViewModel? vmProvider;
 // StreamSubscription? _streamSubscription;

  @override
  void initState() {
    vmProvider = Provider.of<MainViewModel>(context, listen: false);
    vmProvider?.init(this);
    super.initState();
  }



  @override
  Widget build(BuildContext context) {
    final vm = Provider.of<MainViewModel>(context);
    return MaterialApp.router(
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.system,
      locale: vm.appLocal,
      supportedLocales: S.delegate.supportedLocales,
      localizationsDelegates: const [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      debugShowCheckedModeBanner: false,
      routeInformationParser: BeamerParser(),
      routerDelegate: routerDelegate,
    );
  }

  final routerDelegate = BeamerDelegate(
    locationBuilder: RoutesLocationBuilder(
      routes: {
        '/': (context, state, data) =>  const HomeScreen(),
        '/home_screen': (context, state, data) =>   const HomeScreen(),
        '/add_item_screen': (context, state, data) =>   const AddItemScreen(),
      },
    ),
  );
}
