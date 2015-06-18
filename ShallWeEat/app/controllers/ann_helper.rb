require 'ruby-fann'
require 'json'

def init_fann
	fann = RubyFann::Shortcut.new(:num_inputs=>4, :num_outputs=>10)
	save_fann(fann)
end

def train_fann
	fann = load_fann
	train = RubyFann::TrainData.new(:filename=>'test.train')
	fann.train_on_data(train, 10000, 20, 0.01)
end

def load_fann
	RubyFann::Standard.new(:filename=>'suggestion_ann.net')
end

def save_fann(fann)
	fann.save('suggestion_ann.net')
end

def run_ann(inputs)
	fann = load_fann
	outputs = fann.run(inputs)
end

def teach(input, desired_output)
	inputs = [input]
	desired_outputs = [desired_output]
	#train_old = Train.all()
	#train_old.each do |td|
	#	parsed = JSON.parse(td.data)
	#	inputs.push(parsed["input"])
	#	desired_outputs.push(parsed["output"])
	#end

	puts(inputs.inspect)
	puts(desired_outputs.inspect)

	train_new = RubyFann::TrainData.new(:inputs=>inputs, :desired_outputs=>desired_outputs)
	fann = load_fann
	fann.train_on_data(train_new, 20, 10, 0.001)
	save_fann(fann)

	#Train.create(data: {:input => input, :output => desired_output}.to_json)
end
