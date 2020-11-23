///
//  Generated code. Do not modify.
//  source: sys_core_file_services.proto
//
// @dart = 2.3
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:async' as $async;

import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'sys_core_models.pb.dart' as $1;
export 'sys_core_file_services.pb.dart';

class FileServiceClient extends $grpc.Client {
  static final _$upload =
      $grpc.ClientMethod<$1.FileUploadRequest, $1.FileUploadResponse>(
          '/v2.sys_core.services.FileService/Upload',
          ($1.FileUploadRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $1.FileUploadResponse.fromBuffer(value));
  static final _$download =
      $grpc.ClientMethod<$1.FileDownloadRequest, $1.FileDownloadResponse>(
          '/v2.sys_core.services.FileService/Download',
          ($1.FileDownloadRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $1.FileDownloadResponse.fromBuffer(value));

  FileServiceClient($grpc.ClientChannel channel,
      {$grpc.CallOptions options,
      $core.Iterable<$grpc.ClientInterceptor> interceptors})
      : super(channel, options: options, interceptors: interceptors);

  $grpc.ResponseFuture<$1.FileUploadResponse> upload(
      $async.Stream<$1.FileUploadRequest> request,
      {$grpc.CallOptions options}) {
    return $createStreamingCall(_$upload, request, options: options).single;
  }

  $grpc.ResponseStream<$1.FileDownloadResponse> download(
      $1.FileDownloadRequest request,
      {$grpc.CallOptions options}) {
    return $createStreamingCall(
        _$download, $async.Stream.fromIterable([request]),
        options: options);
  }
}

abstract class FileServiceBase extends $grpc.Service {
  $core.String get $name => 'v2.sys_core.services.FileService';

  FileServiceBase() {
    $addMethod($grpc.ServiceMethod<$1.FileUploadRequest, $1.FileUploadResponse>(
        'Upload',
        upload,
        true,
        false,
        ($core.List<$core.int> value) => $1.FileUploadRequest.fromBuffer(value),
        ($1.FileUploadResponse value) => value.writeToBuffer()));
    $addMethod(
        $grpc.ServiceMethod<$1.FileDownloadRequest, $1.FileDownloadResponse>(
            'Download',
            download_Pre,
            false,
            true,
            ($core.List<$core.int> value) =>
                $1.FileDownloadRequest.fromBuffer(value),
            ($1.FileDownloadResponse value) => value.writeToBuffer()));
  }

  $async.Stream<$1.FileDownloadResponse> download_Pre($grpc.ServiceCall call,
      $async.Future<$1.FileDownloadRequest> request) async* {
    yield* download(call, await request);
  }

  $async.Future<$1.FileUploadResponse> upload(
      $grpc.ServiceCall call, $async.Stream<$1.FileUploadRequest> request);
  $async.Stream<$1.FileDownloadResponse> download(
      $grpc.ServiceCall call, $1.FileDownloadRequest request);
}
