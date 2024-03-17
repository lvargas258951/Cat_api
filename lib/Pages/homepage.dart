import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:skeletons/skeletons.dart';
import '../Controllers/home_controller.dart';
import '../Delegate/search_breeds.dart';
import '../Models/Network/colors.dart';
import '../Models/Network/common.dart';
import '../Models/breeds.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      init: HomeController(),
      builder: (_) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Raza de los gatos'),
            actions: [
              IconButton(
                  onPressed: () {
                    showSearch(
                      context: context,
                      delegate: CatSearchDelegate(cats: _.myListBreeds),
                    );
                  },
                  icon: const Icon(Icons.search))
            ],
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 20,
              horizontal: 20,
            ),
            child: Skeleton(
              skeleton: SkeletonListView(),
              isLoading: _.isLoading,
              child: ListView.builder(
                itemCount: _.myListBreeds.length,
                itemBuilder: (context, index) {
                  CatBreeds gatos = _.myListBreeds[index];
                  return _buildCards(index + 1, gatos, _);
                },
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildCards(int index, CatBreeds catbreeds, HomeController _) {
    return InkWell(
      onTap: () {
        _.goToDetail(catbreeds.referenceImageId ?? '');
      },
      child: Card(
        elevation: 5,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Raza:  ${catbreeds.name}',
                style: Theme.of(Get.context!).textTheme.bodyLarge,
              ),
              const SizedBox(
                height: 12,
              ),
              Center(
                child: Image.network(
                  '${Common().baseUrlImageCats}${catbreeds.referenceImageId}.jpg',
                  height: 180,
                  fit: BoxFit.scaleDown,
                  loadingBuilder: (BuildContext context, Widget child,
                      ImageChunkEvent? loadingProgress) {
                    if (loadingProgress == null) return child;
                    return Swing(
                      infinite: true,
                      child: Center(
                        heightFactor: 2,
                        child: Image.network(
                          Common().baseUrlLoadingCats,
                          color: CAColors.red,
                          width: 70,
                        ),
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Text(
                    'Pais Origen: ${catbreeds.origin}',
                    style: Theme.of(Get.context!).textTheme.bodyLarge,
                  ),
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Text(
                    'Inteligencia: ${catbreeds.intelligence}',
                    style: Theme.of(Get.context!).textTheme.bodyLarge,
                  ),
                ],
              ),
              const SizedBox(
                height: 12,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
