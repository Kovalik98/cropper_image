Pod::Spec.new do |s|
  s.name             = "CropPickerView"
  s.version          = "1.7"
  s.summary          = "The open source fonts for Artsy apps + UIFont categories."
  s.homepage         = "https://github.com/Kovalik98/cropper_image.git"
  s.license          = 'Code is MIT, then custom font licenses.'
  s.source           = { :git => "git@github.com:Kovalik98/cropper_image.git", :tag => "v1.7" }
  s.author       = { "Nazar Kovalyk" => "i-nazar24@ukr.net" }

  s.platform     = :ios, '13.0'

  s.source_files  = "Pod/CropPickerView"
  
end