require 'spec_helper'

describe Category, "Probando el model de datos" do

  before(:each) do
    @valid_attributes = {
      :name => "CATEGORY NAME"
    }
  end

  it "Se verifica que es posible agregar un categoria con los atributos requeridos" do
    puts "*** Atributos requeridos y válidos: " + @valid_attributes.inspect
    @category = Category.new(@valid_attributes)
    @category.should be_valid
  end

  it "Se verifica que si se ingresa una categoria sin atributos la misma no es valida" do
    @category = Category.new
    @category.should_not be_valid
  end
  
  it "Se verifica que es requerido el \"Nombre\", de lo contrario falla" do
    @valid_attributes.delete :name
    @category = Category.new(@valid_attributes)
    @category.should_not be_valid
  end

end
