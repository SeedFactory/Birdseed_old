task import: :environment do

  client = Mysql2::Client.new(host: '192.168.2.12', user: 'root')

  contacts = client.query(%[
    SELECT max(id), * FROM contact_contact GROUP BY email;
  ])

  contacts.each do |contact|

    phones = client.query(%[
      SELECT * from contact_phonenumbers WHERE contact_id = #{contact['id']}
    ])

  end

end