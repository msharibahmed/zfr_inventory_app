import 'package:flutter/material.dart';
import 'package:zfr_inventory_app/main_imports.dart';

import 'home_modal_sheet.dart';

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

    double wdth = MediaQuery.of(context).size.width * 1;

    double budget1 = 6000.0;
    double totalCost1 = (dep1aData.totalItemCost + dep1bData.totalItemCost);
    double budget2 = 5000;
    double totalCost2 = (dep2aData.totalItemCost +
        dep2bData.totalItemCost +
        dep2cData.totalItemCost +
        dep2dData.totalItemCost);
    double budget3 = 4000;
    double totalCost3 = dep3Data.totalItemCost;
    double budget4 = 3000;

    double totalCost4 = dep4Data.totalItemCost;

    double budget5 = 2000;

    double totalCost5 = dep5Data.totalItemCost;
    double budget6 = 1000;

    double totalCost6 = dep6Data.totalItemCost;
    Divider dv = Divider(
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
                Text(name, style: TextStyle(color: Colors.white)),
                Spacer(),
                Text('Budget: \$$budget', style: TextStyle(color: Colors.white))
              ],
            ),
          ),
          Stack(
            children: [
              Container(
                  margin: EdgeInsets.all(10),
                  width: wdth,
                  height: 10,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Colors.white)),
              Container(
                  margin: EdgeInsets.all(10),
                  width: (totalCost) < budget
                      ? ((totalCost) / budget) * wdth
                      : wdth,
                  height: 10,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: totalCost < budget ? Colors.green : Colors.red))
            ],
          ),
          Text('\(${totalCost.toInt()}/${budget.toInt()})',
              textAlign: TextAlign.end,
              style: TextStyle(
                  color: Colors.amber,
                  fontSize: 10,
                  fontWeight: FontWeight.bold))
        ],
      );
    }

    return Expanded(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Text(
            'Department Progress',
            style: TextStyle(fontWeight: FontWeight.w600),
          ),
        ),
        Divider(
          height: 3,
          indent: 5,
          endIndent: 240,
        ),
        Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          Icon(
            Icons.brightness_1,
            color: Colors.green,
          ),
          Text(
            'Less than Budget',
            style: TextStyle(fontWeight: FontWeight.w600),
          ),
          Icon(Icons.brightness_1, color: Colors.red),
          Text(
            'Exceeded Budget',
            style: TextStyle(fontWeight: FontWeight.w600),
          ),
          FlatButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              padding: EdgeInsets.all(0.0),
              color: Color(0xff232d37),
              onPressed: () {
                showModalBottomSheet(
                    context: context,
                    builder: (context) {
                      return HomeModalSheet();
                    });
              },
              child: Text('Add Budget', style: TextStyle(color: Colors.white)))
        ]),
        Expanded(
          child: Container(
              margin: EdgeInsets.all(5),
              width: double.infinity,
              decoration: BoxDecoration(
                  border: Border.all(width: 2),
                  borderRadius: BorderRadius.circular(5),
                  color: Color(0xff232d37)),
              child: SingleChildScrollView(
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
              )),
        ),
      ],
    ));
  }
}
