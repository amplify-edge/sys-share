///
//  Generated code. Do not modify.
//  source: users.proto
//
// @dart = 2.3
// ignore_for_file: camel_case_types,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type

const Roles$json = const {
  '1': 'Roles',
  '2': const [
    const {'1': 'INVALID', '2': 0},
    const {'1': 'GUEST', '2': 1},
    const {'1': 'USER', '2': 2},
    const {'1': 'ADMIN', '2': 3},
    const {'1': 'SUPERADMIN', '2': 4},
  ],
};

const UserDefinedFields$json = const {
  '1': 'UserDefinedFields',
  '2': const [
    const {'1': 'fields', '3': 1, '4': 3, '5': 11, '6': '.getcouragenow.sys.v2.sys_account.UserDefinedFields.FieldsEntry', '10': 'fields'},
  ],
  '3': const [UserDefinedFields_FieldsEntry$json],
};

const UserDefinedFields_FieldsEntry$json = const {
  '1': 'FieldsEntry',
  '2': const [
    const {'1': 'key', '3': 1, '4': 1, '5': 9, '10': 'key'},
    const {'1': 'value', '3': 2, '4': 1, '5': 11, '6': '.google.protobuf.Value', '10': 'value'},
  ],
  '7': const {'7': true},
};

const Project$json = const {
  '1': 'Project',
  '2': const [
    const {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
  ],
};

const Org$json = const {
  '1': 'Org',
  '2': const [
    const {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
  ],
};

const UserRoles$json = const {
  '1': 'UserRoles',
  '2': const [
    const {'1': 'role', '3': 1, '4': 1, '5': 14, '6': '.getcouragenow.sys.v2.sys_account.Roles', '10': 'role'},
    const {'1': 'project', '3': 2, '4': 1, '5': 11, '6': '.getcouragenow.sys.v2.sys_account.Project', '9': 0, '10': 'project'},
    const {'1': 'org', '3': 3, '4': 1, '5': 11, '6': '.getcouragenow.sys.v2.sys_account.Org', '9': 0, '10': 'org'},
  ],
  '8': const [
    const {'1': 'resource'},
  ],
};

const Account$json = const {
  '1': 'Account',
  '2': const [
    const {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
    const {'1': 'email', '3': 2, '4': 1, '5': 9, '10': 'email'},
    const {'1': 'password', '3': 3, '4': 1, '5': 9, '10': 'password'},
    const {'1': 'role', '3': 4, '4': 1, '5': 11, '6': '.getcouragenow.sys.v2.sys_account.UserRoles', '10': 'role'},
    const {'1': 'created_at', '3': 5, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'createdAt'},
    const {'1': 'updated_at', '3': 6, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'updatedAt'},
    const {'1': 'last_login', '3': 7, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'lastLogin'},
    const {'1': 'disabled', '3': 8, '4': 1, '5': 8, '10': 'disabled'},
    const {'1': 'fields', '3': 9, '4': 1, '5': 11, '6': '.getcouragenow.sys.v2.sys_account.UserDefinedFields', '10': 'fields'},
  ],
};

const GetAccountRequest$json = const {
  '1': 'GetAccountRequest',
  '2': const [
    const {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
  ],
};

const ListAccountsRequest$json = const {
  '1': 'ListAccountsRequest',
  '2': const [
    const {'1': 'per_page_entries', '3': 1, '4': 1, '5': 3, '10': 'perPageEntries'},
    const {'1': 'order_by', '3': 2, '4': 1, '5': 9, '10': 'orderBy'},
    const {'1': 'current_page_token', '3': 3, '4': 1, '5': 9, '10': 'currentPageToken'},
  ],
};

const ListAccountsResponse$json = const {
  '1': 'ListAccountsResponse',
  '2': const [
    const {'1': 'accounts', '3': 1, '4': 3, '5': 11, '6': '.getcouragenow.sys.v2.sys_account.Account', '10': 'accounts'},
    const {'1': 'next_page_token', '3': 2, '4': 1, '5': 9, '10': 'nextPageToken'},
  ],
};

const SearchAccountsRequest$json = const {
  '1': 'SearchAccountsRequest',
  '2': const [
    const {'1': 'query', '3': 1, '4': 1, '5': 9, '10': 'query'},
    const {'1': 'search_params', '3': 2, '4': 1, '5': 11, '6': '.getcouragenow.sys.v2.sys_account.ListAccountsRequest', '10': 'searchParams'},
  ],
};

const SearchAccountsResponse$json = const {
  '1': 'SearchAccountsResponse',
  '2': const [
    const {'1': 'search_response', '3': 1, '4': 1, '5': 11, '6': '.getcouragenow.sys.v2.sys_account.ListAccountsResponse', '10': 'searchResponse'},
  ],
};

const AssignAccountToRoleRequest$json = const {
  '1': 'AssignAccountToRoleRequest',
  '2': const [
    const {'1': 'assignee_account_id', '3': 1, '4': 1, '5': 9, '10': 'assigneeAccountId'},
    const {'1': 'assigned_account_id', '3': 2, '4': 1, '5': 9, '10': 'assignedAccountId'},
    const {'1': 'role', '3': 3, '4': 1, '5': 11, '6': '.getcouragenow.sys.v2.sys_account.UserRoles', '10': 'role'},
  ],
};

const DisableAccountRequest$json = const {
  '1': 'DisableAccountRequest',
  '2': const [
    const {'1': 'account_id', '3': 1, '4': 1, '5': 9, '10': 'accountId'},
  ],
};

