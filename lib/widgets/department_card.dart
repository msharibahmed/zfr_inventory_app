import '../main_imports.dart';


class DepartmentCard extends StatelessWidget {
  final int index;

  DepartmentCard(this.index);
  @override
  Widget build(BuildContext context) {
    final steeringData = Provider.of<SteeringProvider>(context);
    final suspensionData = Provider.of<SuspensionProvider>(context);
    final coolingData = Provider.of<CoolingProvider>(context);
    final driveTrainData = Provider.of<DriveTrainProvider>(context);
    final exhaustData = Provider.of<ExhaustProvider>(context);
    final intakeData = Provider.of<IntakeProvider>(context);
    final brakesData = Provider.of<BrakesProvider>(context);
    final chassisData = Provider.of<ChassisProvider>(context);
    final electronicsData = Provider.of<ElectronicsProvider>(context);
    final miscellaneousData = Provider.of<MiscellaneousProvider>(context);

    const Map<String, List> departmentNames = {
      'Vehicle Dynamics': ['Steering', 'Suspension'],
      'Power Train': ['Cooling', 'Drive Train', 'Exhaust', 'Intake'],
      'Brakes': ['Cost of Brakes'],
      'Chassis': ['Cost of Chassis'],
      'Electronics': ['Cost of Electronics'],
      'Miscellaneous': ['Cost of Miscellaneous']
    };
    List<DepartmentModel> modelData = [
      DepartmentModel(
          name: 'Steering',
          routeName: SteeringItemListScreen.routeName,
          total: steeringData.totalItemCost.toStringAsFixed(2)),
      DepartmentModel(
          name: 'Suspension',
          routeName: SuspensionItemListScreen.routeName,
          total: suspensionData.totalItemCost.toStringAsFixed(2)),
      DepartmentModel(
          name: 'Cooling',
          routeName: CoolingItemListScreen.routeName,
          total: coolingData.totalItemCost.toStringAsFixed(2)),
      DepartmentModel(
          name: 'Drive Train',
          routeName: DriveTrainItemListScreen.routeName,
          total: driveTrainData.totalItemCost.toStringAsFixed(2)),
      DepartmentModel(
          name: 'Exhaust',
          routeName: ExhaustItemListScreen.routeName,
          total: exhaustData.totalItemCost.toStringAsFixed(2)),
      DepartmentModel(
          name: 'Intake',
          routeName: IntakeItemListScreen.routeName,
          total: intakeData.totalItemCost.toStringAsFixed(2)),
      DepartmentModel(
          name: 'Cost of Brakes',
          routeName: BrakesItemListScreen.routeName,
          total: brakesData.totalItemCost.toStringAsFixed(2)),
      DepartmentModel(
          name: 'Cost of Chassis',
          routeName: ChassisItemListScreen.routeName,
          total: chassisData.totalItemCost.toStringAsFixed(2)),
      DepartmentModel(
          name: 'Cost of Electronics',
          routeName: ElectronicsItemListScreen.routeName,
          total: electronicsData.totalItemCost.toStringAsFixed(2)),
      DepartmentModel(
          name: 'Cost of Miscellaneous',
          routeName: MiscellaneousItemListScreen.routeName,
          total: miscellaneousData.totalItemCost.toStringAsFixed(2)),
    ];
    const subDepartmentNumber = ['two', 'four', 'zero', 'zero', 'zero', 'zero'];
    const images = [
      'vehicledynamics',
      'powertrain',
      'brakes',
      'chassis',
      'electronics',
      'miscellaneous'
    ];
    return Card(
      color: Colors.blue[50],
      elevation: 10,
      child: ExpansionTile(
          leading: Image.asset('assets/images/${images[index]}.png'),
          subtitle: Text(
              'This has ' + subDepartmentNumber[index] + ' Sub Departments'),
          title: Text(
            departmentNames.keys.toList()[index],
            style: TextStyle(fontSize: 25),
          ),
          trailing: Icon(Icons.arrow_drop_down_circle),
          children: [
            ...(departmentNames.values.toList()[index]).map((e) {
              DepartmentModel value =
                  modelData.firstWhere((element) => e == element.name);
              const photo = {
                'Steering': 'steering',
                'Suspension': 'suspension',
                'Cooling': 'cooling',
                'Drive Train': 'drive_train',
                'Exhaust': 'exhaust',
                'Intake': 'intake',
                'Cost of Brakes': 'null',
                'Cost of Chassis': 'null',
                'Cost of Electronics': 'null',
                'Cost of Miscellaneous': 'null'
              };
              String cc;
              photo.forEach((key, value) {
                if (key == e) {
                  cc = value;
                }
              });
              return Card(
                  elevation: 3,
                  color: Colors.blue[100],
                  child: ListTile(
                    leading: Image.asset(
                      'assets/images/$cc.png',
                      width: 40,
                      height: 40,
                    ),
                    trailing: Chip(
                      backgroundColor: Colors.blue,
                      elevation: 5,
                      shadowColor: Colors.amber,
                      label: Text('\₹' + value.total,
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w600)),
                    ),
                    onTap: () {
                      Navigator.pushNamed(context, value.routeName);
                    },
                    title: Text(e, style: TextStyle(fontSize: 20)),
                  ));
            })
          ]),
    );
  }
}

class DepartmentModel {
  final String name;
  final String total;
  final String routeName;
  DepartmentModel({this.name, this.total, this.routeName});
}
