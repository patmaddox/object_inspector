module ObjectInspectorHelper
  def object_from_dom_id(dom_id)
    class_parts, id = dom_id.split('_').instance_eval {[take(size-1), last]}
    class_parts.join('_').classify.constantize.find(id)
  end
end
