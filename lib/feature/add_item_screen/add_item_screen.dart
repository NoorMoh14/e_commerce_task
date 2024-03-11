import 'package:flutter/material.dart';
import '../../components/button_component.dart';
import '../../components/form_component.dart';
import '../../components/text_component.dart';

class AddItemScreen extends StatefulWidget {
  const AddItemScreen({Key? key}) : super(key: key);

  @override
  State<AddItemScreen> createState() => _AddItemScreenState();
}

class _AddItemScreenState extends State<AddItemScreen> {


  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, boxConstraints) {
        return Body(
          onPressAddItem: (){},
        );
      },
    );
  }
}

class Body extends StatelessWidget {

  void Function()? onPressAddItem;
  final TextEditingController? categoryController;
  final TextEditingController? priceController;
  final TextEditingController? titleController;
  final TextEditingController? descriptionController;
  final TextEditingController? imageController;

  Body({
    super.key,
    this.categoryController,
    this.titleController,
    this.priceController,
    this.descriptionController,
    this.imageController,
    this.onPressAddItem,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body:  SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 20,vertical: 60),
            child: Column(
              children: [
                Container(
                  alignment: Alignment.center,
                  margin: const EdgeInsets.only(top: 80,bottom: 30),
                  child: TextComponent(
                    text: "Add Item",
                    textStyle: Theme.of(context).textTheme.titleMedium,
                  ),
                ),
                FormComponent(
                  controller: titleController,
                  hintText: "write your title",
                  textInputType: TextInputType.text,
                ),
                FormComponent(
                  controller: descriptionController,
                  hintText: "write your description",
                  textInputType: TextInputType.text,
                ),
                FormComponent(
                  controller: categoryController,
                  hintText: "write your category",
                  textInputType: TextInputType.text,
                ),
                FormComponent(
                  controller: imageController,
                  hintText: "write your image link",
                  textInputType: TextInputType.text,
                ),
                FormComponent(
                  controller: priceController,
                  hintText: "write your price",
                  textInputType: TextInputType.number,
                ),
                const SizedBox(height: 30,),
                ButtonComponent(
                  onPress: onPressAddItem,
                  text: "Add product",
                  width: 330,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
