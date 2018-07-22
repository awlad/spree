module ApplicationHelper
  def taxons_tree_local(root_taxon, current_taxon, max_level = 1)
    return '' if max_level < 1 || root_taxon.leaf?
    content_tag :ul, class: 'nav navbar-nav mr-auto' do
      taxons = root_taxon.children.map do |taxon|
        css_class = current_taxon && current_taxon.self_and_ancestors.include?(taxon) ? 'nav-item active ' : 'nav-item'
        content_tag :li, class: css_class do
          link_to(taxon.name, seo_url(taxon), class: 'nav-link waves-effect waves-light') + taxons_tree(taxon, current_taxon, max_level - 1)
        end

      end
      safe_join(taxons, "\n")
    end
  end

end
