json.array!(@resumes) do |resume|
  json.extract! resume, :id, :summary
  json.url resume_url(resume, format: :json)
end
