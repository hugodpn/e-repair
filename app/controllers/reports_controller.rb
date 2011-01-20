class ReportsController < ApplicationController

  def index
    
  end
  
  def repair_costs

    if !params[:date_from].nil? && params[:date_from] != "" && !params[:date_to].nil? && params[:date_to] != ""

      date_from = Date.parse(params[:date_from])
      date_to = Date.parse(params[:date_to])

      @repairs = Repair.find(:all, :conditions => ["date_in >= '#{date_from.to_s}' and date_in <= '#{date_to.to_s}'"])

      @costs = 0
      @outsource_costs = 0
      @repairs.each do |r|
        @costs = @costs + r.cost unless r.cost.nil?
        @outsource_costs = @outsource_costs +  r.outsource_cost unless r.outsource_cost.nil?
      end

      @costs =0 if @costs.nil?
      @outsource_costs =0 if @outsource_costs.nil?

      if(params[:report_format] == "csv")

        csv_string = FasterCSV.generate do |csv|
          # header row
          csv << ["Fecha Ingreso", "Fecha Salida", "Equipo", "Nro. Inventario", "Costo", "Costo tercerización"]

          # data rows
          @repairs.each do |r|
            csv << [r.date_in, r.date_out, r.equipment_miscellaneou.brand,
              r.equipment_miscellaneou.inventory_number, r.cost, r.outsource_cost]
          end
        end

        # send it to the browsah
        send_data csv_string,
          :type => 'text/csv; charset=iso-8859-1; header=present',
          :disposition => "attachment; filename=cost_repairs_#{Time.now.to_date.to_s}.csv"

      end
      
    else
      puts "aca"
      @repairs = nil
    end

  end


  def take_out
    @equipments = EquipmentMiscellaneou.take_out
  end

end
