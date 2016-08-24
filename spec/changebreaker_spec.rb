require_relative '../changebreaker'

RSpec.describe ChangeBreaker do
  subject(:changebreaker) { ChangeBreaker.new }
  describe '#change' do
    it 'returns an array' do
      cb = ChangeBreaker.new('24','50')
      expect(cb.change.class).to eq(Array)
    end
  end

  describe 'make_change' do
    it 'returns correct change.' do
      cb = ChangeBreaker.new('52.24','100.00')
      cb.make_change
      expect(cb.change).to eq([20.0,20.0,5.0,1.0,1.0,0.5,0.25,0.01,])
    end

    it 'returns correct change given crappy values' do
      cb = ChangeBreaker.new('52.24','100')
      cb.make_change
      expect(cb.change).to eq([20.0,20.0,5.0,1.0,1.0,0.5,0.25,0.01,])

      cb = ChangeBreaker.new('52.2','100')
      cb.make_change
      expect(cb.change).to eq([20.0,20.0,5.0,1.0,1.0,0.5,0.25,0.05,])


      cb = ChangeBreaker.new('52.220','100')
      cb.make_change
      expect(cb.change).to eq([20.0,20.0,5.0,1.0,1.0,0.5,0.25,0.01,0.01,0.01,])
    end
  end
end
