# Gilded Rose Refactoring Kata

#### Overview

As a second tech test, we were given the infamous Gilded Rose Refactoring Kata, created by Terry Hughes. You can find the Kata on Github [here](https://github.com/NotMyself/GildedRose) and starting code for multiple programming languages [here](https://github.com/emilybache/GildedRose-Refactoring-Kata).

See [here](GildedRoseRequirements.txt) for the Kata's requirements.

I highly recommend watching Sandi Metz's [talk](https://www.youtube.com/watch?v=8bZh5LMaSmE&t=646s) which uses a simplified version of the Ruby code to showcase the importance of Single Responsibility and Open/Close Design Principles of the Object Oriented Programming.

#### Usage

* Clone repository
* `cd` to the project's root directory
* Run `gem install bundler`
* Run `bundle install` to install all of the required gems
* Run `rspec` to make sure that all tests are passing
* Run `ruby textest_fixture.rb` in the terminal. You can specify a number of days after the command.

#### Tech

* Ruby
* RSpec

#### Approach

Below are the steps that I undertook to solve this kata:

1. Write tests for the existing code base

2. Use the tests from step 1 to guide me through a refactor stage to simplify the `update_quality` method by breaking it into smaller methods

3. Extract common functionality from `GildedRose` class into separate classes
