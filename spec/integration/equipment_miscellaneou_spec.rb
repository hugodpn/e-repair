require 'spec_helper'

describe "TEST DE INTEGRACION: Equipment Miscellaneous" do

  fixtures :users
  setup :activate_authlogic # run before tests are executed

  before(:each) do
    UserSession.create(users(:admin)) # logs a user in

    @valid_attributes = {
      :brand => "ACME",
      :inventory_number => 123,
      :equipment_type_id => 1,
      :equipment_location_id => 1,
      :department_id => 1
    }

  end

  
  describe "Se agrega nuevo equipo" do

    it "NEW: Se crea un nuevo equipo" do

      @count_in = EquipmentMiscellaneou.find(:all).size
      
      @eq = EquipmentMiscellaneou.create(@valid_attributes)
      @eq.inventory_number = @count_in
      @eq.save!

      @count_out = EquipmentMiscellaneou.find(:all).size

      assert_equal @count_in + 1, @count_out
      
    end

    it "LIST: Se verifica que el mismo ha sido creado y aparece al listarlo" do
    end

  end

  describe "Se elimina un equipo determinado" do

    it "DESTROY: Se elimina un equipo determinado" do
    end

    it "LIST: Se verifica que el mismo ha sido eliminado y no aparece al listarlo" do
    end

    it "REPORT: se verifica que aparece en los reportes de equipos" do
    end

  end


end