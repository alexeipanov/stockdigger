require 'rails_helper'

RSpec.describe PickPositionsJob, type: :job do
	context 'jobs' do
		it 'base job' do
		  expect(PickPositionsJob.perform_now).to eq(true)
		end
	end
end
