import 'package:sys_core/sys_core.dart';
import 'package:sys_share_sys_account_service/rpc/v2/google/protobuf/empty.pb.dart';
import 'package:sys_share_sys_account_service/sys_share_sys_account_service.dart'
    as rpc;
import 'package:fixnum/fixnum.dart';
import 'package:meta/meta.dart';

class OrgProjRepo {
  static Future<rpc.ListResponse> listUserOrgs(
      {String currentPageId = '0',
      String orderBy,
      int perPageEntries = 10,
      bool isDescending = false}) async {
    final ppe = Int64(perPageEntries);
    final req = rpc.ListRequest()
      ..perPageEntries = ppe
      ..currentPageId = currentPageId
      ..orderBy = orderBy
      ..isDescending = isDescending;

    try {
      final resp = await orgProjectServiceClient()
          .listOrg(req, options: await getCallOptions())
          .then((res) {
        return res;
      });
      return resp;
    } catch (e) {
      throw e;
    }
  }

  static Future<rpc.ListResponse> listUserProjects(
      {String currentPageId = '0',
      String orderBy,
      int perPageEntries = 10,
      bool isDescending = false}) async {
    final ppe = Int64(perPageEntries);
    final req = rpc.ListRequest()
      ..perPageEntries = ppe
      ..currentPageId = currentPageId
      ..orderBy = orderBy
      ..isDescending = isDescending;

    try {
      final resp = await orgProjectServiceClient()
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
      String logoUrl,
      String creatorId,
      @required orgId}) async {
    final req = rpc.ProjectRequest()
      ..orgId = orgId
      ..name = name
      ..logoUrl = logoUrl
      ..creatorId = creatorId;

    try {
      final resp = await orgProjectServiceClient()
          .newProject(req, options: await getCallOptions());
      return resp;
    } catch (e) {
      throw e;
    }
  }

  static Future<rpc.Org> newOrg(
      {@required String name,
      String logoUrl,
      String creatorId,
      String contact}) async {
    final req = rpc.OrgRequest()
      ..creatorId = creatorId
      ..logoUrl = logoUrl
      ..name = name
      ..contact = contact;

    try {
      final resp = await orgProjectServiceClient()
          .newOrg(req, options: await getCallOptions());
      return resp;
    } catch (e) {
      throw e;
    }
  }

  static Future<rpc.Org> getOrg({@required String id}) async {
    final req = rpc.IdRequest()..id = id;

    try {
      final resp = await orgProjectServiceClient()
          .getOrg(req, options: await getCallOptions());
      return resp;
    } catch (e) {
      throw e;
    }
  }

  static Future<rpc.Project> getProject({@required String id}) async {
    final req = rpc.IdRequest()..id = id;

    try {
      final resp = await orgProjectServiceClient()
          .getProject(req, options: await getCallOptions());
      return resp;
    } catch (e) {
      throw e;
    }
  }

  static Future<rpc.Project> updateProject(
      {@required String id, String name, String logoUrl}) async {
    final req = rpc.ProjectUpdateRequest()
      ..id = id
      ..logoUrl = logoUrl
      ..name = name;

    try {
      final resp = await orgProjectServiceClient()
          .updateProject(req, options: await getCallOptions());
      return resp;
    } catch (e) {
      throw e;
    }
  }

  static Future<rpc.Org> updateOrg(
      {@required String id,
      String name,
      String logoUrl,
      String contact}) async {
    final req = rpc.OrgUpdateRequest()
      ..id = id
      ..logoUrl = logoUrl
      ..contact = contact
      ..name = name;

    try {
      final resp = await orgProjectServiceClient()
          .updateOrg(req, options: await getCallOptions());
      return resp;
    } catch (e) {
      throw e;
    }
  }

  static Future<Empty> deleteProject({@required String id}) async {
    final req = rpc.IdRequest()..id = id;

    try {
      final resp = await orgProjectServiceClient()
          .deleteProject(req, options: await getCallOptions());
      return resp;
    } catch (e) {
      throw e;
    }
  }

  static Future<Empty> deleteOrg({@required String id}) async {
    final req = rpc.IdRequest()..id = id;

    try {
      final resp = await orgProjectServiceClient()
          .deleteOrg(req, options: await getCallOptions());
      return resp;
    } catch (e) {
      throw e;
    }
  }

  static rpc.OrgProjServiceClient orgProjectServiceClient() {
    return rpc.OrgProjServiceClient(BaseRepo.channel);
  }
}
