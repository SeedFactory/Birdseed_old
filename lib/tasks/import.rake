task import: :environment do

  client = Mysql2::Client.new(host: 'localhost', user: 'root')

  results = client.query(%[
    SELECT max(id), * FROM contact_contact GROUP BY email;
  ])

  print results

end