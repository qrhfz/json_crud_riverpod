import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:json_crud/model/post_model.dart';
import 'package:json_crud/service/data_service.dart';

final postProvider =
    StateNotifierProvider<PostNotifier, AsyncValue<List<PostModel>>>((ref) {
  final dataService = ref.read(dataServiceProvider);
  return PostNotifier(dataService);
});

class PostNotifier extends StateNotifier<AsyncValue<List<PostModel>>> {
  final DataService _dataService;

  PostNotifier(this._dataService) : super(AsyncValue.data([])) {
    getReadPost();
  }

  Future getReadPost() async {
    state = AsyncValue.loading();

    try {
      var newState = await _dataService.readPost();

      if (mounted && newState.isNotEmpty) {
        state = AsyncValue.data([...newState]);
      }
    } on CustomException catch (e) {
      state = AsyncValue.error(e.message);
    }
  }
}
