require "rails_helper"

RSpec.describe Api::V1::JobsController, type: :controller do
  describe "POST#create" do
    it "can create a new job with no company or date" do
      job = {
        position: "PHP Dev",
        description: "Only the best...",
        source: "http://www.the-internet.com",
        location: "London, UK"
      }
      post :create, job: job

      new_job = JSON.parse(response.body)["job"]
      expect(response.status).to eq(201)
      expect(new_job["position"]).to eq("PHP Dev")
      expect(new_job["posting_date"]).to eq(Date.today.strftime("%F"))
      expect(new_job["company"]).not_to be_blank
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

      new_job = JSON.parse(response.body)["job"]

      expect(response.status).to eq(201)
      expect(new_job["position"]).to eq("PHP Dev")
      expect(new_job["posting_date"]).to eq(date.strftime("%F"))
      expect(new_job["company"]).not_to be_blank
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

      new_job = JSON.parse(response.body)["job"]

      expect(response.status).to eq(302)
      expect(new_job["position"]).to eq("PHP Dev")
      expect(new_job["company"]).not_to be_blank
    end

    it "returns a 422 if invalid job content" do
      job = {
        position: "PHP Dev",
        location: "London, UK"
      }
      post :create, job: job

      expect(response.status).to eq(422)
    end

    it "produces multiple companies after multiple requests" do
      job1 = {
        position: "PHP Dev",
        description: "Only the best...",
        source: "http://www.the-internet.com",
        location: "London, UK"
      }

      job2 = {
        position: "PHP Dev2",
        description: "Only the best...",
        source: "http://www.the-internet.com",
        location: "London, UK",
        company: "My company"
      }

      post :create, job: job1
      post :create, job: job2

      expect(response.status).to eq(201)
      expect(Job.count).to eq(2)
      expect(Company.count).to eq(2)
    end

    it "does not duplicate companies with multiple postings" do
      job1 = {
        position: "PHP Dev",
        description: "Only the best...",
        source: "http://www.the-internet.com",
        location: "London, UK",
        company: "My company"
      }

      job2 = {
        position: "PHP Dev2",
        description: "Only the best...",
        source: "http://www.the-internet.com",
        location: "London, UK",
        company: "My company"
      }

      post :create, job: job1
      post :create, job: job2

      expect(response.status).to eq(201)
      expect(Job.count).to eq(2)
      expect(Company.count).to eq(1)
    end
  end

  context "job not yet created" do
    it "#GET api/v1/jobs" do
      get :index

      expect(response.status).to eq(200)
      expect(JSON.parse(response.body)["jobs"]).to be_empty
    end
  end

  context "existing job" do
    describe "#GET show" do
      let(:job) { create(:job) }

      it "#GET api/v1/jobs/:id" do
        get :show, id: job.id

        results = JSON.parse(response.body)["job"]

        expect(response.status).to eq(200)
        expect(results["id"]).to eq(job.id)
        expect(results["position"]).to eq("Janitor")
        expect(results["company"]).not_to be_blank
      end
    end

    describe "#GET index" do
      before(:all) do
        @jobs = []
        5.times { |i| @jobs << create(:job, position: "Job #{ i * 6 }") }
      end

      it "#GET api/v1/jobs" do
        get :index
        results = JSON.parse(response.body)["jobs"]

        expect(response.status).to eq(200)
        expect(results.count).to eq(5)
        expect(results).to have_content("Job 24")
      end
    end
  end
end
