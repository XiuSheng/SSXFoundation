
Pod::Spec.new do |s|
  s.name             = 'SSXFoundation'
  s.version          = '0.3.3'
  s.summary          = '个人开发框架继承'
  s.description      = <<-DESC
自己的个人开发框架集成
                       DESC
  s.homepage         = 'https://github.com/sishengxiu/SSXFoundation'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'sishengxiu' => 'sishengxiu@gmail.com' }
  s.source           = { :git => 'https://github.com/XiuSheng/SSXFoundation.git', :tag => s.version.to_s }
  s.ios.deployment_target = '8.0'
  s.source_files = 'SSXFoundation/Classes/**/*'
  s.dependency 'AFNetworking'
end
