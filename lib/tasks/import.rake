task import: :environment do

  require 'csv'
  require 'aws-sdk'

  filename = File.join(File.dirname(__FILE__), 'products.csv')
  csv = CSV.open(filename, headers: true)

  taxonomy = Spree::Taxonomy.find_or_create_by(name: 'Tier')

  s3 = AWS::S3.new
  objects = s3.buckets['seedfactory'].objects

  csv.each do |row|

    next unless row['name'].present?

    product = Spree::Product.create({
      name: row['name'],
      price: row['price'].try(:sub, '$', ''),
      description: row['description'],
      available_on: Time.now,
      weight: row['weight'],
      sku: row['number']
    })

    product.taxons << Spree::Taxon.create(taxonomy: taxonomy, name: row['class'])

    if jpeg = row['jpeg']
      Spree::Image.create(attachment: objects[jpeg].url_for(:read), viewable: product)
    end

  end

end