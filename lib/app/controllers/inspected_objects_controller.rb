class InspectedObjectsController < ApplicationController
  include ObjectInspectorHelper
  respond_to :html, :json
  layout nil

  def show
    @object = object_from_dom_id params[:id]
    respond_with(@object) do |format|
      format.json { render :json => @object.to_json(:methods => :class_name) }
    end
  end
end
