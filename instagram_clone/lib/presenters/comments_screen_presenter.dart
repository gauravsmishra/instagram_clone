import 'package:instagram_clone/models/comments_model.dart';
import 'package:instagram_clone/models/posts_models.dart';
import 'package:instagram_clone/services/webservice.dart';

abstract class CommentsScreenContract {
  void onGetCommentsSuccess(List<CommentsModel> model);

  void onGetError(Object errorTxt);
}

class CommentsScreenPresenter {
  CommentsScreenContract _view;
  RestDatasource api = new RestDatasource();

  CommentsScreenPresenter(this._view);

  getComments() async {
    api.getCommentsServices().then((List<CommentsModel> model) {
      try {
        _view.onGetCommentsSuccess(model);
      } catch (e) {
        _view.onGetError(e);
      }
    });
  }
}
