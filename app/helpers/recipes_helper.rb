module RecipesHelper
  def all_filter_tag
    render partial: "tag", locals: locals_for_all_tag
  end

  def filter_tag(tag)
    render partial: "tag", locals: locals_for_tag(tag)
  end

  def filters_applied?
    (params[:tag] || params[:name]).present?
  end

  private

  def locals_for_all_tag
    { name: "all", count: current_user.recipes.count, link: link_for_all_tag, is_active: all_tag_is_active? }
  end

  def link_for_all_tag
    request.params.except(:tag)
  end

  def all_tag_is_active?
    request.params[:tag].nil? 
  end

  def locals_for_tag(tag)
    { name: tag.name, count: tag.count, link: link_for_tag(tag), is_active: tag_is_active?(tag) }
  end

  def link_for_tag(tag)
    request.params.merge(tag: tag.name)
  end

  def tag_is_active?(tag)
    request.params[:tag] == tag.name
  end
end
