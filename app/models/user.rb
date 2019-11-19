class User < ApplicationRecord
  #attr_accessible :email, :username, :password
  #attr_accessor :password

  #validates_confirmation_of :password
  #validates_presence_of :password, :on => :create
  validates_presence_of :email, :on => :create
  validates_presence_of :name, :on => :create
  validates_uniqueness_of :email
  validates_uniqueness_of :name

  def self.authenticate_by_username(username, password)
    # code here
    user = find_by_username(username)
    if user && user.password == password
      user
    else
      nil
    end
  end

  def self.authenticate_by_email(email, password)
    # code here
    user = find_by_email(email)
    puts "IN User Model find_by_email"
    #User.find_by(email: params["user"]["email"], password: params["user"]["password"])
    if user && user.password == password
      printf("in User.rb Model user has found in DB.")
      logger.info("in User.rb Model user has found in DB.")
      puts "in User.rb Model user has found in DB."
      user
    else
      puts "in User.rb Model user couldn't found in DB."

      nil
    end
  end
end
