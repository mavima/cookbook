class SnapshotUploader < CarrierWave::Uploader::Base
    # include CarrierWave::MiniMagick
    include Cloudinary::CarrierWave

    process :convert => 'png'
    process :tags => ['link_image']
  
    version :thumb do
        process resize_to_fit: [50, 50]
      end
    
      version :standard do
        process resize_to_fill: [80, 120, :north]
      end
  end