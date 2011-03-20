class FacebookCommentsHooks < Spree::ThemeSupport::HookListener
  insert_after :product_properties do
    "<div class='product-fb-comment'>
     <div id=\"fb-root\"></div>
     <script src=\"http://connect.facebook.net/en_US/all.js#appId=<%= Spree::Config[:facebook_app_id] %>&amp;xfbml=1\"></script>
     <fb:comments href=\"<%= url_for(:action => 'show', :controller => 'products', :id => @product.permalink, :only_path => false) %>\" num_posts=\"<%=Spree::Config[:facebook_comments_number]%>\" width=\"<%=Spree::Config[:facebook_comments_width]%>\"></fb:comments>
     </div>"
  end
end
