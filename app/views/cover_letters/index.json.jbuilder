json.array!(@cover_letters) do |cover_letter|
  json.extract! cover_letter, :id, :text
  json.url cover_letter_url(cover_letter, format: :json)
end
