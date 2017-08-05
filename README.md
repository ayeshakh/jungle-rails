# Jungle

A mini e-commerce application built with Rails 4.2 for purposes of teaching Rails by example.

## Final Project

!["Product page for the jungle project"](https://github.com/ayeshakh/jungle-rails/blob/master/docs/products-page.png)
!["Signup page for new users"](https://github.com/ayeshakh/jungle-rails/blob/master/docs/signup-page.png)
!["Sign-in page for existing users"](https://github.com/ayeshakh/jungle-rails/blob/master/docs/signin-page.png)
!["review page when logged in so the user can make new reviews and can delete his/her own existing reviews"](https://github.com/ayeshakh/jungle-rails/blob/master/docs/review-page-when-logged-in.png)
!["Admin authentication pops up if a vistor or a user tries to open an admin page"](https://github.com/ayeshakh/jungle-rails/blob/master/docs/authentication-for-admin.png)
!["Admin product page where the admin can add new products and delete existing products"](https://github.com/ayeshakh/jungle-rails/blob/master/docs/admin-products-page.png)
!["Admin categories page where admin can look at existing categories and add new categories"](https://github.com/ayeshakh/jungle-rails/blob/master/docs/adding-new-category-page.png)

## Setup

1. Fork & Clone
2. Run `bundle install` to install dependencies
3. Create `config/database.yml` by copying `config/database.example.yml`
4. Create `config/secrets.yml` by copying `config/secrets.example.yml`
5. Run `bin/rake db:reset` to create, load and seed db
6. Create .env file based on .env.example
7. Sign up for a Stripe account
8. Put Stripe (test) keys into appropriate .env vars
9. Run `bin/rails s -b 0.0.0.0` to start the server

## Stripe Testing

Use Credit Card # 4111 1111 1111 1111 for testing success scenarios.

More information in their docs: <https://stripe.com/docs/testing#cards>

## Dependencies

* Rails 4.2 [Rails Guide](http://guides.rubyonrails.org/v4.2/)
* PostgreSQL 9.x
* Stripe
