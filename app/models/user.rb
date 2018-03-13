class User < ApplicationRecord
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  belongs_to :course
  belongs_to :room

  def populate_alimentos
    Dir['/home/vlad/dietwin/ingredientes/*.json'].map { |file|
      json = JSON.parse(File.read(file).as_json)
      alimento = Alimento.new(json)
      if alimento.save!
        puts 'Alimento salvo! Cod: ' + alimento.codAlimento.to_s
      else
        puts 'Falha ao salvar alimento. Cod: ' + alimento.codAlimento.to_s
      end
      #puts json.without('receitas', 'nutrientes', 'marcadores', 'informacaoNutricional')
    }
  end

  def populate_nutrientes
    Dir['/home/vlad/dietwin/ingredientes/*.json'].map { |file|
      json = JSON.parse(File.read(file).as_json)
      json['nutrientes'].each do |nutrientes_json|
        nutriente = Nutriente.new(nutrientes_json)
        nutriente.alimento = Alimento.where(codAlimento: json['codAlimento']).first
        if nutriente.save
          puts '>>>>>============>>>> Nutriente salvo! Cod: ' + nutriente.descricao.to_s
        else
          puts '--------------->>>>>> FALHA ao salvar alimento. Cod: ' + nutriente.descricao.to_s
        end
      end
    }
  end

  def do_request(start_number_count)
    @json_array = []
    count = start_number_count
    RestClient.proxy = "http://felipe.sousa.fs:maicon18@proxy.tjpi.jus.br:3128"
    5.times do
      200.times do
        begin
          @response = RestClient::Request.execute(method: :get,
                                                  url: 'https://app.dietwin.com.br/api/my/receitas/'+count.to_s+'/false',
                                                  headers: {accept: 'application/json', authorization: 'Bearer eyJhbGciOiJSUzI1NiIsImtpZCI6IjI0QjI1NUIwMkRGOEJGNDZFNTQwMDYwNzIwQkQ1OEYxQTY4OTMzNjQiLCJ0eXAiOiJKV1QifQ.eyJ1bmlxdWVfbmFtZSI6ImVsaWVpZGUiLCJzdWIiOiJzb2FyZXNlbGllaWRlQGdtYWlsLmNvbSIsImNvZFVzdWFyaW8iOiIxMDE5MTE5Iiwicm9sZSI6IlVzdWFyaW8iLCJ0b2tlbl91c2FnZSI6ImlkX3Rva2VuIiwianRpIjoiYzdkYTdhMzUtYjgzMC00MDA4LWI4ZTYtNzRjY2IxNzRlMzQzIiwiYXVkIjoiZGlldHdpbiIsImF0X2hhc2giOiIxTzZha3VqdDA2NjM3QmpHZHpsVmV3IiwiYXpwIjoiZGlldHdpbiIsIm5iZiI6MTUxOTk5MjQ1MywiZXhwIjoxNTIwMDM1NjUzLCJpYXQiOjE1MTk5OTI0NTMsImlzcyI6Imh0dHBzOi8vYXBwLmRpZXR3aW4uY29tLmJyLyJ9.kQ8EMYJXsIBF0dnU15zB0l1HTAPwQoAwaGsHXPLjC0OAPo0y2YrJfSDlLbfha97tLiij6bJDAbeAp_buBHT2Xd3FjybpvAaD9EASyUCUMkX4kHjMshEhOQynXICSCKad2AiDpwvjv1fKh4N1RbuHgqOoaE6sSO8cQC9kLCSiKI57LMzebP7zperiEMzVEThMb8swcT0iu7xz4_o2TwZpkPOf_VeEzmTJUr_9gb_D3jVinvftgKm7H0NSBSQTKVFXB79nEo6vQiJrnqeP_ps27TwsY3DL9LVZt2f-QCKmK3iCEYxjZt2by9AfbO6dlXUHgeCW9kcrXtPklHBgMup93AcVvh0EntU_i7hQeaTVcyTq1Vfg0L42DRGnI_1LV6SPR-yQZDlB6jSYQRvKQ0IgqoCVcpiIKY7StPVSg3GaIL9U3AbgE2jTS2mzT11q8lPGBGRWtF8HQoe389343mipRWlq8tXRcU5snZlXXHg7mdhDyvgqoW9CWw7DPerrScUJD3qdMVRjOKcXmWE_HgLLxNWTAiAxcRu7JYaQ_iDtqtsNGmgDbIJH8-wnQuW5leB53tQPvkp3c0K2tCgxq1WN29ZngYmSS2qd2wGVle77RqlKDyoyHmSnfxvT7Du5NHbJnRtmL0HeGXurKIYA_mgKuq2DNyTSbun_Ex8naXOS17E'})
        rescue RestClient::ExceptionWithResponse => e
          @response = ''
        end
        @json_array << @response.as_json
        if @response != ''
          File.open("/home/vlad/dietwin/receitas/receita_#{count.to_s}.json", "w") do |f|
            f.write(@response.as_json)
            puts "Escrito JSON numero " + count.to_s
          end
        else
          puts count.to_s + " não encontrado."
        end
        count = count+1
      end
    end
  end
end
