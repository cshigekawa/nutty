ActiveAdmin.register_page "Dashboard" do

  menu :priority => 1, :label => proc{ I18n.t("active_admin.dashboard") }

  content :title => proc{ I18n.t("active_admin.dashboard") } do
   columns do
      column do
        panel "Newest Products" do
          table do
            Product.order("created_at DESC").limit(4).each do |product|
              tr do
                td do
                  image_tag product.image.url(:thumb)
                end
                td do
                  link_to product.title, admin_product_path(product)
                end
              end
            end
          end
        end
      end
      column do
        panel "Most Expensive Products" do
          table do
            Product.order("price DESC").limit(4).each do |product|
              tr do
                td do
                  image_tag product.image.url(:thumb)
                end
                td do
                  link_to product.title, admin_product_path(product)
                end
              end
            end
          end
        end
      end
    end

    # Here is an example of a simple dashboard with columns and panels.
    #
    # columns do
    #   column do
    #     panel "Recent Posts" do
    #       ul do
    #         Post.recent(5).map do |post|
    #           li link_to(post.title, admin_post_path(post))
    #         end
    #       end
    #     end
    #   end

    #   column do
    #     panel "Info" do
    #       para "Welcome to ActiveAdmin."
    #     end
    #   end
    # end

  end # content
end
