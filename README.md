# Jungle

A mini e-commerce application built from an Rails 4.2 inherited codebase.

## Screenshots

Home Page
!["Home_page"](https://github.com/dimontejulia/jungle-rails/blob/master/app/assets/screenshots/home_page.png)

Browse products by categories.
!["browse_categories"](https://github.com/dimontejulia/jungle-rails/blob/master/app/assets/screenshots/browse_categories.png)

Selected items added to cart which users can edit before checking out.
!["cart"](https://github.com/dimontejulia/jungle-rails/blob/master/app/assets/screenshots/cart.png)

Checkout is verified with a Stripe credit card.
!["checkout_stripe"](https://github.com/dimontejulia/jungle-rails/blob/master/app/assets/screenshots/checkout_stipe.png)

Users can create an account and login/logout at any time.
!["create_account"](https://github.com/dimontejulia/jungle-rails/blob/master/app/assets/screenshots/create_account.png)

Admin capabilities: pages are password protected so only admins have access to the following features:

Admins can create and delete products.
!["admin_products"](https://github.com/dimontejulia/jungle-rails/blob/master/app/assets/screenshots/admin_products.png)

Admins can also add new categories.
!["admin_categories"](https://github.com/dimontejulia/jungle-rails/blob/master/app/assets/screenshots/admin_categories.png)

Admins can also create sales.
!["admin_sales"](https://github.com/dimontejulia/jungle-rails/blob/master/app/assets/screenshots/admin_sales.png)

## Setup

1. Run `bundle install` to install dependencies
2. Create `config/database.yml` by copying `config/database.example.yml`
3. Create `config/secrets.yml` by copying `config/secrets.example.yml`
4. Run `bin/rake db:reset` to create, load and seed db
5. Create .env file based on .env.example
6. Sign up for a Stripe account
7. Put Stripe (test) keys into appropriate .env vars
8. Run `bin/rails server` to start the server

## Stripe Testing

Use Credit Card # 4111 1111 1111 1111 for testing success scenarios.

More information in their docs: <https://stripe.com/docs/testing#cards>

## Dependencies

- Rails 4.2 [Rails Guide](http://guides.rubyonrails.org/v4.2/)
- PostgreSQL 9.x
- Stripe
