class LinksController < ApplicationController
   before_action :set_link, only: [:edit, :update, :upload_image]
   include ActionController::MimeResponds


  def search
    if params[:query].present?
    @links = Link.where("name ILIKE ?", "%#{params[:query]}%")
    else
      @links = Link.all
    end
    authorize @links
  end

  def new
    @link = Link.new
    authorize @link
  end

  def create
    @user = current_user
    @link = Link.new(link_strong_params)
    @link.user = current_user
    
    if @link.save

      redirect_to user_path(@user)
    else
      render :new
    end
    authorize @link
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    if @link.update(link_strong_params)
    redirect_to user_path(@user)
    else
      render :edit
    authorize @link
    end
  end

  def destroy
    @link = Link.find_by(id:[params[:id]])
    @user = current_user
    @link.destroy
    authorize @link
    respond_to do |format|
      format.html {redirect_to request.referer, status: :see_other}
      format.json { head :no_content}
    end
    # redirect_to request.referer
    
  end

  # @kit = IMGKit.new(render_to_string)

  # respond_to do |format|
  #   send_data(@kit.to_img(format.to_sym),
  #             :type => "image/#{format}", :disposition => 'inline')
  # end

#   def upload_image
#     html  = render_to_string
#     kit   = IMGKit.new(html)
#     img   = kit.to_img(:png)
#     file  = Tempfile.new(["template_#{model.id}", 'png'], 'tmp',
#                           :encoding => 'ascii-8bit')
#     file.write(img)
#     file.flush
#     @link.snapshot = file
#     @link.save
#     file.unlink
#  end

  private

  def set_link
    @link = Link.find_by(id:[params[:id], params[:link_id]])
    authorize @link
  end

  def link_strong_params
    params.require(:link).permit(:url, :image, :user_id, :note, :title, :category_ids => [])
  end
end
