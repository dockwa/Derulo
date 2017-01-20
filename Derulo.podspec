#
# Be sure to run `pod lib lint Derulo.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'Derulo'
  s.version          = '1.1.0'
  s.summary          = 'A flexible collection of Swift protocols and helpers to organize and manage translating between JSON and native Swift objects.'

  s.description      = <<-DESC
  
  Give your model objects a consistent JSON conversion / mapping / caching / offline strategy without getting in your way
  
  Designed to be flexible enough to let you implement your models as your requirements dictate while giving you a general framework to organize your JSON parsing and caching strategy.
  
  A collection of composable but distinct features, so you can use the mixins that work for the use case at hand.
  
  Simple, straightforward, and lightweight; Derulo sits right between "I'll just implement it myself without a third party library" and "I don't really want to reinvent the wheel and implement a JSON strategy from scratch"
  
    DESC

  s.homepage         = 'https://github.com/dockwa/Derulo'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Christian Hatch' => 'christianhatch@gmail.com' }
  s.source           = { :git => 'https://github.com/dockwa/Derulo.git', :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/commodoreftp'

  s.ios.deployment_target = '8.0'

  s.source_files = 'Derulo/*.swift'
  
end
