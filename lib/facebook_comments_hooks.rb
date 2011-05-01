class FacebookCommentsHooks < Spree::ThemeSupport::HookListener
  insert_after :product_properties do
    "<div class='product-fb-comment'>
    <div id=\"fb-root\"></div>
    <script src=\"http://connect.facebook.net/en_US/all.js#appId=<%= Spree::Config[:facebook_app_id] %>&amp;xfbml=1\"></script>
     <fb:comments href=\"<%= url_for(:action => 'show', :controller => 'products', :id => @product.permalink, :only_path => false) %>\" num_posts=\"<%=Spree::Config[:facebook_comments_number]%>\" width=\"<%=Spree::Config[:facebook_comments_width]%>\" colorscheme=\"dark\"></fb:comments>
     </div>"
  end

  insert_before :product_images do
    "<iframe src=\"http://www.facebook.com/plugins/like.php?href=<%= CGI::escape(url_for(:action => 'show', :controller => 'products', :id => @product.permalink, :only_path => false)) %>&amp;layout=standard&amp;width=277&amp;show_faces=true&amp;action=like&amp;colorscheme=dark&amp;font&amp;height=80\" scrolling=\"no\" frameborder=\"0\" style=\"border:none; overflow:hidden; width:277px; height:80px;\" allowTransparency=\"true\"></iframe>"
  end

  insert_after :inside_head do 
    "<% if !@product.nil? %>
      <meta property=\"og:title\" content=\"<%= @product.name %>\" />
      <meta property=\"og:type\" content=\"product\" />
      <meta property=\"og:url\" content=\"<%= url_for(:action => 'show', :controller => 'products', :id => @product.permalink, :only_path => false) %>\" />
      <meta property=\"og:image\" content=\"<%= url_for(:action => 'index', :only_path => false) %><%=@product.images[0].attachment.url %>\" />
    <% end %>
    <meta property=\"og:site_name\" content=\"ShirtHack\" />
    <meta property=\"fb:app_id\" content=\"<%= Spree::Config[:facebook_app_id] %>\" />"
  end
end
