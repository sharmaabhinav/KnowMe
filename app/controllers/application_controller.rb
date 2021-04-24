class ApplicationController < ActionController::API
  before_action :load_resource, only: [:show, :update, :destroy]
  before_action :load_resources, only: [:index]
  before_action :build_resource, only: [:create]


  private

  def resource_class
    controller_name.classify.constantize
  end

  def resource_name
    resource_class.to_s.underscore
  end

  def load_resources
    resources = resource_class.all
    instance_variable_set("@#{resource_name.pluralize}", resources)
  end

  def load_resource
    resource = resource_class.find_by_id(params[:id])
    instance_variable_set("@#{resource_name}", resource)
  end

  def build_resource
    build_params = self.send("#{resource_name}_create_params")
    resource = resource_class.new(build_params)
    instance_variable_set("@#{resource_name}", resource)
  end

  def render_422(errors)
    render json: {error: errors}, status: 422
  end

  def render_404(message)
    render json: {error: message}, status: 404
  end

  def render_200(response)
    render json: response
  end
end
