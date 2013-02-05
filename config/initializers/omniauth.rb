
module OpenSSL
  module SSL
    remove_const :VERIFY_PEER
  end
end
OpenSSL::SSL::VERIFY_PEER = OpenSSL::SSL::VERIFY_NONE

Rails.application.config.middleware.use OmniAuth::Builder do

  # login.salesforce.com
  provider :salesforce,
               #ENV['SALESFORCE_KEY']='3MVG9Y6d_Btp4xp6SWO6yPlUURg8e6eQA6owOrn.KC3_6HuZ.VoLi9jUrnkrR8DdLbzlqvADfEINP14.NFpp3',
               #ENV['SALESFORCE_KEY']='5705538947291561596'
               ENV['SALESFORCE_KEY']='3MVG9Y6d_Btp4xp6SWO6yPlUURnycVbOfuH7I_NH2bjaw0yeoguRatNzKRpEVaIvmX7TcQbVVjuQUCZ006pwN',
               ENV['SALESFORCE_KEY']='5339957415407001741' #heroku key
end