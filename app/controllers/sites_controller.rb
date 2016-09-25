class SitesController < InheritedResources::Base

	def index
		@sites = Site.all
	end

	

  private

    def site_params
      params.require(:site).permit(:name, :description, :tags)
    end
end

