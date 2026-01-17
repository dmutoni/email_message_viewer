// This is a generated file - do not edit.
//
// Generated from email.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_relative_imports

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

export 'package:protobuf/protobuf.dart' show GeneratedMessageGenericExtensions;

class EmailMessage extends $pb.GeneratedMessage {
  factory EmailMessage({
    $core.String? senderName,
    $core.String? senderEmailAddress,
    $core.String? subject,
    $core.String? body,
    $core.List<$core.int>? attachedImage,
    $core.String? bodyHash,
    $core.String? imageHash,
  }) {
    final result = create();
    if (senderName != null) result.senderName = senderName;
    if (senderEmailAddress != null)
      result.senderEmailAddress = senderEmailAddress;
    if (subject != null) result.subject = subject;
    if (body != null) result.body = body;
    if (attachedImage != null) result.attachedImage = attachedImage;
    if (bodyHash != null) result.bodyHash = bodyHash;
    if (imageHash != null) result.imageHash = imageHash;
    return result;
  }

  EmailMessage._();

  factory EmailMessage.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory EmailMessage.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'EmailMessage',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'email'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'senderName')
    ..aOS(2, _omitFieldNames ? '' : 'senderEmailAddress')
    ..aOS(3, _omitFieldNames ? '' : 'subject')
    ..aOS(4, _omitFieldNames ? '' : 'body')
    ..a<$core.List<$core.int>>(
        5, _omitFieldNames ? '' : 'attachedImage', $pb.PbFieldType.OY)
    ..aOS(6, _omitFieldNames ? '' : 'bodyHash')
    ..aOS(7, _omitFieldNames ? '' : 'imageHash')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  EmailMessage clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  EmailMessage copyWith(void Function(EmailMessage) updates) =>
      super.copyWith((message) => updates(message as EmailMessage))
          as EmailMessage;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static EmailMessage create() => EmailMessage._();
  @$core.override
  EmailMessage createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static EmailMessage getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<EmailMessage>(create);
  static EmailMessage? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get senderName => $_getSZ(0);
  @$pb.TagNumber(1)
  set senderName($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasSenderName() => $_has(0);
  @$pb.TagNumber(1)
  void clearSenderName() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get senderEmailAddress => $_getSZ(1);
  @$pb.TagNumber(2)
  set senderEmailAddress($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasSenderEmailAddress() => $_has(1);
  @$pb.TagNumber(2)
  void clearSenderEmailAddress() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get subject => $_getSZ(2);
  @$pb.TagNumber(3)
  set subject($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasSubject() => $_has(2);
  @$pb.TagNumber(3)
  void clearSubject() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.String get body => $_getSZ(3);
  @$pb.TagNumber(4)
  set body($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasBody() => $_has(3);
  @$pb.TagNumber(4)
  void clearBody() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.List<$core.int> get attachedImage => $_getN(4);
  @$pb.TagNumber(5)
  set attachedImage($core.List<$core.int> value) => $_setBytes(4, value);
  @$pb.TagNumber(5)
  $core.bool hasAttachedImage() => $_has(4);
  @$pb.TagNumber(5)
  void clearAttachedImage() => $_clearField(5);

  @$pb.TagNumber(6)
  $core.String get bodyHash => $_getSZ(5);
  @$pb.TagNumber(6)
  set bodyHash($core.String value) => $_setString(5, value);
  @$pb.TagNumber(6)
  $core.bool hasBodyHash() => $_has(5);
  @$pb.TagNumber(6)
  void clearBodyHash() => $_clearField(6);

  @$pb.TagNumber(7)
  $core.String get imageHash => $_getSZ(6);
  @$pb.TagNumber(7)
  set imageHash($core.String value) => $_setString(6, value);
  @$pb.TagNumber(7)
  $core.bool hasImageHash() => $_has(6);
  @$pb.TagNumber(7)
  void clearImageHash() => $_clearField(7);
}

const $core.bool _omitFieldNames =
    $core.bool.fromEnvironment('protobuf.omit_field_names');
const $core.bool _omitMessageNames =
    $core.bool.fromEnvironment('protobuf.omit_message_names');
