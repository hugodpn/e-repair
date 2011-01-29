require "spec_helper"

describe Admin::EquipmentMiscellaneousController, "FUNCIONALIDADES (Logueado con el usuario ADMIN)" do

  fixtures :users
  setup :activate_authlogic # run before tests are executed

  before(:each) do
    UserSession.create(users(:admin)) # logs a user in
  end

  def mock_equipment_miscellaneous(stubs={})
    @mock_equipment_miscellaneou ||= mock_model(EquipmentMiscellaneou, stubs)
  end


  describe "GET visualización" do
    it "Listar (Index): Se buscan todas los equipos dejandolas en una variable global llamada " +
      "@equipment_miscellaneous para ser utilizada en la vista" do
      EquipmentMiscellaneou.stub(:take_in).and_return([mock_equipment_miscellaneous])
      get :index
      assigns[:equipment_miscellaneous].should == [mock_equipment_miscellaneous]
    end

    it "Ver (Show): Se busca un equipo por id y se la asigna a la variable @equipment_miscellaneou " +
      "para ser utilizada en la vista correspondiente" do
      EquipmentMiscellaneou.stub(:find).with("37").and_return(mock_equipment_miscellaneous)
      get :show, :id => "37"
      assigns[:equipment_miscellaneou].should equal(mock_equipment_miscellaneous)
    end

    it "Nuevo (new): Se asigna un nuev equipo a la variable @equipment_miscellaneou para que pueda ser cargada en la vista" do
      EquipmentMiscellaneou.stub(:new).and_return(mock_equipment_miscellaneous)
      get :new
      assigns[:equipment_miscellaneou].should equal(mock_equipment_miscellaneous)
    end

    it "Editar (edit): Se busca un equipo por id y se asigna a la variable @equipment_miscellaneou para ser utilizada en la vista" do
      EquipmentMiscellaneou.stub(:find).with("37").and_return(mock_equipment_miscellaneous)
      get :edit, :id => "37"
      assigns[:equipment_miscellaneou].should equal(mock_equipment_miscellaneous)
    end
  end

  describe "POST creación" do

    it "Parametros válidos: Se gurda el equipo pasada en la variable @equipment_miscellaneou" do
      EquipmentMiscellaneou.stub(:new).with({'these' => 'params'}).and_return(mock_equipment_miscellaneous(:save => true))
      post :create, :equipment_miscellaneou => {:these => 'params'}
      assigns[:equipment_miscellaneou].should equal(mock_equipment_miscellaneous)
    end

    it "Parametros válidos: Se redirecciona al listado de equipos después de la creación exitosa" do
      EquipmentMiscellaneou.stub(:new).and_return(mock_equipment_miscellaneous(:save => true))
      post :create, :equipment_miscellaneou => {}
      response.should redirect_to(admin_equipment_miscellaneou_url(mock_equipment_miscellaneous))
    end

    it "Parámetros no válidos: Se asignan parametros invalidos a @equipment_miscellaneou por lo que no se puede guardar el equipo" do
      EquipmentMiscellaneou.stub(:new).with({'these' => 'params'}).and_return(mock_equipment_miscellaneous(:save => false))
      post :create, :equipment_miscellaneou => {:these => 'params'}
      assigns[:equipment_miscellaneou].should equal(mock_equipment_miscellaneous)
    end

    it "Parámetros no válidos: Se renderiza la pantalla de 'neuvo' luego de la falla" do
      EquipmentMiscellaneou.stub(:new).and_return(mock_equipment_miscellaneous(:save => false))
      post :create, :equipment_miscellaneou => {}
      response.should render_template('new')
    end

  end

  describe "PUT actualización" do

    it "Parametros válidos: Se especifican los pasos a seguir cuando se va a actualizar un equipo" do
      EquipmentMiscellaneou.should_receive(:find).with("37").and_return(mock_equipment_miscellaneous)
      mock_equipment_miscellaneous.should_receive(:update_attributes).with({'these' => 'params'})
      put :update, :id => "37", :equipment_miscellaneou => {:these => 'params'}
    end

    it "Parametros válidos: Se asigna el equipo requerido a la variable @cequipment_miscellaneou para ser utilizada en la vista" do
      EquipmentMiscellaneou.stub(:find).and_return(mock_equipment_miscellaneous(:update_attributes => true))
      put :update, :id => "1"
      assigns[:equipment_miscellaneou].should equal(mock_equipment_miscellaneous)
    end

    it "Parametros válidos: Se redirecciona a ver equipo luego de la actualización exitosa" do
      EquipmentMiscellaneou.stub(:find).and_return(mock_equipment_miscellaneous(:update_attributes => true))
      put :update, :id => "1"
      response.should redirect_to(admin_equipment_miscellaneou_url(mock_equipment_miscellaneous))
    end

      it "Parámetros no válidos: Se especifican los pasos a seguir cuando se va a actualizar un equipo" do
        EquipmentMiscellaneou.should_receive(:find).with("37").and_return(mock_equipment_miscellaneous)
        mock_equipment_miscellaneous.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :equipment_miscellaneou => {:these => 'params'}
      end

      it "Parámetros no válidos: se asigna el equipo a la variable @equipment_miscellaneou para ser utilizada en la vista de edit" do
        EquipmentMiscellaneou.stub(:find).and_return(mock_equipment_miscellaneous(:update_attributes => false))
        put :update, :id => "1"
        assigns[:equipment_miscellaneou].should equal(mock_equipment_miscellaneous)
      end

      it "Parámetros no válidos: redirecciona a la pantalla de 'edit'" do
        EquipmentMiscellaneou.stub(:find).and_return(mock_equipment_miscellaneous(:update_attributes => false))
        put :update, :id => "1"
        response.should render_template('edit')
      end

  end

  describe "DELETE eliminación" do
    it "Elimina el equipo requerido" do
      EquipmentMiscellaneou.should_receive(:find).with("37").and_return(mock_equipment_miscellaneous)
      mock_equipment_miscellaneous.should_receive(:destroy)
      delete :destroy, :id => "37"
    end

    it "Redirecciona a la lista de categorías" do
      EquipmentMiscellaneou.stub(:find).and_return(mock_equipment_miscellaneous(:destroy => true))
      delete :destroy, :id => "1"
      response.should redirect_to(admin_equipment_miscellaneous_url)
    end
  end


end