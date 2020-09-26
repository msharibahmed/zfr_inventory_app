import '../main_imports.dart';


class HomeScreen extends StatefulWidget {
  static const routeName = 'home-screen';
  final bool button;
  HomeScreen(this.button);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Future<void> fetch() async {
      final budget = Provider.of<BudgetProv>(context, listen: false);
      await Provider.of<SteeringProvider>(context, listen: false)
          .fetchItems(context);
      await Provider.of<SuspensionProvider>(context, listen: false)
          .fetchItems(context);
      await Provider.of<ExhaustProvider>(context, listen: false)
          .fetchItems(context);
      await Provider.of<CoolingProvider>(context, listen: false)
          .fetchItems(context);
      await Provider.of<IntakeProvider>(context, listen: false)
          .fetchItems(context);
      await Provider.of<DriveTrainProvider>(context, listen: false)
          .fetchItems(context);
      await Provider.of<BrakesProvider>(context, listen: false)
          .fetchItems(context);
      await Provider.of<ChassisProvider>(context, listen: false)
          .fetchItems(context);
      await Provider.of<ElectronicsProvider>(context, listen: false)
          .fetchItems(context);
      await Provider.of<MiscellaneousProvider>(context, listen: false)
          .fetchItems(context);

      await budget.fetchBudget(2);
      await budget.fetchBudget(3);
      await budget.fetchBudget(4);
      await budget.fetchBudget(5);
      await budget.fetchBudget(6);
      await budget.fetchBudget(7);
    }
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body:Column(
                  children: [
                    widget.button ? DepartmentChart() : LineChartSample2(),
                    DepartmentProgress()
                  ],
                ));
  }
}
//  FutureBuilder(
//             future: fetch(),
//             builder: (ctx, snap) {
//               if (snap.connectionState == ConnectionState.done) {
//                 return Column(
//                   children: [
//                     widget.button ? DepartmentChart() : LineChartSample2(),
//                     DepartmentProgress()
//                   ],
//                 );
//               } else {
//                 return Center(
//                   child: CircularProgressIndicator(),
//                 );
//               }
//             })