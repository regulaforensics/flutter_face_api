Pod::Spec.new do |s|
  s.name             = 'flutter_face_api'
  s.version          = '8.4.1438-nightly'
  s.summary          = 'A new flutter plugin project.'
  s.description      = <<-DESC
A new flutter plugin project.
                       DESC
  s.homepage         = 'http://example.com'
  s.license          = { :file => '../LICENSE' }
  s.author           = { 'Your Company' => 'email@example.com' }
  s.source           = { :path => '.' }
  s.source_files = 'flutter_face_api/Sources/flutter_face_api/**/*.swift'
  s.dependency 'Flutter'
  s.platform = :ios, '13.0'
  s.dependency 'FaceSDKNightly', '9.9.4841'
  s.pod_target_xcconfig = { 'DEFINES_MODULE' => 'YES', 'VALID_ARCHS[sdk=iphonesimulator*]' => 'x86_64' }
end
