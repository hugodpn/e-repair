require 'spec_helper'

describe EquipmentMiscellaneou, "Probando el model de datos" do

  before(:each) do
    @valid_attributes = {
      :brand => "ACME",
      :inventory_number => 123,
      :equipment_type_id => 1,
      :equipment_location_id => 1,
      :department_id => 1
    }
  end

  it "Se verifica que es posible agregar un equipo con los atributos requeridos" do
    puts "*** Atributos requeridos y válidos: " + @valid_attributes.inspect
    @equipment = EquipmentMiscellaneou.new(@valid_attributes)
    @equipment.should be_valid
  end

  it "Se verifica que si se ingresa un equipo sin atributos el mismo no es valido" do
    @equipment = EquipmentMiscellaneou.new
    @equipment.should_not be_valid
  end

  it "Se verifica que es requerido el \"Numero de Inventario\", de lo contrario falla" do
    @valid_attributes.delete :inventory_number
    @equipment = EquipmentMiscellaneou.new(@valid_attributes)
    @equipment.should_not be_valid
  end

  it "Se verifica que es requerido la \"Marca del equipo\", de lo contrario falla" do
    @valid_attributes.delete :brand
    @equipment = EquipmentMiscellaneou.new(@valid_attributes)
    @equipment.should_not be_valid
  end

  it "Se verifica \"Numvero de Inventario\" debe ser numérico, de lo contrario falla" do
    @equipment = EquipmentMiscellaneou.new(@valid_attributes)
    @equipment.inventory_number = "123a"
    @equipment.should_not be_valid
  end

  it "Se verifica que es requerido el \"Tipo de Equipo\", de lo contrario falla" do
    @valid_attributes.delete :equipment_type_id
    @equipment = EquipmentMiscellaneou.new(@valid_attributes)
    @equipment.should_not be_valid
  end

  it "Se verifica que es requerida la \"Ubicación\", de lo contrario falla" do
    @valid_attributes.delete :equipment_location_id
    @equipment = EquipmentMiscellaneou.new(@valid_attributes)
    @equipment.should_not be_valid
  end

  it "Se verifica que es requerido el \"Departamento\", de lo contrario falla" do
    @valid_attributes.delete :department_id
    @equipment = EquipmentMiscellaneou.new(@valid_attributes)
    @equipment.should_not be_valid
  end

end
