require 'ruby-fann'

def init_fann
	fann = RubyFann::Standard.new(:num_inputs=>4, :hidden_neurons=>[5, 6, 7, 8], :num_outputs=>10)
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

def teach(inputs, desired_outputs)
	train = RubyFann::TrainData.new(:inputs=>inputs, :desired_outputs=>desired_outputs)
	fann = load_fann
	fann.train_on_data(train, 1000, 10, 0.1)
	save_fann(fann)
end
