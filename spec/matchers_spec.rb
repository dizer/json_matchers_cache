require 'benchmark'

describe "GET /locations" do

  context 'single' do
    let(:body) { { "latitude": 1, "longitude": 1 } }
    it do
      n        = 1000
      measured = Benchmark.measure do
        n.times do
          expect(body).to match_json_schema("single/location")
        end
      end
      p measured.total
    end
  end

  context 'multiple' do
    let(:size) { 10 }
    it do
      body = {}
      (1..size).each do |i|
        body["obj-#{i}"] = {
            "field": "value"
        }
      end

      n        = 1000
      measured = Benchmark.measure do
        n.times do
          expect(body).to match_json_schema("multiple/index")
        end
      end
      p measured.total

    end
  end


end