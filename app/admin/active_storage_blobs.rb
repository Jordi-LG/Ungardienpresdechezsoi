ActiveAdmin.register ActiveStorage::Blob do
  permit_params :key, :filename, :content_type, :metadata, :byte_size, :checksum
  
  
end
