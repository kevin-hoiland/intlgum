ActiveAdmin.register Shipment do
  menu :label => "Shipments"
  menu :parent => "Product Info"

  index do
    column :id
    column :date
    column :product_cost, :sortable => :product_cost do |shipment|
      div :class => "price" do
        number_to_currency shipment.product_cost
      end
    end
    column :shipping_cost, :sortable => :shipping_cost do |shipment|
      div :class => "price" do
        number_to_currency shipment.shipping_cost
      end
    end
    column :labor_cost, :sortable => :labor_cost do |shipment|
      div :class => "price" do
        number_to_currency shipment.labor_cost
      end
    end
    column :sales_tax_cost, :sortable => :sales_tax_cost do |shipment|
      div :class => "price" do
        number_to_currency shipment.sales_tax_cost
      end
    end
    column :donations_cost, :sortable => :donations_cost do |shipment|
      div :class => "price" do
        number_to_currency shipment.donations_cost
      end
    end
    column :other_costs, :sortable => :other_costs do |shipment|
      div :class => "price" do
        number_to_currency shipment.other_costs
      end
    end
    column :income, :sortable => :income do |shipment|
      div :class => "price" do
        number_to_currency shipment.income
      end
    end
    column :profit, :sortable => :profit do |shipment|
      div :class => "price" do
        number_to_currency shipment.profit
      end
    end
#    column "Created At", :created_at
#    column "Last Updated", :updated_at
    default_actions
  end


=begin  
  form do |f|
    f.inputs "Edit Shipment" do
      f.input :date
      f.input :product_cost
    end
    f.buttons
  end
=end

    
=begin
  form do |f|
        f.inputs "Details" do
          f.input :id
          f.input :product_cost
          f.input :gums # don't forget this one!
        end  
  end
=end
  
=begin
  form do |f|
    f.inputs

    f.has_many :associations do |association|
       association.inputs
    end

    f.buttons
  end
=end
  
end
