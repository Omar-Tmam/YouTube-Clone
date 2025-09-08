import 'package:flutter/material.dart';
import 'package:youtube_clone/Core/utils/app_styles.dart';
import 'package:youtube_clone/Core/widgets/custom_text.dart';
import 'package:youtube_clone/Features/home_view/data/models/search_model/search_model.dart';
import 'package:youtube_clone/Features/home_view/presentation/views/widgets/video_info.dart';

class VideoItem extends StatelessWidget {
  const VideoItem({super.key, required this.searchModel, required this.index});
  final SearchModel searchModel;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Image.network(searchModel.items?[index].thumbnails?[1].url ?? ''),
              Positioned(
                bottom: 5,
                right: 10,
                child: Container(
                  color: Colors.black12,
                  child: CustomText(
                    fontWeight: AppStyles.styleSemiBold22(context).fontWeight,
                    color: Colors.black,
                    fontSize: AppStyles.styleSemiBold18(context).fontSize,
                    title: searchModel.items?[index].lengthText ?? '',
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          VideoInfo(
            index: index,
            searchModel: searchModel,
          ),
          Divider(
            color: Colors.white,
          )
        ],
      ),
    );
  }
}
