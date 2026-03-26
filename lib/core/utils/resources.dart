enum ApiStatus { initial, loading, success, error }

class Resources<T> {
  T? data;
  late String? error;
  late bool? loading = false;
  late ApiStatus? status;
  Resources({this.data, this.error, this.loading, this.status});
  Resources.isSuucess(this.data) {
    status = ApiStatus.success;
  }
  Resources.isLoading() {
    status = ApiStatus.loading;
  }
  Resources.initials() {
    status = ApiStatus.initial;
  }
  Resources.isError(String this.error){
    status=ApiStatus.error;
  }
}
