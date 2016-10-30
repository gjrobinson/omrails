class CredentialingDocument < ApplicationRecord

	def initialize(params = {})
	  file = params.delete(:file)
	  super
	  if file
	    self.filename = sanitize_filename(file.original_filename)
	    self.content_type = file.content_type
	    self.file_contents = file.read
	  end
	end
	private
	  def sanitize_filename(filename)
	    # Get only the filename, not the whole path (for IE)
	    # Thanks to this article I just found for the tip: http://mattberther.com/2007/10/19/uploading-files-to-a-database-using-rails
	    return File.basename(filename)
	  end

	validate :file_size_under_one_mb

	def initialize(params = {})
	  # File is now an instance variable so it can be
	  # accessed in the validation.
	  @file = params.delete(:file)
	  super
	  if @file
	    self.filename = sanitize_filename(@file.original_filename)
	    self.content_type = @file.content_type
	    self.file_contents = @file.read
	  end
	end

	NUM_BYTES_IN_MEGABYTE = 1048576
	def file_size_under_one_mb
	  if (@file.size.to_f / NUM_BYTES_IN_MEGABYTE) > 1
	    errors.add(:file, 'File size cannot be over one megabyte.')
	  end
	end  
end
