Pod::Spec.new do |s|
s.name             = 'CQDebugTool'
s.version          = '1.0.0'
s.summary          = 'help dev to use..'
s.description      = <<-DESC
TODO: Add long description of the pod here.
                       DESC

  s.homepage         = 'https://github.com/luchunqing/CQDebugTool.git'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'luchunqing' => '357406094@qq.com' }
  s.source           = { :git => 'https://github.com/luchunqing/CQDebugTool.git', :tag => s.version }

  s.ios.deployment_target = '8.0'
s.public_header_files = "CQDebugTool/{CQDebugTool.h,CQUrlContext.h}"
s.source_files = 'CQDebugTool/*.{h,m}'
s.requires_arc = true
s.dependency 'BlocksKit','~> 2.2.5'
end
