class ObjectInspector::ProcessesController < ApplicationController
  include ObjectInspectorHelper

  def create
    @object = object_from_dom_id params[:object_id]
    result = @object.instance_eval params[:command]
    render :json => result.to_json
  end
end
