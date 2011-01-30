require 'spec_helper'

describe Admin::DepartmentsController, "FUNCIONALIDADES (Logueado con el usuario ADMIN)" do

  fixtures :users
  setup :activate_authlogic # run before tests are executed

  before(:each) do
      UserSession.create(users(:admin)) # logs a user in
  end

  def mock_department(stubs={})
    @mock_department ||= mock_model(Department, stubs)
  end

  describe "GET visualización" do

    it "Listar (Index): Se listan todos los departamentos" do
      Department.stub(:find).with(:all).and_return([mock_department])
      get :index
      assigns[:departments].should == [mock_department]
    end

  end

end


describe Admin::DepartmentsController, "FUNCIONALIDADES (Logueado con el usuario USUARIO SIN PERMISOS)" do

  fixtures :users
  setup :activate_authlogic # run before tests are executed

  before(:each) do
      UserSession.create(users(:user)) # logs a user in
  end

  def mock_department(stubs={})
    @mock_department ||= mock_model(Department, stubs)
  end

  describe "GET visualización" do

    it "Listar (Index): Se listan todos los departamentos" do
      Department.stub(:find).with(:all).and_return([mock_department])
      get :index
      response.should redirect_to("/")
      flash.now[:notice].should == 'Permissions deny.'
    end
  
  end

end


describe Admin::DepartmentsController, "FUNCIONALIDADES (Usuario no logueado)" do

  before(:each) do
  end

  describe "GET visualización" do

    it "Listar (Index): Se intenta acceder a departmens sin haberse logueado" do
      get :index
      response.should redirect_to("/login")
      flash.now[:notice].should == 'You should be loggin.'
    end

  end

end
