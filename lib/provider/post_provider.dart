import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:json_crud/model/post_model.dart';
import 'package:json_crud/service/data_service.dart';

final postProvider =
    StateNotifierProvider<PostNotifier, List<PostModel>>((ref) {
  final dataService = ref.read(dataServiceProvider);
  return PostNotifier(dataService);
});

class PostNotifier extends StateNotifier<List<PostModel>> {
  final DataService _dataService;

  PostNotifier(this._dataService) : super([]) {
    getReadPost();
  }

  Future getReadPost() async {
    var newState = await _dataService.readPost();
    if (mounted) {
      state = newState;
    }
  }
}