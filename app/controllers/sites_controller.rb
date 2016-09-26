class SitesController < InheritedResources::Base

	def index
		@sites = Site.all
		 respond_to do |format|
      format.html
      format.json { render :json => @sites.to_json }
    end
	end

  def show

  end

	

  private

    def site_params
      params.require(:site).permit(:name, :description, :tags)
    end
end

