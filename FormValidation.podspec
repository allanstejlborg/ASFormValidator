Pod::Spec.new do |spec|

  spec.name = "FormValidation"
  spec.version = "0.0.1"
  spec.summary = "Lightweight form validation in Swift"
  spec.homepage = "https://github.com/allanstejlborg/FormValidation"
  spec.license = "MIT"
  spec.author = { "Allan Stejlborg" => "allan@stejlborg.dk" }
  spec.source = { :git => "https://github.com/allanstejlborg/FormValidation.git", :tag => "#{spec.version}" }
  spec.source_files = "Source/FormValidation/*.swift"

end
