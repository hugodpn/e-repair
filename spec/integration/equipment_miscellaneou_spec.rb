#require "spec_helper"
#
#describe "INTEGRATION TESTS" do
#
#  it "Login" do
#
#    get "/login"
#    response.should be_success
#    path.should == "/login"
#
#    post "/user_sessions", :user_session_login => "admin", :user_session_password => "adminadmin"
#    response.should be_success
#    path.should == "/user_sessions"
#    response.should redirect_to("/")
#
#
#
#  end
#
#
#end