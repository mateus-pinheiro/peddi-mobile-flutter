class ResponseErrorSendProduct {
  final int cloudId;
  final String mgmtId;
  final String message;

  ResponseErrorSendProduct({this.cloudId, this.mgmtId, this.message});

  ResponseErrorSendProduct.fromJson(Map<String, dynamic> data)
      : cloudId = data['cloud_id'],
        mgmtId = data['mgmt_id'],
        message = data['message'];
}
