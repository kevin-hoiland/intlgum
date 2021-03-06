ActiveAdmin.register Gum do
  
  actions :index, :show, :new, :create, :update, :edit #everything but :delete (simply flag as not visible...)
  
#  collection_action :import_csv, :method => :post do
    # Do some CSV importing work here...
#    redirect_to {:action => :index}, :notice => "CSV imported successfully!"
#  end

  menu :label => "Gums"
  menu :parent => "Product Info"
  
  scope :empty_upc
  scope :inactive
  scope :no_image
  scope :no_description
  scope :no_amazon_link
#  config.per_page = 50
  
#  filter :gums_id, :as => :select, :collection => proc { Gums.all }

  begin
    form(:html => { :multipart => true }) do |f|
      f.inputs "Gums" do
        f.input :active
        f.input :new_release
        f.input :discontinued
        f.input :permalink
        f.input :title
        f.input :upc
        f.input :company
        f.input :brand
        f.input :flavor
        f.input :description
        f.input :note
        f.input :country
        f.input :asin
#        f.input :image, :as => :string
        f.input :image, :as => :file
      end
      f.buttons
    end
  end

  index do
    column :id
#    column :permalink
    column :title
    column "Brand", :brand
    column "Flavor", :flavor
    column "UPC", :upc
    column "Country", :country
    column "Amazon ID", :asin
    default_actions
  end
  
end
