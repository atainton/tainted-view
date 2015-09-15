class PhotosController < ApplicationController
	before_action :authorize_admin!, only: [:admin]

	def index
		@photos = Photo.all
	end

	def show		
	end

	def new
		@photo = Photo.new
	end

	def create
		@photo = Photo.new(photo_params)
		if @photo.save
			redirect_to photos_path
		else
			render action: 'new'
		end
	end

	def edit
		@photo = Photo.find(params[:id])
	end

	def update
	end

	def destroy
	end

	private

	def photo_params
    params.require(:photo).permit(permitted_params)
  end

  def permitted_params
  	[	:name,
  		:image,
  		:is_active
  	]
  end

end
