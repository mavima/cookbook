class Link < ApplicationRecord
  belongs_to :user
  has_and_belongs_to_many :categories
  # has_attached_file :image, :storage => :s3,
  # :s3_credentials => "#{Rails.root}/config/s3.yml"

  validates :url, uniqueness: { scope: :user_id }
  # mount_uploader :image, SnapshotUploader

  # after_create :create_screenshot

  private

  def create_screenshot
    grover = Grover.new(self.url)
    self.image = grover.to_png
    self.save
  end

  # def take_snapshot
  #   file = Tempfile.new(["template_#{self.id.to_s}", '.png'], 'tmp', :encoding => 'ascii-8bit')
  #   # file.write(IMGKit.new(self.html_body, quality: 50, width: 600).to_png)
  #   file.write(IMGKit.new(self.url, quality: 50, width: 300).to_png)
  #   file.flush
  #   self.image = file
  #   self.save
  #   file.unlink
  # end
end
