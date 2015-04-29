require "rails_helper"

RSpec.describe Api::V1::JobsController, type: :controller do
  describe "POST#create" do
    let(:job) do
      {
        position: "PHP Dev",
        description: "Only the best...",
        source: "http://www.the-internet.com",
        location: "London, UK",
        company: "My company",
        tags: ["C", "R", "Ruby"],
        posting_date: Date.today
      }
    end

    it "can create a new job with no company or date" do
      job[:company] = nil
      job[:posting_date] = nil

      post :create, job: job

      new_job = JSON.parse(response.body)["job"]
      expect(response.status).to eq(201)
      expect(new_job["position"]).to eq("PHP Dev")
      expect(new_job["posting_date"]).to eq(Date.today.strftime("%F"))
      expect(new_job["company"]).not_to be_blank
    end

    it "can create a new job with a date and no company" do
      date = 5.days.ago
      job[:posting_date] = date
      job[:company] = nil

      post :create, job: job
      new_job = JSON.parse(response.body)["job"]

      expect(response.status).to eq(201)
      expect(new_job["position"]).to eq("PHP Dev")
      expect(new_job["posting_date"]).to eq(date.strftime("%F"))
      expect(new_job["company"]).not_to be_blank
    end

    it "returns a 302 status code if existing record" do
      post :create, job: job
      post :create, job: job
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
      job2 = {
        position: "PHP Dev2",
        description: "Only the best...",
        source: "http://www.the-internet.com",
        company: "Zoo"
      }

      post :create, job: job
      post :create, job: job2

      expect(response.status).to eq(201)
      expect(Job.count).to eq(2)
      expect(Company.count).to eq(2)
    end

    it "allows for a company name of an empty string" do
      job[:company] = ""

      post :create, job: job

      expect(response.status).to eq(201)
      expect(Job.count).to eq(1)
      expect(Company.count).to eq(1)
    end

    it "does not duplicate companies with multiple postings" do
      job2 = {
        position: "PHP Dev2",
        description: "Only the best...",
        source: "http://www.the-internet.com",
        company: "My company"
      }

      post :create, job: job
      post :create, job: job2

      expect(response.status).to eq(201)
      expect(Job.count).to eq(2)
      expect(Company.count).to eq(1)
    end

    it "generates tags and associates them with the job" do
      post :create, job: job

      expect(response.status).to eq(201)
      expect(Job.count).to eq(1)
      expect(Job.first.tags.count).to eq(3)
    end

    it "does not duplicate matching tags" do
      job2 = {
        position: "PHP Dev2",
        description: "Only the best...",
        source: "http://www.the-internet.com",
        tags: ["C", "Java"]
      }

      post :create, job: job
      post :create, job: job2

      expect(response.status).to eq(201)
      expect(Job.count).to eq(2)
      expect(Job.first.tags.count).to eq(3)
      expect(Tag.count).to eq(4)
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
      it "#GET api/v1/jobs" do
        5.times { |i| create(:job, position: "Job #{ i * 6 }") }

        get :index
        results = JSON.parse(response.body)["jobs"]

        expect(response.status).to eq(200)
        expect(results.count).to eq(5)
        expect(results).to have_content("Job 24")
      end
    end
  end
end
