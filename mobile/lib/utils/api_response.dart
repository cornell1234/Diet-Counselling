class ApiResponse<D> {
  Status? status;
  D? data;
  String? message;

  ApiResponse.loading(this.message) : status = Status.LOADING;
  ApiResponse.completed(this.message) : status = Status.COMPLETED;
  ApiResponse.error(this.message) : status = Status.ERROR;

  @override
  String toString() {
    return 'status : $status \n Message : $message \n Data : $data';
  }
}

enum Status { LOADING, COMPLETED, ERROR }
