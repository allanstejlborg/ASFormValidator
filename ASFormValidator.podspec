Pod::Spec.new do |spec|

  spec.name = "ASFormValidator"
  spec.version = "0.0.2"
  spec.summary = "Lightweight form validation in Swift"
  spec.homepage = "https://github.com/allanstejlborg/ASFormValidator"
  spec.license = "MIT"
  spec.author = { "Allan Stejlborg" => "allan@stejlborg.dk" }
  spec.source = { :git => "https://github.com/allanstejlborg/ASFormValidator.git", :tag => "#{spec.version}" }
  spec.platform = :ios, '11.0'
  spec.source_files = "Source/FormValidator/Classes/**/*.swift"
  spec.swift_versions = ['5.0']

end
