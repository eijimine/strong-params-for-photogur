class PicturesController < ApplicationController
  def index
    @pictures = Picture.all
    @most_recent_pictures = Picture.most_recent_five
    @older_than_a_month = Picture.created_before(1.month.ago)
    @photos_from_2017 = Picture.pictures_created_in_year(2017)
    @photos_from_2016 = Picture.pictures_created_in_year(2016)
    @photos_from_2015 = Picture.pictures_created_in_year(2015)
    @photos_from_2014 = Picture.pictures_created_in_year(2014)
  end

  def by_year
    @selected_year = Picture.pictures_created_in_year(params[:q])
  end

  def show
    @picture = Picture.find(params[:id])
  end

  def new
    @picture = Picture.new
  end


  def create

    @picture = Picture.new(picture_params)

    if @picture.save
      # if the picture gets saved, generate a get request to "/pictures" (the index)
      redirect_to "/pictures"
    else
      # otherwise render new.html.erb
      render :new
    end
  end

  def edit
   @picture = Picture.find(params[:id])
  end

  def update
    @picture = Picture.find(params[:id])

    if @picture.update(picture_params)
     redirect_to "/pictures/#{@picture.id}"
    else
     render :edit
    end
  end

  def destroy
   @picture = Picture.find(params[:id])
   @picture.destroy
   redirect_to "/pictures"
  end

  private

  def picture_params
    params.require(:picture).permit(:artist, :title, :url)
  end



end
