import 'package:akash/app/interfaces/model.dart';
import 'package:akash/app/interfaces/provider.dart';
import 'package:get/get.dart';

abstract class Repository<T extends Model> extends Provider<T> {
  Repository({required super.path});

  @override
  Future insert(T value) async {
    await post('/', value.toMap());
  }

  @override
  Future<List<T>> fetch({
    int limit = 100,
    int offset = 0,
    Map<String, dynamic> queries = const {},
  }) async {
    String query = queries.entries
        .map((entry) => "${entry.key}=${entry.value}")
        .toList()
        .join("&");
    Response response = await get('/?$query', headers: {
      "limit": limit.toString(),
      "offset": offset.toString(),
    });
    List data = response.body["data"];
    return data.map<T>((map) => converter(map)).toList();
  }

  @override
  Future<T> fetchOne(int id) async {
    Response response = await get('/$id');
    return converter(response.body["data"]);
  }

  @override
  Future update(T value) async {
    await put('/${value.id}', value.toMap());
  }

  @override
  Future destroy(T value) async {
    await delete('/${value.id}');
  }

  @override
  Future destroyMany(List<int> ids) async {
    List<String> idsString = ids.map((id) => id.toString()).toList();
    await delete('/', query: {'ids': idsString});
  }

  T converter(Map<String, dynamic> map);
}
