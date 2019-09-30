require 'csv'

Spree::Admin::ReportsController.class_eval do

  Spree::Admin::ReportsController.add_available_report!(:export_to_quickbooks)

  def export_to_quickbooks
    # params[:q] = {} unless params[:q]

    # params[:q][:completed_at_gt] = if params[:q][:completed_at_gt].blank?
    #                                  Time.zone.now.beginning_of_month
    #                                else
    #                                  begin
    #                                    Time.zone.parse(params[:q][:completed_at_gt]).beginning_of_day
    #                                  rescue StandardError
    #                                    Time.zone.now.beginning_of_month
    #                                  end
    #                                end

    # if params[:q] && !params[:q][:completed_at_lt].blank?
    #   params[:q][:completed_at_lt] = begin
    #                                    Time.zone.parse(params[:q][:completed_at_lt]).end_of_day
    #                                  rescue StandardError
    #                                    ''
    #                                  end
    # end

    # params[:q][:s] ||= 'completed_at desc'

    # @search = Order.complete.ransack(params[:q])
    # @orders = @search.result

    @products = Spree::Product.all

    respond_to do |format|
      format.html
      format.csv do
        attributes = %w{name sku type inventory price}

        csv_output = CSV.generate(headers: true) do |csv|
          csv << attributes

          @products.each do |product|
            csv << [product.name,
                    product.sku,
                    product.tax_category.try(:name),
                    product.total_on_hand,
                    product.price]
          end
        end

        send_data csv_output, filename: "QuickBooks-#{Date.today}.csv"
      end
    end

    # @totals = {}
    # @products.each do |order|
    #   @totals[order.currency] = { item_total: ::Money.new(0, order.currency), adjustment_total: ::Money.new(0, order.currency), sales_total: ::Money.new(0, order.currency) } unless @totals[order.currency]
    #   @totals[order.currency][:item_total] += order.display_item_total.money
    #   @totals[order.currency][:adjustment_total] += order.display_adjustment_total.money
    #   @totals[order.currency][:sales_total] += order.display_total.money
    # end
  end


end
