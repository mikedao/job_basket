require "rails_helper"

RSpec.describe Api::JobsController, type: :controller do
  describe "POST#create" do
    it "can create a new job with no company or date" do
      job = {
        position: "PHP Dev",
        description: "Only the best...",
        source: "http://www.the-internet.com",
        location: "London, UK"
      }
      post :create, job: job

      new_job = JSON.parse(response.body)

      expect(response.status).to eq(201)
      expect(new_job["position"]).to eq("PHP Dev")
      expect(new_job["posting_date"]).to eq(Date.today.strftime("%F"))
    end

    it "can create a new job with a date and no company" do
      date = 5.days.ago
      job = {
        position: "PHP Dev",
        description: "Only the best...",
        source: "http://www.the-internet.com",
        location: "London, UK",
        posting_date: date
      }
      post :create, job: job

      new_job = JSON.parse(response.body)

      expect(response.status).to eq(201)
      expect(new_job["position"]).to eq("PHP Dev")
      expect(new_job["posting_date"]).to eq(date.strftime("%F"))
    end

    it "returns a 302 status code if existing record" do
      create(:job, position: "PHP Dev",
                   description: "Only the best...",
                   source: "http://www.the-internet.com",
                   location: "London, UK")

      dup_job = {
        position: "PHP Dev",
        description: "Only the best...",
        source: "http://www.the-internet.com",
        location: "London, UK"
      }
      post :create, job: dup_job

      new_job = JSON.parse(response.body)

      expect(response.status).to eq(302)
      expect(new_job["position"]).to eq("PHP Dev")
    end

    it "returns a 422 if invalid job content" do
      job = {
        position: "PHP Dev",
        location: "London, UK"
      }
      post :create, job: job

      expect(response.status).to eq(422)
    end
  end
end
