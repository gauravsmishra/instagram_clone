import 'package:instagram_clone/models/comments_model.dart';
import 'package:instagram_clone/models/posts_models.dart';
import 'package:instagram_clone/services/webservice.dart';

abstract class HomeScreenContract {
  void onGetPostsSuccess(List<PostsModel> model);

  void onGetError(Object errorTxt);
}

class HomeScreenPresenter {
  HomeScreenContract _view;
  RestDatasource api = new RestDatasource();

  HomeScreenPresenter(this._view);

  getPosts() async {
    api.getPostsServices().then((List<PostsModel> model) {
      try {
        _view.onGetPostsSuccess(model);
      } catch (e) {
        _view.onGetError(e);
      }
    });
  }
}
