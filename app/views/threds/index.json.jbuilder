json.array!(@threds) do |thred|
  json.extract! thred, 
  json.url thred_url(thred, format: :json)
end
