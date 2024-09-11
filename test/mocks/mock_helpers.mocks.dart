// Mocks generated by Mockito 5.4.4 from annotations
// in possystem/test/mocks/mock_helpers.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i3;

import 'package:image_cropper/src/cropper.dart' as _i2;
import 'package:image_cropper_platform_interface/image_cropper_platform_interface.dart' as _i4;
import 'package:mockito/mockito.dart' as _i1;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: deprecated_member_use
// ignore_for_file: deprecated_member_use_from_same_package
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

/// A class which mocks [ImageCropper].
///
/// See the documentation for Mockito's code generation for more information.
class MockImageCropper extends _i1.Mock implements _i2.ImageCropper {
  MockImageCropper() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i3.Future<_i4.CroppedFile?> cropImage({
    required String? sourcePath,
    int? maxWidth,
    int? maxHeight,
    _i4.CropAspectRatio? aspectRatio,
    _i4.ImageCompressFormat? compressFormat = _i4.ImageCompressFormat.jpg,
    int? compressQuality = 90,
    List<_i4.PlatformUiSettings>? uiSettings,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #cropImage,
          [],
          {
            #sourcePath: sourcePath,
            #maxWidth: maxWidth,
            #maxHeight: maxHeight,
            #aspectRatio: aspectRatio,
            #compressFormat: compressFormat,
            #compressQuality: compressQuality,
            #uiSettings: uiSettings,
          },
        ),
        returnValue: _i3.Future<_i4.CroppedFile?>.value(),
      ) as _i3.Future<_i4.CroppedFile?>);

  @override
  _i3.Future<_i4.CroppedFile?> recoverImage() => (super.noSuchMethod(
        Invocation.method(
          #recoverImage,
          [],
        ),
        returnValue: _i3.Future<_i4.CroppedFile?>.value(),
      ) as _i3.Future<_i4.CroppedFile?>);
}
