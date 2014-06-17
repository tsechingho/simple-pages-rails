require_dependency 'simple_pages/application_controller'

module SimplePages
  class PagesController < ApplicationController
    before_filter :authenticate_session!, except: [:show]

    load_resource class: 'SimplePages::Page', only: [:index]
    before_filter :new_page, only: [:new, :create]
    load_resource class: 'SimplePages::Page', find_by: :url, only: [:show, :edit, :update, :destroy]

    authorize_resource class: 'SimplePages::Page', except: [:show]

    def index
      @pages = @pages.paginate pagination_options
      respond_with @pages
    end

    def show
      respond_with @page
    end

    def new
      @page.author = session_user
      respond_with @page
    end

    def edit
    end

    def create
      @page.save
      respond_with @page
    end

    def update
      @page.update_attributes page_params
      respond_with @page
    end

    def destroy
      @page.destroy
      respond_with @page
    end

    protected

    def page_params
      if params.respond_to? :permit and params.has_key? :page
        params.require(:page).permit(SimplePages.permitted_fields)
      else
        params[:page]
      end
    end

    def new_page
      @page = SimplePages::Page.new page_params
    end

    private

    def pagination_options
      { page: params[:page], per_page: SimplePages.pages_per_page }
    end
  end
end
