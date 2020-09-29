import 'package:google_fonts/google_fonts.dart';

import '../main_imports.dart';

class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
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
    Provider.of<TasksProv>(context, listen: false).fetch(context);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
            future: fetch(),
            builder: (ctx, snapshot) {
              if(snapshot.connectionState ==
                    ConnectionState.done){
                      return TabScreen();
                    }
                    else{
                      return Scaffold(
        backgroundColor: Colors.black,
        body: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset('assets/images/splash.gif'),
                        SizedBox(
                          height: 170,
                        ),
                        Text(
                          'Z       F       R',
                          style: TextStyle(color: Colors.white, fontSize: 25),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        CircularProgressIndicator(),
                        SizedBox(height:100),
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Align(alignment:Alignment.bottomRight,child: Text('Created By: Sharib Ahmed',style: GoogleFonts.raleway(textStyle:TextStyle(color: Colors.white, fontSize: 15)))),
                        )
                      ],
                    ),
                  ));
                    }} 
                );
  }
}
