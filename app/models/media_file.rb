class MediaFile < ActiveRecord::Base

  attr_accessible :feature, :ftype, :name, :path, :uploaded_file#, :content

  attr_accessor :content

  FILE_PATH = "#{Rails.root}/public/upload_files"

  def uploaded_file=(file)
    self.name      = file.original_filename
    self.path      = "#{FILE_PATH}/#{name}"
    self.content   = file.read    
  end

  def upload
   clear_dir
   write_data_into_file
  end

  def parse
    
  end


private

 def clear_dir
   `rm -R #{FILE_PATH}`
 end

 #将二进制程序写入文件
  def write_data_into_file 
    FileUtils.mkdir_p(File.dirname(path))
    File.open(path, 'wb') do |f|
      f.write content
    end
  end

end
