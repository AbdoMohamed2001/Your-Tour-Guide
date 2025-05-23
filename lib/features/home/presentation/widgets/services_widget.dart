import 'package:your_tour_guide/models/service_provider_model.dart';
import 'package:your_tour_guide/widgets/services_provider_item.dart';
import 'package:flutter/material.dart';

class ServicesWidget extends StatelessWidget {
  const ServicesWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      padding: const EdgeInsets.all(1),
      physics: NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 15,
        mainAxisSpacing: 10,
        childAspectRatio: 0.65 / .40,
      ),
      itemBuilder: (context, index) {
        return ServiceProviderItem(
          fileName: getServicesList(context)[index].fileName,
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return getServicesList(context)[index].pushedPage;
            }));
          },
          boxDecorationColor: getServicesList(context)[index].containerColor,
          text: getServicesList(context)[index].name,
        );
      },
      itemCount: getServicesList(context).length,
    );
  }
}
