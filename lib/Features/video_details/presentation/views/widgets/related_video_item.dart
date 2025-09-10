import 'package:flutter/material.dart';

import 'package:youtube_clone/Core/utils/app_styles.dart';
import 'package:youtube_clone/Core/widgets/custom_text.dart';


class RelatedVideoItem extends StatelessWidget {
  const RelatedVideoItem({
    super.key,
  });

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
                      'https://yt3.ggpht.com/Bg5wS82KGryRmcsn1YbPThtbXoTmj2XJ9_7LmuE2RF6wbKJBkovfRypbSz6UD3gEu_nHiwGZtQ=s88-c-k-c0x00ffffff-no-rj')),
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
