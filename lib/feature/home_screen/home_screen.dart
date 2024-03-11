import 'package:beamer/beamer.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';
import 'package:task/components/text_component.dart';
import '../../helpers/short_term_manager.dart';
import 'home_screen_view_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    implements HomeScreenViewModelListeners {
  HomeScreenViewModel? vmProvider;

  @override
  void initState() {
    vmProvider = Provider.of<HomeScreenViewModel>(context, listen: false);
    vmProvider?.init(this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final vm = Provider.of<HomeScreenViewModel>(context);
    return LayoutBuilder(
      builder: (context, boxConstraints) {
        if(vm.isFinish!){
          return Body(
            itemsCount: vm.itemCount,
            products: vm.products,
            onPressAdd: () {
              context.beamToNamed('/add_item_screen',);
            },
          );
        }
        else{
          return const  Center(child: CircularProgressIndicator());
        }

      },
    );
  }
}

class Body extends StatelessWidget {

  List<Map<String, dynamic>>? products;
  void Function()? onPressAdd;
  int itemsCount;
  Body({
    super.key,
    required this.itemsCount,
    this.onPressAdd,
    this.products,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body:  GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 1,
            crossAxisSpacing: 10,
            childAspectRatio: 1 / 1.5,
          ),
          padding: EdgeInsets.symmetric(vertical: 20,horizontal: 20),
          itemCount: itemsCount,
          itemBuilder: (context, index) =>  Column(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 180,
                    width: 180,
                    padding: const EdgeInsets.all(25),
                    decoration: BoxDecoration(
                      border: Border.all(
                          width: 2, color: Colors.grey.shade200),
                      color: Colors.white,
                      borderRadius: const BorderRadius.all(
                          Radius.circular(20)),
                    ),
                    child: CachedNetworkImage(
                      imageUrl: products![index]["image"],
                      width: 240,
                      placeholder: (context, url) =>
                          Shimmer.fromColors(
                            baseColor: Colors.grey.shade300,
                            highlightColor:
                            Colors.grey.shade100,
                            child: Container(
                              decoration:  BoxDecoration(
                                color: Colors.amber,
                                borderRadius: BorderRadius.circular(50),
                              ),
                            ),
                          ),
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 2.5,
                    child: ListTile(
                      contentPadding:
                      const EdgeInsets.only(top: 10),
                      title: TextComponent(
                        text: products![index]["title"],
                        textAlign: TextAlign.left,
                      ),
                      subtitle: Padding(
                        padding: const EdgeInsets.only(top: 5),
                        child: Row(
                          mainAxisAlignment:
                          MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              '\$${products![index]["price"]}',
                              style: const TextStyle(
                                color: Colors.deepOrangeAccent,
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(width: 6,),
              Row(
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width /1.2,
                    child: ListTile(
                      contentPadding:
                      const EdgeInsets.only(top: 10),
                      title: TextComponent(
                        text: products![index]["description"],
                        textAlign: TextAlign.left,
                      ),
                      subtitle: Padding(
                        padding: const EdgeInsets.only(top: 5),
                        child: Row(
                          mainAxisAlignment:
                          MainAxisAlignment.spaceBetween,
                          children: [
                            TextComponent(
                              text: products![index]["category"],
                              textStyle: TextStyle(
                                color: Theme.of(context).colorScheme.error,
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),

            ],
          ),
        ),
        floatingActionButton: FloatingActionButton.extended(
          backgroundColor: Colors.white,
          onPressed: onPressAdd,
          label: const TextComponent(
            text:"Add",
            textStyle: TextStyle(
              color: Colors.blue,
              fontSize: 16,
            ),
          ),
          icon: const Icon(Icons.add,color: Colors.blue,),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      ),
    );
  }
}
