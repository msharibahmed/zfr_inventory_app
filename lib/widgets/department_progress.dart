import 'package:google_fonts/google_fonts.dart';

import '../main_imports.dart';

class DepartmentProgress extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final dep1aData = Provider.of<SteeringProvider>(context);
    final dep1bData = Provider.of<SuspensionProvider>(context);
    final dep2aData = Provider.of<ExhaustProvider>(context);
    final dep2bData = Provider.of<CoolingProvider>(context);
    final dep2cData = Provider.of<IntakeProvider>(context);
    final dep2dData = Provider.of<DriveTrainProvider>(context);
    final dep3Data = Provider.of<BrakesProvider>(context);
    final dep4Data = Provider.of<ChassisProvider>(context);
    final dep5Data = Provider.of<ElectronicsProvider>(context);
    final dep6Data = Provider.of<MiscellaneousProvider>(context);
    final budgetData = Provider.of<BudgetProv>(context);

    double wdth = MediaQuery.of(context).size.width * 1;

    double budget1 = budgetData.budgets.values.toList()[0];
    double totalCost1 = (dep1aData.totalItemCost + dep1bData.totalItemCost);
    double budget2 = budgetData.budgets.values.toList()[1];
    double totalCost2 = (dep2aData.totalItemCost +
        dep2bData.totalItemCost +
        dep2cData.totalItemCost +
        dep2dData.totalItemCost);
    double budget3 = budgetData.budgets.values.toList()[2];
    double totalCost3 = dep3Data.totalItemCost;
    double budget4 = budgetData.budgets.values.toList()[3];

    double totalCost4 = dep4Data.totalItemCost;

    double budget5 = budgetData.budgets.values.toList()[4];

    double totalCost5 = dep5Data.totalItemCost;
    double budget6 = budgetData.budgets.values.toList()[5];

    double totalCost6 = dep6Data.totalItemCost;
    const Divider dv = const Divider(
      color: Colors.white,
      endIndent: 10,
      indent: 10,
    );
    Column clmn(
      String name,
      double totalCost,
      double budget,
    ) {
      return Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 5.0, top: 5, right: 5),
            child: Row(
              children: [
                Text(name,
                    style: GoogleFonts.roboto(
                        textStyle: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.w400))),
                Spacer(),
                Text('Budget: \₹$budget', style: TextStyle(color: Colors.black))
              ],
            ),
          ),
          Stack(
            children: [
              Container(
                  margin: const EdgeInsets.all(10),
                  width: wdth,
                  height: 10,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Color(0xffede7f6))),
              Container(
                  margin: const EdgeInsets.all(10),
                  width: (totalCost) < budget
                      ? ((totalCost) / budget) * wdth
                      : wdth,
                  height: 10,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: totalCost < budget
                          ? Color(0xff00e676)
                          : Color(0xfff44336)))
            ],
          ),
          Text('\(${totalCost.toInt()}/${budget.toInt()})',
              textAlign: TextAlign.end,
              style: const TextStyle(
                  color: Color(0xffff8f00),
                  fontSize: 10,
                  fontWeight: FontWeight.bold))
        ],
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Text('Department Progress',
              style: GoogleFonts.openSans(
                  textStyle:
                      TextStyle(fontWeight: FontWeight.w600, fontSize: 18))),
        ),
        const Divider(
          color: Colors.black,
          height: 3,
          thickness: 1,
          indent: 5,
          endIndent: 200,
        ),
        Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          const Icon(
            Icons.brightness_1,
            color: Color(0xff00e676),
          ),
          const Text(
            'Less than Budget',
            style: TextStyle(fontWeight: FontWeight.w600),
          ),
          Icon(Icons.brightness_1, color: Color(0xfff44336)),
          const Text(
            'Exceeded Budget',
            style: TextStyle(fontWeight: FontWeight.w600),
          ),
          Consumer<Auth>(
            builder: (ctx, auth, _) => auth.email != null
                ? TextButton(
                    style: TextButton.styleFrom(
                        backgroundColor: Colors.black,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10))),
                    onPressed: () {
                      showModalBottomSheet(
                          context: context,
                          builder: (context) {
                            return HomeModalSheet();
                          });
                    },
                    child: const Text('Add Budget',
                        style: TextStyle(color: Colors.white)))
                : Text(''),
          )
        ]),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Card(
            elevation: 10,
            shadowColor: Colors.black,
            child: Container(
              // margin: EdgeInsets.all(5),
              width: double.infinity,
              decoration: BoxDecoration(
                  // border: Border.all(width: 2),
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  clmn('Vehicle Dynamics', totalCost1, budget1),
                  dv,
                  clmn('Power Train', totalCost2, budget2),
                  dv,
                  clmn('Brakes', totalCost3, budget3),
                  dv,
                  clmn('Chassis', totalCost4, budget4),
                  dv,
                  clmn('Electronics', totalCost5, budget5),
                  dv,
                  clmn('Miscellaneous', totalCost6, budget6),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
