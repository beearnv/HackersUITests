platform :ios, '13.0'
use_frameworks!
inhibit_all_warnings!
source 'https://cdn.cocoapods.org/' # For Travis

target 'Hackers' do
  pod 'HNScraper', :git => 'https://github.com/weiran/HNScraper.git', :branch => 'master'
  pod 'PromiseKit/CorePromise'
  pod 'Loaf'
  pod 'SwipeCellKit'
  pod 'Swinject'
  pod 'SwinjectStoryboard'
  pod 'WhatsNewKit'
  pod 'SwiftSoup'
  pod 'Nuke'
  
  pod 'SwiftLint'
  pod 'SBTUITestTunnelServer'
end

target 'HackersUITests' do
  pod 'DeviceKit'
  pod 'SBTUITestTunnelClient'
end
