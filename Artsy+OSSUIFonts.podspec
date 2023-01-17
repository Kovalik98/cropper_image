Pod::Spec.new do |s|
  s.name             = "CropPickerView"
  s.version          = "2.0"
  s.summary          = "The open source fonts for Artsy apps + UIFont categories."
  s.homepage         = "https://github.com/Kovalik98/cropper_image.git"
  s.license          = 'Code is MIT, then custom font licenses.'
  s.source           = { :git => "git@github.com:Kovalik98/cropper_image.git", :tag => "v2.0" }
  s.author       = { "Nazar Kovalyk" => "i-nazar24@ukr.net" }

  s.source_files = 'CropPickerView.{h,m}'

  s.platform     = :ios, '13.0'

end