class Ecm::Frontend::AdsController < Ecm::FrontendController
  def link
    @ad = Ad.where(:id => params[:id]).first
    if @ad.nil?  
      redirect_to root_path, :notice => "Couldn't find Ad with ID=#{params[:id]}"
    else
      @ad.update_attribute(:clicks, @ad.clicks+1)
      redirect_to @ad.link_for_redirect
    end
  end
end
