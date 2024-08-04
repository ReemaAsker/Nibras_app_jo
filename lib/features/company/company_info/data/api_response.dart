class ApiResponse<T> {
  DataStatus status;
  T? data;
  String? message;

  ApiResponse.loading(this.message) : status = DataStatus.LOADING;
  ApiResponse.completed(this.data) : status = DataStatus.COMPLETED;
  ApiResponse.error(this.message) : status = DataStatus.ERROR;

  @override
  String toString() {
    return "Status : $status \n Message : $message \n Data : $data";
  }
}

enum DataStatus { LOADING, COMPLETED, ERROR }
