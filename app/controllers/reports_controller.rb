class ReportsController < ApplicationController

  def index
    
  end
  
  def repair_costs

    if !params[:date_from].nil? && params[:date_from] != "" && !params[:date_to].nil? && params[:date_to] != ""

      @date_from = Date.parse(params[:date_from])
      @date_to = Date.parse(params[:date_to])

      @repairs = Repair.find(:all, :conditions => ["date_in > '#{(@date_from - 1.day).to_s}' and date_in < '#{(@date_to + 1.day).to_s}'"])

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

          csv << ["Fecha", Date.today]
          csv << ["Desde", @date_from]
          csv << ["Hasta", @date_to]
          
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
      @repairs = nil
    end

  end


  def take_out
    @equipments = EquipmentMiscellaneou.take_out

    if(params[:report_format] == "csv")

      csv_string = FasterCSV.generate do |csv|
        # header row

        csv << ["Fecha", Date.today]
        csv << ["Marca", "Modelo", "Nro. Inventario", "Motivo", "Usuario", "Fecha"]

        # data rows
        @equipments.each do |e|
          csv << [e.brand,  e.model, e.inventory_number, e.take_out_reason, e.user.login, e.updated_at]
        end
      end

      # send it to the browsah
      send_data csv_string,
        :type => 'text/csv; charset=iso-8859-1; header=present',
        :disposition => "attachment; filename=take_out_#{Time.now.to_date.to_s}.csv"

    end

  end

  
  def request_repairs
    
    if !params[:date_from].nil? && params[:date_from] != "" && !params[:date_to].nil? && params[:date_to] != ""

      @date_from = Date.parse(params[:date_from]) 
      @date_to = Date.parse(params[:date_to]) 

      @request_repairs = RequestRepair.find(:all, :conditions => ["date > '#{(@date_from - 1.day).to_s}' and date < '#{(@date_to + 1.day).to_s}'"])

      if(params[:report_format] == "csv")


        csv_string = FasterCSV.generate do |csv|
          # header row

          csv << ["Fecha", Date.today]
          csv << ["Desde", @date_from]
          csv << ["Hasta", @date_to]
          
          csv << ["Fecha", "Departamento", "Razón", "Solución", "Genero reparación"]

          # data rows
          @request_repairs.each do |r|
            csv << [r.date, r.department.name, r.reason, r.solution, (r.repair_id == -1) ? "YES" : "NO"]
          end
        end

        # send it to the browsah
        send_data csv_string,
          :type => 'text/csv; charset=iso-8859-1; header=present',
          :disposition => "attachment; filename=cost_repairs_#{Time.now.to_date.to_s}.csv"

      end
      
    else
      @request_repairs = nil
    end

  end

end
