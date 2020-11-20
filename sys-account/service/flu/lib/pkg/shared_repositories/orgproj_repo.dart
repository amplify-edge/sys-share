import 'dart:convert';

import 'package:sys_core/sys_core.dart';
import 'package:sys_share_sys_account_service/rpc/v2/google/protobuf/empty.pb.dart';
import 'package:sys_share_sys_account_service/sys_share_sys_account_service.dart'
    as rpc;
import 'package:fixnum/fixnum.dart';
import 'package:meta/meta.dart';
import 'dart:io';
import 'package:sys_share_sys_account_service/pkg/shared_repositories/auth_repo.dart';

class OrgProjRepo {
  static Future<rpc.ListResponse> listUserOrgs(
      {Int64 currentPageId = Int64.ZERO,
      String orderBy,
      int perPageEntries = 10,
      Map<String, dynamic> filters,
      bool isDescending = false}) async {
    final ppe = Int64(perPageEntries);
    final req = rpc.ListRequest()
      ..perPageEntries = ppe
      ..currentPageId = currentPageId.toString()
      ..orderBy = orderBy
      ..isDescending = isDescending;

    if (filters != null) {
      final jstring = jsonEncode(filters);
      final jbytes = utf8.encode(jstring);
      req..filters = jbytes;
    }

    try {
      final client = await orgProjectServiceClient();
      final resp = await client
          .listOrg(req, options: await getCallOptions())
          .then((res) {
        return res;
      });
      return resp;
    } catch (e) {
      throw e;
    }
  }

  static Future<rpc.ListResponse> listUserProjects({
    String orderBy,
    int perPageEntries = 10,
    bool isDescending = false,
    Int64 currentPageId = Int64.ZERO,
    Map<String, dynamic> filters,
  }) async {
    final ppe = Int64(perPageEntries);
    final req = rpc.ListRequest()
      ..perPageEntries = ppe
      ..currentPageId = currentPageId.toString()
      ..orderBy = orderBy
      ..isDescending = isDescending;

    if (filters != null) {
      final jstring = jsonEncode(filters);
      final jbytes = utf8.encode(jstring);
      req..filters = jbytes;
    }

    try {
      final client = await orgProjectServiceClient();
      final resp = await client
          .listProject(req, options: await getCallOptions())
          .then((res) {
        return res;
      });
      return resp;
    } catch (e) {
      throw e;
    }
  }

  static Future<rpc.Project> newProject(
      {@required String name,
      File logoUpload,
      String creatorId,
      @required orgId}) async {
    final req = rpc.ProjectRequest()
      ..orgId = orgId
      ..name = name
      ..creatorId = creatorId;

    if (logoUpload != null) {
      req
        ..logoFilepath = logoUpload.absolute.path
        ..logoUploadBytes = logoUpload.readAsBytesSync();
    }
    try {
      final client = await orgProjectServiceClient();
      final resp =
          await client.newProject(req, options: await getCallOptions());
      return resp;
    } catch (e) {
      throw e;
    }
  }

  static Future<rpc.Org> newOrg(
      {@required String name,
      File logoUpload,
      String creatorId,
      String contact}) async {
    final req = rpc.OrgRequest()
      ..creatorId = creatorId
      ..name = name
      ..contact = contact;

    if (logoUpload != null) {
      req
        ..logoUploadBytes = logoUpload.readAsBytesSync()
        ..logoFilepath = logoUpload.absolute.path;
    }

    try {
      final client = await orgProjectServiceClient();
      final resp = await client.newOrg(req, options: await getCallOptions());
      return resp;
    } catch (e) {
      throw e;
    }
  }

  static Future<rpc.Org> getOrg({@required String id}) async {
    final req = rpc.IdRequest()..id = id;

    try {
      final client = await orgProjectServiceClient();
      final resp = await client.getOrg(req, options: await getCallOptions());
      return resp;
    } catch (e) {
      throw e;
    }
  }

  static Future<rpc.Project> getProject({@required String id}) async {
    final req = rpc.IdRequest()..id = id;

    try {
      final client = await orgProjectServiceClient();
      final resp =
          await client.getProject(req, options: await getCallOptions());
      return resp;
    } catch (e) {
      throw e;
    }
  }

  static Future<rpc.Project> updateProject(
      {@required String id, String name, File logoUpload}) async {
    final req = rpc.ProjectUpdateRequest()
      ..id = id
      ..name = name;

    if (logoUpload != null) {
      req
        ..logoUploadBytes = logoUpload.readAsBytesSync()
        ..logoFilepath = logoUpload.absolute.path;
    }
    try {
      final client = await orgProjectServiceClient();
      final resp =
          await client.updateProject(req, options: await getCallOptions());
      return resp;
    } catch (e) {
      throw e;
    }
  }

  static Future<rpc.Org> updateOrg(
      {@required String id,
      String name,
      File logoUpload,
      String contact}) async {
    final req = rpc.OrgUpdateRequest()
      ..id = id
      ..contact = contact
      ..name = name;

    if (logoUpload != null) {
      req
        ..logoUploadBytes = logoUpload.readAsBytesSync()
        ..logoFilepath = logoUpload.absolute.path;
    }

    try {
      final client = await orgProjectServiceClient();
      final resp = await client.updateOrg(req, options: await getCallOptions());
      return resp;
    } catch (e) {
      throw e;
    }
  }

  static Future<Empty> deleteProject({@required String id}) async {
    final req = rpc.IdRequest()..id = id;

    try {
      final client = await orgProjectServiceClient();
      final resp =
          await client.deleteProject(req, options: await getCallOptions());
      return resp;
    } catch (e) {
      throw e;
    }
  }

  static Future<Empty> deleteOrg({@required String id}) async {
    final req = rpc.IdRequest()..id = id;

    try {
      final client = await orgProjectServiceClient();
      final resp = await client.deleteOrg(req, options: await getCallOptions());
      return resp;
    } catch (e) {
      throw e;
    }
  }

  static Future<rpc.OrgProjServiceClient> orgProjectServiceClient() async {
    return rpc.OrgProjServiceClient(await BaseRepo.grpcWebClientChannel());
  }
}
