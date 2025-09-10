import 'package:flutter/material.dart';

import 'package:youtube_clone/Core/utils/app_styles.dart';
import 'package:youtube_clone/Core/widgets/custom_text.dart';
import 'package:youtube_clone/Features/video_details/data/models/related_model/related_model.dart';

class RelatedVideoItem extends StatelessWidget {
  const RelatedVideoItem({
    super.key,
    required this.index,
    required this.relatedModel,
  });
  final int index;
  final RelatedModel relatedModel;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              GestureDetector(
                  onTap: () {},
                  child: Image.network(
                      relatedModel.items?[index].thumbnails?[1].url ?? '')),
              Positioned(
                bottom: 5,
                right: 10,
                child: Container(
                  color: Colors.black12,
                  child: CustomText(
                    fontWeight: AppStyles.styleSemiBold22(context).fontWeight,
                    color: Colors.black,
                    fontSize: AppStyles.styleSemiBold18(context).fontSize,
                    title: '',
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Divider(
            color: Colors.white,
          )
        ],
      ),
    );
  }
}
