#gCamp

Ruby Version 2.2.0

[View on Heroku](https://guarded-everglades-5530.herokuapp.com/)



To install:

```

bundle

rake db:create rake db:migrate rake db:seed

rails s

Tips:
If anyone is trying to figure out how to get the sign-in form to look like your sign-up form, but is having an issue where everything after "email_field_tag :email," is showing up in the actual field on your site, do this <%= email_field_tag :email, nil, class: "form-control" %> (notice the "nil" after :email) ...just spent an hour trying to figure this out so thought I'd share



<li><%=link_to @current_user, @user_path %></li>
  <% if current_user %>
<li><%= link_to 'Logout', logout_path %></li>
<% else %>
<li><%= link_to 'Login', login_path %></li>
<% end %>
