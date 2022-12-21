import 'package:algoriza_task/model/Coffee.dart';
import 'package:algoriza_task/routes/coffee/widget/coffee_item.dart';
import 'package:algoriza_task/viewModel/coffee_view_model.dart';
import 'package:algoriza_task/widgets/loader_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CoffeeRoute extends ConsumerWidget {
  const CoffeeRoute({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final CoffeeViewModel coffeeViewModel = ref.watch(coffeeProvider);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Coffee list'),
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          coffeeViewModel.getCoffeeData(refresh: true);
        },
        child: coffeeViewModel.isLoading
            ? const LoaderWidget()
            : ListView.builder(
                itemCount: coffeeViewModel.coffeeList.length,
                itemBuilder: (BuildContext context, int index) {
                  final Coffee coffee = coffeeViewModel.coffeeList[index];
                  return CoffeeItem(coffee: coffee);
                },
              ),
      ),
    );
  }
}
