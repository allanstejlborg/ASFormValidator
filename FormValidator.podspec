Pod::Spec.new do |spec|

  spec.name = "FormValidator"
  spec.version = "0.0.1"
  spec.summary = "Lightweight form validation in Swift"
  spec.homepage = "https://github.com/allanstejlborg/FormValidator"
  spec.license = "MIT"
  spec.author = { "Allan Stejlborg" => "allan@stejlborg.dk" }
  spec.source = { :git => "https://github.com/allanstejlborg/FormValidator.git", :tag => "#{spec.version}" }
  spec.source_files = "Source/FormValidator/*.swift"

end
