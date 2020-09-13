import 'package:zfr_inventory_app/provider/other/budget.dart';

import 'main_imports.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<SteeringProvider>(
            create: (_) => SteeringProvider()),
        ChangeNotifierProvider<SuspensionProvider>(
            create: (_) => SuspensionProvider()),
        ChangeNotifierProvider<ExhaustProvider>(
            create: (_) => ExhaustProvider()),
        ChangeNotifierProvider<CoolingProvider>(
            create: (_) => CoolingProvider()),
        ChangeNotifierProvider<DriveTrainProvider>(
            create: (_) => DriveTrainProvider()),
        ChangeNotifierProvider<IntakeProvider>(create: (_) => IntakeProvider()),
        ChangeNotifierProvider<BrakesProvider>(create: (_) => BrakesProvider()),
        ChangeNotifierProvider<ElectronicsProvider>(
            create: (_) => ElectronicsProvider()),
        ChangeNotifierProvider<ChassisProvider>(
            create: (_) => ChassisProvider()),
        ChangeNotifierProvider<MiscellaneousProvider>(
            create: (_) => MiscellaneousProvider()),
        ChangeNotifierProvider<BudgetProv>(
            create: (_) => BudgetProv())
      ],
      child: MaterialApp(
        theme: ThemeData(primarySwatch: Colors.amber,
          accentColor: Colors.deepOrange,
          textTheme: GoogleFonts.openSansTextTheme(
            Theme.of(context).textTheme,
          ),
        ),
        home: HomeScreen(),
        routes: {
          HomeScreen.routeName: (contex) => HomeScreen(),
          DepartmentScreen.routeName: (contex) => DepartmentScreen(),
          SettingScreen.routeName: (contex) => SettingScreen(),
          SteeringItemListScreen.routeName: (contex) =>
              SteeringItemListScreen(),
          SuspensionItemListScreen.routeName: (contex) =>
              SuspensionItemListScreen(),
          ExhaustItemListScreen.routeName: (contex) => ExhaustItemListScreen(),
          CoolingItemListScreen.routeName: (contex) => CoolingItemListScreen(),
          IntakeItemListScreen.routeName: (contex) => IntakeItemListScreen(),
          BrakesItemListScreen.routeName: (contex) => BrakesItemListScreen(),
          ElectronicsItemListScreen.routeName: (contex) =>
              ElectronicsItemListScreen(),
          MiscellaneousItemListScreen.routeName: (contex) =>
              MiscellaneousItemListScreen(),
          ChassisItemListScreen.routeName: (contex) => ChassisItemListScreen(),
          DriveTrainItemListScreen.routeName: (contex) =>
              DriveTrainItemListScreen(),
        },
      ),
    );
  }
}
