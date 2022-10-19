import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movie_list/models/movie_data_model.dart';
import 'package:movie_list/util/app_constants.dart';
import 'package:movie_list/util/styles.dart';

class ListItemView extends StatelessWidget {
  final AnimationController animationController;
  final Animation<dynamic> animation;
  final MovieResults modelData;

  const ListItemView(
      {Key key, this.animationController, this.animation, this.modelData})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      width: double.infinity,
      padding: EdgeInsets.all(20),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          CachedNetworkImage(
            imageUrl: AppConstants.IMAGE_BASE_PATH + modelData.posterPath,
            imageBuilder: (context, imageProvider) => Container(
              width: 80.0,
              height: 80.0,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(image: imageProvider, fit: BoxFit.cover),
              ),
            ),
            placeholder: (context, url) => Container(
              child: Center(child: CircularProgressIndicator()),
              width: 80.0,
              height: 80.0,
            ),
            errorWidget: (context, url, error) => Icon(Icons.error),
          ),
          SizedBox(
            width: 16,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                SizedBox(
                  height: 6,
                ),
                Text(
                  modelData.title == null ? modelData.name : modelData.title,
                  maxLines: 2,
                  style: poppinsMedium,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(
                  height: 6,
                ),
                Text(
                  modelData.overview,
                  maxLines: 4,
                  overflow: TextOverflow.ellipsis,
                  style: poppinsRegular,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
