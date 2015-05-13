require 'ruby-fann'

def init_fann
	fann = RubyFann::Standard.new(:num_inputs=>3, :hidden_neurons=>[3, 4, 3, 4], :num_outputs=>10)
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
