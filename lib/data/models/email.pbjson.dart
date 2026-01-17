// This is a generated file - do not edit.
//
// Generated from email.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_relative_imports
// ignore_for_file: unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use emailMessageDescriptor instead')
const EmailMessage$json = {
  '1': 'EmailMessage',
  '2': [
    {'1': 'sender_name', '3': 1, '4': 1, '5': 9, '10': 'senderName'},
    {
      '1': 'sender_email_address',
      '3': 2,
      '4': 1,
      '5': 9,
      '10': 'senderEmailAddress'
    },
    {'1': 'subject', '3': 3, '4': 1, '5': 9, '10': 'subject'},
    {'1': 'body', '3': 4, '4': 1, '5': 9, '10': 'body'},
    {'1': 'attached_image', '3': 5, '4': 1, '5': 12, '10': 'attachedImage'},
    {'1': 'body_hash', '3': 6, '4': 1, '5': 9, '10': 'bodyHash'},
    {'1': 'image_hash', '3': 7, '4': 1, '5': 9, '10': 'imageHash'},
  ],
};

/// Descriptor for `EmailMessage`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List emailMessageDescriptor = $convert.base64Decode(
    'CgxFbWFpbE1lc3NhZ2USHwoLc2VuZGVyX25hbWUYASABKAlSCnNlbmRlck5hbWUSMAoUc2VuZG'
    'VyX2VtYWlsX2FkZHJlc3MYAiABKAlSEnNlbmRlckVtYWlsQWRkcmVzcxIYCgdzdWJqZWN0GAMg'
    'ASgJUgdzdWJqZWN0EhIKBGJvZHkYBCABKAlSBGJvZHkSJQoOYXR0YWNoZWRfaW1hZ2UYBSABKA'
    'xSDWF0dGFjaGVkSW1hZ2USGwoJYm9keV9oYXNoGAYgASgJUghib2R5SGFzaBIdCgppbWFnZV9o'
    'YXNoGAcgASgJUglpbWFnZUhhc2g=');
