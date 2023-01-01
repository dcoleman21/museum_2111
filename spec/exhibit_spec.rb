require './lib/exhibit'
require './lib/patron'

RSpec.describe Exhibit do 
  describe 'Iteration 1' do
    it 'exists' do 
      exhibit = Exhibit.new({name: "Gems and Minerals", cost: 0})

      expect(exhibit).to be_an_instance_of(Exhibit)
    end

    it 'has attributes' do 
      exhibit = Exhibit.new({name: "Gems and Minerals", cost: 0})

      expect(exhibit.name).to eq("Gems and Minerals")
      expect(exhibit.cost).to eq(0)
    end
  end
end
