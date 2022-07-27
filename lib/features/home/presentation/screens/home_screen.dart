import 'package:flutter/material.dart';
import '../../../../core/core.export.dart';
import '../../home.export.dart';

class HomeScreen extends StatelessWidget {
   HomeScreen({Key? key}) : super(key: key);

  List<Widget> tabBar= [
    const ForEvaluatedScreen(),
    const OnGoingScreen(),
    const EvaluatedScreen(),
    const OthersScreen(),

  ];
  var controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black12,
      body: DefaultTabController(
        length: tabBar.length,
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              leading: IconButton(
                onPressed: () {},
                icon: const Icon(Icons.search,size: 28.0,),
              ),
              actions: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.sort,
                    size: 28.0,
                  ),
                ),
              ],
              backgroundColor: ColorHelper.primaryColor,
              bottom: TabBar(
                labelStyle: TextStyle(
                    fontSize: getScreenWidth(context) * 0.0274,
                    fontWeight: FontWeight.bold),
                tabs: const[
                  Tab(icon:Icon(Icons.post_add),text: 'ForEvaluation',),
                  Tab(icon:Icon(Icons.run_circle_outlined),text: 'On Going',),
                  Tab(icon:Icon(Icons.recommend),text: 'Evaluated',),
                  Tab(icon:Icon(Icons.folder_outlined),text: 'Others',),

                ],
              ),
            ),
            SliverFillRemaining(
              child: TabBarView(
                children:tabBar,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
