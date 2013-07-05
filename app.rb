#envionmental stuff, no routing here

before do
  content_type :json
end

#routing begin

get "/all" do
  { success: true, devices: Heater.all }.to_json
end

get "/:id" do
  { success: true, device: Heater[params[:id]].to_h }.to_json
end

post "/:id"  do
  #Moving JSON data into params for comfort
  @data=JSON.parse(request.body.read, symbolize_names: true)
   if @data.kind_of?(Hash)
     @data.each { |key,value| params[key]=value unless params.has_key?(key) }
   end

  heater = Heater[params[:id]]

   if params.has_key?(:temperature)
     heater.temperature= params[:temperature]
   end


   if params.has_key?(:temperature)
     heater.enabled= params[:temperature]
   end
  {success: true, device: heater.to_h}.to_json
end







