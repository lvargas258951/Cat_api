import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../Controllers/details_controller.dart';
import '../Models/Network/colors.dart';
import '../Models/Network/common.dart';
import 'package:skeletons/skeletons.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DetailController>(
      init: DetailController(),
      builder: (_) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Detalles'),
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 20,
              horizontal: 20,
            ),
            child: Skeleton(
              skeleton: SkeletonListView(),
              isLoading: _.isLoading,
              child: Card(
                elevation: 5,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Raza:  ${_.catDetail?.breeds.first.name ?? ''}',
                        style: Theme.of(Get.context!).textTheme.bodyLarge,
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      Center(
                        child: Image.network(
                          '${Common().baseUrlImageCats}${_.catDetail?.breeds.first.referenceImageId ?? _.idCat}.jpg',
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
                            'Pais Origen: ${_.catDetail?.breeds.first.origin ?? ''}',
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
                            'Inteligencia: ${_.catDetail?.breeds.first.intelligence ?? ''}',
                            style: Theme.of(Get.context!).textTheme.bodyLarge,
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      Text(
                        'Tiempo de vida: ${_.catDetail?.breeds.first.lifeSpan ?? ''}',
                        style: Theme.of(Get.context!).textTheme.bodyLarge,
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      Text(
                        'Temperamento: ${_.catDetail?.breeds.first.temperament ?? ''}',
                        style: Theme.of(Get.context!).textTheme.bodyLarge,
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      Expanded(
                          child: SingleChildScrollView(
                        child: Text(
                          'Descripción: ${_.catDetail?.breeds.first.description ?? ''}',
                          style: Theme.of(Get.context!).textTheme.bodyLarge,
                        ),
                      )),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
