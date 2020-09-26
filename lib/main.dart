import 'main_imports.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider<Auth>(create: (_) => Auth()),
          ChangeNotifierProvider<ThemeProv>(create: (_) => ThemeProv()),
          ChangeNotifierProxyProvider<Auth, SuspensionProvider>(
              create: null,
              update: (context, auth, oldItems) => SuspensionProvider(
                  auth.token, oldItems == null ? [] : oldItems.items)),
          ChangeNotifierProxyProvider<Auth, SteeringProvider>(
              create: null,
              update: (context, auth, oldItems) => SteeringProvider(
                  auth.token, oldItems == null ? [] : oldItems.items)),
          ChangeNotifierProxyProvider<Auth, ExhaustProvider>(
              create: null,
              update: (context, auth, oldItems) => ExhaustProvider(
                  auth.token, oldItems == null ? [] : oldItems.items)),
          ChangeNotifierProxyProvider<Auth, CoolingProvider>(
              create: null,
              update: (context, auth, oldItems) => CoolingProvider(
                  auth.token, oldItems == null ? [] : oldItems.items)),
          ChangeNotifierProxyProvider<Auth, DriveTrainProvider>(
              create: null,
              update: (context, auth, oldItems) => DriveTrainProvider(
                  auth.token, oldItems == null ? [] : oldItems.items)),
          ChangeNotifierProxyProvider<Auth, IntakeProvider>(
              create: null,
              update: (context, auth, oldItems) => IntakeProvider(
                  auth.token, oldItems == null ? [] : oldItems.items)),
          ChangeNotifierProxyProvider<Auth, BrakesProvider>(
              create: null,
              update: (context, auth, oldItems) => BrakesProvider(
                  auth.token, oldItems == null ? [] : oldItems.items)),
          ChangeNotifierProxyProvider<Auth, ElectronicsProvider>(
              create: null,
              update: (context, auth, oldItems) => ElectronicsProvider(
                  auth.token, oldItems == null ? [] : oldItems.items)),
          ChangeNotifierProxyProvider<Auth, ChassisProvider>(
              create: null,
              update: (context, auth, oldItems) => ChassisProvider(
                  auth.token, oldItems == null ? [] : oldItems.items)),
          ChangeNotifierProxyProvider<Auth, MiscellaneousProvider>(
              create: null,
              update: (context, auth, oldItems) => MiscellaneousProvider(
                  auth.token, oldItems == null ? [] : oldItems.items)),
          ChangeNotifierProxyProvider<Auth, TasksProv>(
              create: null,
              update: (context, auth, oldTasks) => TasksProv(
                  auth.token, oldTasks == null ? [] : oldTasks.tasks)),
          ChangeNotifierProxyProvider<Auth, BudgetProv>(
              create: null,
              update: (context, auth, oldBudget) => BudgetProv(
                  auth.token,
                  oldBudget == null
                      ? {2: 0.0, 3: 0.0, 4: 0.0, 5: 0.0, 6: 0.0, 7: 0.0}
                      : oldBudget.budgets)),
          ChangeNotifierProxyProvider<Auth, ProviderModel>(
              create: null,
              update: (context, auth, oldTasks) => ProviderModel(auth.token)),
        ],
        child: Consumer<Auth>(
          builder: (ctx, auth, _) => MaterialApp(
            theme: ThemeData(fontFamily: 'Lato',),
            debugShowCheckedModeBanner: false,
            routes: {
              DepartmentScreen.routeName: (contex) => DepartmentScreen(),
              SettingScreen.routeName: (contex) => SettingScreen(),
              SteeringItemListScreen.routeName: (contex) =>
                  SteeringItemListScreen(),
              SuspensionItemListScreen.routeName: (contex) =>
                  SuspensionItemListScreen(),
              ExhaustItemListScreen.routeName: (contex) =>
                  ExhaustItemListScreen(),
              CoolingItemListScreen.routeName: (contex) =>
                  CoolingItemListScreen(),
              IntakeItemListScreen.routeName: (contex) =>
                  IntakeItemListScreen(),
              BrakesItemListScreen.routeName: (contex) =>
                  BrakesItemListScreen(),
              ElectronicsItemListScreen.routeName: (contex) =>
                  ElectronicsItemListScreen(),
              MiscellaneousItemListScreen.routeName: (contex) =>
                  MiscellaneousItemListScreen(),
              ChassisItemListScreen.routeName: (contex) =>
                  ChassisItemListScreen(),
              DriveTrainItemListScreen.routeName: (contex) =>
                  DriveTrainItemListScreen(),
              AboutUs.routeName: (contex) => AboutUs(),
              DeveloperScreen.routeName: (contex) => DeveloperScreen(),
            },
            home: auth.isAuth
                ? Splash()
                : FutureBuilder(
                    future: auth.tryAutoLogin(),
                    builder: (ctx, snapshot) =>
                        snapshot.connectionState == ConnectionState.waiting
                            ? Splash1()
                            : AuthScreen(),
                  ),
          ),
        ));
  }
}
