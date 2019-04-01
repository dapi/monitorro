class Admin::ExchangesController < Admin::ApplicationController
  EDIT_COLUMNS = [:id, :name, :url, :xml_url, :is_available]

  def index
    render locals: {
      exchanges: exchanges,
      q: q,
      columns: EDIT_COLUMNS
    }
  end

  #def new
    #render locals: {
      #exchange: Gera::PaymentSystem.new,
      #columns: EDIT_COLUMNS
    #}
  #end

  #def create
    #Gera::PaymentSystem.create! permitted_params
  #rescue ActiveRecord::RecordInvalid => e
    #render :new, locals: {
      #exchange: e.record,
      #columns: EDIT_COLUMNS
    #}
  #end

  def update
    respond_to do |format|
      if exchange.update_attributes permitted_params
        format.html { redirect_to(admin_exchanges_path, notice: "#{exchange.name} обновлен") }
        format.json { respond_with_bip(exchange) }
      else
        format.html { render action: 'edit', locals: { exchange: exchange, columns: EDIT_COLUMNS } }
        format.json { respond_with_bip(exchange) }
      end
    end
  end

  private

  def exchange
    @exchange ||= Exchange.find params[:id]
  end

  def q
    @q ||= Exchange.ransack(params[:q])
  end

  def exchanges
    q.result
  end

  def permitted_params
    params[:exchange].permit!
  end
end