require 'spec_helper'

describe Admin::CategoriesController, "FUNCIONALIDADES (Logueado con el usuario ADMIN)" do

  fixtures :users
  setup :activate_authlogic # run before tests are executed

  before(:each) do
    UserSession.create(users(:admin)) # logs a user in
  end

  def mock_category(stubs={})
    @mock_category ||= mock_model(Category, stubs)
  end

  describe "GET visualización" do
    it "Listar (Index): Se buscan todas las categorías dejandolas en una variable global llamada " +
      "@categories para ser utilizada en la vista" do
      Category.stub(:find).with(:all).and_return([mock_category])
      get :index
      assigns[:categories].should == [mock_category]
    end

    it "Ver (Show): Se busca una categía por id y se la asigna a la variable @category " +
      "para ser utilizada en la vista correspondiente" do
      Category.stub(:find).with("37").and_return(mock_category)
      get :show, :id => "37"
      assigns[:category].should equal(mock_category)
    end
  
    it "Nuevo (new): Se asigna una nueva categíra a la variable @category para que pueda ser cargada en la vista" do
      Category.stub(:new).and_return(mock_category)
      get :new
      assigns[:category].should equal(mock_category)
    end
  
    it "Editar (edit): Se busca una categíra por id y se asigna a la variable @category para ser utilizada en la vista" do
      Category.stub(:find).with("37").and_return(mock_category)
      get :edit, :id => "37"
      assigns[:category].should equal(mock_category)
    end
  end

  describe "POST creación" do
  
    it "Parametros válidos: Se gurda la categoría pasada en la variable @category" do
      Category.stub(:new).with({'these' => 'params'}).and_return(mock_category(:save => true))
      post :create, :category => {:these => 'params'}
      assigns[:category].should equal(mock_category)
    end
  
    it "Parametros válidos: Se redirecciona al listado de categorías despues de la creación exitosa" do
      Category.stub(:new).and_return(mock_category(:save => true))
      post :create, :category => {}
      response.should redirect_to(admin_category_url(mock_category))
    end
  
    it "Parámetros no válidos: Se asignan parametros invalidos a @category por lo que no se puede guardar la categoría" do
      Category.stub(:new).with({'these' => 'params'}).and_return(mock_category(:save => false))
      post :create, :category => {:these => 'params'}
      assigns[:category].should equal(mock_category)
    end
  
    it "Parámetros no válidos: Se renderiza la pantalla de 'neuvo'" do
      Category.stub(:new).and_return(mock_category(:save => false))
      post :create, :category => {}
      response.should render_template('new')
    end
  
  end
  
  describe "PUT actualización" do
  
    it "Parametros válidos: Se especifican los pasos a seguir cuando se va a actualizar una catogría" do
      Category.should_receive(:find).with("37").and_return(mock_category)
      mock_category.should_receive(:update_attributes).with({'these' => 'params'})
      put :update, :id => "37", :category => {:these => 'params'}
    end
  
    it "Parametros válidos: Se asigna la categoría requerida a la variable @category para ser utilizada en la vista" do
      Category.stub(:find).and_return(mock_category(:update_attributes => true))
      put :update, :id => "1"
      assigns[:category].should equal(mock_category)
    end
  
    it "Parametros válidos: Se redirecciona a ver categoría luego de la actualización exitosa" do
      Category.stub(:find).and_return(mock_category(:update_attributes => true))
      put :update, :id => "1"
      response.should redirect_to(admin_category_url(mock_category))
    end

      it "Parámetros no válidos: Se especifican los pasos a seguir cuando se va a actualizar una catogría" do
        Category.should_receive(:find).with("37").and_return(mock_category)
        mock_category.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :category => {:these => 'params'}
      end
  
      it "Parámetros no válidos: se asigna la categoría a la variable @category para ser utilizada en la vista de edit" do
        Category.stub(:find).and_return(mock_category(:update_attributes => false))
        put :update, :id => "1"
        assigns[:category].should equal(mock_category)
      end
  
      it "Parámetros no válidos: redirecciona a la pantalla de 'edit'" do
        Category.stub(:find).and_return(mock_category(:update_attributes => false))
        put :update, :id => "1"
        response.should render_template('edit')
      end
  
  end

  describe "DELETE eliminación" do
    it "Elimina la categoría requerida" do
      Category.should_receive(:find).with("37").and_return(mock_category)
      mock_category.should_receive(:destroy)
      delete :destroy, :id => "37"
    end
  
    it "Redirecciona a la lista de categorías" do
      Category.stub(:find).and_return(mock_category(:destroy => true))
      delete :destroy, :id => "1"
      response.should redirect_to(admin_categories_url)
    end
  end

end
