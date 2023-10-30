class WelcomeController < ApplicationController
  def index
    options = ["0","1","2","3","4",'5','6','7','8','9',"a","b","c","d","e","f"]
    @colors = '#'
    6.times {@colors << options.sample}
    @subscription = Subscription.new
  end
  def about
    options = ["0","1","2","3","4",'5','6','7','8','9',"a","b","c","d","e","f"]
    @colors = '#'
    6.times {@colors << options.sample}
    @subscription = Subscription.new
  end
end
