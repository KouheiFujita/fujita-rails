json.extract! report, :id, :entry_date, :user_id, :report, :created_at, :updated_at
json.url report_url(report, format: :json)
