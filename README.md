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




from application_controller :
def authenticate
  if not current_user
    redirect_to login_path, notice: "You are not signed in."
  end
end
